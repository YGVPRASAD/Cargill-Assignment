# Use AWS Terraform provider
provider "aws" {
  region = "${var.AWS_REGION}"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

# VPC
resource "aws_vpc" "myVPC" {
    cidr_block = "10.20.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "myVPC"
    }
}


# Subnets
resource "aws_subnet" "myVPC-public-1" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "10.20.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags = {
        Name = "myVPC-public-1"
    }
}

resource "aws_subnet" "myVPC-private-1" {
    vpc_id = "${aws_vpc.myVPC.id}"
    cidr_block = "10.20.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"

    tags = {
        Name = "myVPC-private-1"
    }
}


# Internet GW
resource "aws_internet_gateway" "myIGW" {
    vpc_id = "${aws_vpc.myVPC.id}"

    tags = {
        Name = "myIGW"
    }
}

# vpc peering
## here vpc_id is jenkins vpc
resource "aws_vpc_peering_connection" "jenkins-nginx" {
    peer_vpc_id   = "${aws_vpc.myVPC.id}"
    vpc_id        = "vpc-0993ddca304a20577"
    auto_accept   = true
    accepter {
        allow_remote_vpc_dns_resolution = true
    }
    requester {
        allow_remote_vpc_dns_resolution = true
    }
    tags = {
        Name = "jenkins-nginx"
    }

}

# adding route to jenkins route table
resource "aws_route" "jenkins-route" {
    route_table_id            = "rtb-098b917dbc5d4773f"
    destination_cidr_block    = "10.20.0.0/16"
    vpc_peering_connection_id = "${aws_vpc_peering_connection.jenkins-nginx.id}"
}

# route tables
resource "aws_route_table" "myRT-public" {
    vpc_id = "${aws_vpc.myVPC.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.myIGW.id}"
    }
    route {
        cidr_block = "10.0.0.0/16"
        gateway_id = "${aws_vpc_peering_connection.jenkins-nginx.id}"
    }

    tags = {
        Name = "myRT-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "myRTA-public-1-a" {
    subnet_id = "${aws_subnet.myVPC-public-1.id}"
    route_table_id = "${aws_route_table.myRT-public.id}"
}

# nat gw
resource "aws_eip" "myNAT" {
    vpc      = true
    tags = {
        Name = "myNAT"
    }
}
resource "aws_nat_gateway" "natGT" {
    allocation_id = "${aws_eip.myNAT.id}"
    subnet_id = "${aws_subnet.myVPC-public-1.id}"
    depends_on = ["aws_internet_gateway.myIGW"]
}

# VPC setup for NAT
resource "aws_route_table" "myRT-NAT-private" {
    vpc_id = "${aws_vpc.myVPC.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.natGT.id}"
    }

    tags = {
        Name = "myRT-NAT-private"
    }
}
# route associations private
resource "aws_route_table_association" "myRTA-private-1-a" {
    subnet_id = "${aws_subnet.myVPC-private-1.id}"
    route_table_id = "${aws_route_table.myRT-NAT-private.id}"
}

# Security Group
resource "aws_security_group" "mySG" {
    vpc_id = "${aws_vpc.myVPC.id}"
    name = "mySG"
    description = "security group that allows ssh and all egress traffic"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    } 
  
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["103.99.8.0/24"]
    } 
  

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["10.0.0.0/16"]
    } 
    tags = {
        Name = "mySG"
    }
}

# EC2 Instance
resource "aws_instance" "my-ec2-1" {
    ami = "ami-0c2b8ca1dad447f8a"
    instance_type = "t2.medium"
    # the VPC subnet
    subnet_id = "${aws_subnet.myVPC-public-1.id}"
    # the security group
    vpc_security_group_ids = ["${aws_security_group.mySG.id}"]
    associate_public_ip_address = true
    # the public SSH key
    key_name = "VARA-NOV"
    root_block_device {
        volume_type           = "gp2"
        volume_size           = "30"
        delete_on_termination = "true"
    }
    user_data=<<-EOF
        #!/bin/bash
        sudo yum-config-manager --disable docker-ce-stable
        sudo yum update -y
        sudo yum upgrade -y
        sudo yum remove docker docker-common docker-selinux docker-engine -y
        sudo yum install vim epel-release yum-utils device-mapper-persistent-data lvm2 -y
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
        sudo yum-config-manager --disable docker-ce-stable
        sudo yum install docker -y
        sudo systemctl enable docker.service
        sudo systemctl start docker.service
        echo "alias docker='sudo docker'" >> ~/.bashrc
        sudo hostnamectl set-hostname docker
        sudo groupadd docker
        sudo usermod -aG docker $USER
        EOF
    tags = {
        Name = "my-ec2-1"
    }
}

resource "null_resource" "configure_nginx" {

        connection {
        user        = "ec2-user"
        type        = "ssh"
        host        = "${aws_instance.my-ec2-1.private_ip}"
        private_key = "${file("VARA-NOV.pem")}"
        }
  
    provisioner "remote-exec" {
        inline = [
            "sleep 5m",
            "sudo docker pull 8452/nginxweb:vara",
            "sudo docker run -d --name nginxweb -p 8081:80 8452/nginxweb:vara",
            "echo $BUILD_NUMBER"
        ]
    }

}
