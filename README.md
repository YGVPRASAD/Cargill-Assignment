# Cargill Assignment
#This is about Nginx continer automation using CI/CD pipeline

NOTE: Please replace the pam file before exicuting the job.

Requiremets to before executing the pipeline
--------------------------------------------
Required jekins plugins to execute the code in jenkins

* Docker Plugin
* Terrform Plugin
* Workspace Cleanup Plugin
* Credentials Binding Plugin
* AnsiColor Plugin
* GitHub Plugin
* Pipeline Plugin
* CloudBees AWS Credentials Plugin
* aws-cli in Jenkins console

Credentials configuration in Jenkins UI
---------------------------------------

Step 1: - Add AWS Access Key and Secret Key in Jenkins UI

Step 2: - Add Docker Hub Credentials in Jenkins UI as shown below

![image](https://user-images.githubusercontent.com/55577916/128598669-cd5ab0b0-abbf-49b7-b667-8fbf0279f47c.png)

Step 3: - Create a Multibranch pipeline job in Jenkins

Step 4: - Configure Github repository in Jenkins job

![image](https://user-images.githubusercontent.com/55577916/128598742-3c2ce015-0e8e-4d55-bf16-a8793fcc3ea6.png)

![image](https://user-images.githubusercontent.com/55577916/128598756-6aade739-1e1a-4d77-a1c7-15a18d5726c1.png)

Step 5: - Execute the Job. Please find the example output logs below

![image](https://user-images.githubusercontent.com/55577916/128599026-7ff6305b-eb7f-45eb-8958-0b0585170849.png)


<details>
  <summary>Output</summary>
  <p>
        Branch indexing
        Connecting to https://api.github.com with no credentials, anonymous access
        Obtained assignment/Jenkinsfile from c4da16aedd3dc320b54012f7e68fcc229602cd5c
        Running in Durability level: MAX_SURVIVABILITY
        [Pipeline] Start of Pipeline
        [Pipeline] stage
        [Pipeline] { (checkout)
        [Pipeline] node
        Running on Jenkins in /var/lib/jenkins/workspace/Terraform-nginx_main
        [Pipeline] {
        [Pipeline] cleanWs
        [WS-CLEANUP] Deleting project workspace...
        [WS-CLEANUP] Deferred wipeout is used...
        [WS-CLEANUP] done
        [Pipeline] checkout
        The recommended git tool is: NONE
        No credentials specified
        Cloning the remote Git repository
        Cloning with configured refspecs honoured and without tags
        Cloning repository https://github.com/YGVPRASAD/Cargill-Assignment.git
        > git init /var/lib/jenkins/workspace/Terraform-nginx_main # timeout=10
        Fetching upstream changes from https://github.com/YGVPRASAD/Cargill-Assignment.git
        > git --version # timeout=10
        > git --version # 'git version 2.17.1'
        > git fetch --no-tags --progress -- https://github.com/YGVPRASAD/Cargill-Assignment.git +refs/heads/main:refs/remotes/origin/main # timeout=10
        > git config remote.origin.url https://github.com/YGVPRASAD/Cargill-Assignment.git # timeout=10
        > git config --add remote.origin.fetch +refs/heads/main:refs/remotes/origin/main # timeout=10
        Avoid second fetch
        Checking out Revision c4da16aedd3dc320b54012f7e68fcc229602cd5c (main)
        > git config core.sparsecheckout # timeout=10
        > git checkout -f c4da16aedd3dc320b54012f7e68fcc229602cd5c # timeout=10
        Commit message: "Update ec2_instance.tf"
        > git rev-list --no-walk ebdf228c113693fa3a0f4229a9a7c1e77f12de1b # timeout=10
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Building_nginx_image)
        [Pipeline] node
        Running on Jenkins in /var/lib/jenkins/workspace/Terraform-nginx_main
        [Pipeline] {
        [Pipeline] sh
        + cd assignment
        + echo alias docker='sudo docker'
        + sudo usermod -aG docker jenkins
        + sudo chmod 777 /var/run/docker.sock
        + docker build -t 8452/nginxweb:vara .
        Sending build context to Docker daemon  15.36kB

        Step 1/8 : FROM centos
        ---> 300e315adb2f
        Step 2/8 : MAINTAINER ygvprasad@gmail.com
        ---> Running in 7060ead52602
        Removing intermediate container 7060ead52602
        ---> f46ac7411984
        Step 3/8 : RUN yum -y install epel-release
        ---> Running in 07fe889d0350
        CentOS Linux 8 - AppStream                       26 MB/s | 8.4 MB     00:00    
        CentOS Linux 8 - BaseOS                          33 MB/s | 4.5 MB     00:00    
        CentOS Linux 8 - Extras                          58 kB/s |  10 kB     00:00    
        Dependencies resolved.
        ================================================================================
        Package               Architecture    Version            Repository       Size
        ================================================================================
        Installing:
        epel-release          noarch          8-11.el8           extras           24 k

        Transaction Summary
        ================================================================================
        Install  1 Package

        Total download size: 24 k
        Installed size: 35 k
        Downloading Packages:
        epel-release-8-11.el8.noarch.rpm                4.7 MB/s |  24 kB     00:00    
        --------------------------------------------------------------------------------
        Total                                           753 kB/s |  24 kB     00:00     
        [91mwarning: /var/cache/dnf/extras-cbfb2f07b0021b7e/packages/epel-release-8-11.el8.noarch.rpm: Header V3 RSA/SHA256 Signature, key ID 8483c65d: NOKEY
        [0mCentOS Linux 8 - Extras                         1.6 MB/s | 1.6 kB     00:00    
        [91mImporting GPG key 0x8483C65D:
        Userid     : "CentOS (CentOS Official Signing Key) <security@centos.org>"
        Fingerprint: 99DB 70FA E1D7 CE22 7FB6 4882 05B5 55B3 8483 C65D
        From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
        [0mKey imported successfully
        Running transaction check
        Transaction check succeeded.
        Running transaction test
        Transaction test succeeded.
        Running transaction
        Preparing        :                                                        1/1 
        Installing       : epel-release-8-11.el8.noarch                           1/1 
        Running scriptlet: epel-release-8-11.el8.noarch                           1/1 
        Verifying        : epel-release-8-11.el8.noarch                           1/1 

        Installed:
        epel-release-8-11.el8.noarch                                                  

        Complete!
        Removing intermediate container 07fe889d0350
        ---> c45c9ae8b369
        Step 4/8 : RUN yum -y update
        ---> Running in 46a1755090c7
        Extra Packages for Enterprise Linux Modular 8 - 9.7 MB/s | 927 kB     00:00    
        Extra Packages for Enterprise Linux 8 - x86_64   51 MB/s |  10 MB     00:00    
        Dependencies resolved.
        ================================================================================
        Package                     Arch   Version                     Repo       Size
        ================================================================================
        Upgrading:
        bash                        x86_64 4.4.20-1.el8_4              baseos    1.5 M
        bind-export-libs            x86_64 32:9.11.26-4.el8_4          baseos    1.1 M
        binutils                    x86_64 2.30-93.el8                 baseos    5.8 M
        centos-linux-release        noarch 8.4-1.2105.el8              baseos     22 k
        cpio                        x86_64 2.12-10.el8                 baseos    265 k
        crypto-policies             noarch 20210209-1.gitbfb6bed.el8_3 baseos     62 k
        cryptsetup-libs             x86_64 2.3.3-4.el8                 baseos    470 k
        curl                        x86_64 7.61.1-18.el8               baseos    353 k
        dbus                        x86_64 1:1.12.8-12.el8_4.2         baseos     41 k
        dbus-common                 noarch 1:1.12.8-12.el8_4.2         baseos     46 k
        dbus-daemon                 x86_64 1:1.12.8-12.el8_4.2         baseos    240 k
        dbus-libs                   x86_64 1:1.12.8-12.el8_4.2         baseos    184 k
        dbus-tools                  x86_64 1:1.12.8-12.el8_4.2         baseos     85 k
        device-mapper               x86_64 8:1.02.175-5.el8            baseos    375 k
        device-mapper-libs          x86_64 8:1.02.175-5.el8            baseos    408 k
        dhcp-client                 x86_64 12:4.3.6-44.0.1.el8         baseos    318 k
        dhcp-common                 noarch 12:4.3.6-44.0.1.el8         baseos    207 k
        dhcp-libs                   x86_64 12:4.3.6-44.0.1.el8         baseos    148 k
        dnf                         noarch 4.4.2-11.el8                baseos    539 k
        dnf-data                    noarch 4.4.2-11.el8                baseos    152 k
        dracut                      x86_64 049-135.git20210121.el8     baseos    372 k
        dracut-network              x86_64 049-135.git20210121.el8     baseos    105 k
        dracut-squash               x86_64 049-135.git20210121.el8     baseos     58 k
        elfutils-default-yama-scope noarch 0.182-3.el8                 baseos     49 k
        elfutils-libelf             x86_64 0.182-3.el8                 baseos    216 k
        elfutils-libs               x86_64 0.182-3.el8                 baseos    293 k
        ethtool                     x86_64 2:5.8-5.el8                 baseos    206 k
        file-libs                   x86_64 5.33-16.el8_3.1             baseos    543 k
        gawk                        x86_64 4.2.1-2.el8                 baseos    1.1 M
        glib2                       x86_64 2.56.4-10.el8_4             baseos    2.5 M
        glibc                       x86_64 2.28-151.el8                baseos    3.6 M
        glibc-common                x86_64 2.28-151.el8                baseos    1.3 M
        glibc-minimal-langpack      x86_64 2.28-151.el8                baseos     56 k
        gnutls                      x86_64 3.6.14-8.el8_3              baseos    1.0 M
        gpgme                       x86_64 1.13.1-7.el8                baseos    336 k
        gzip                        x86_64 1.9-12.el8                  baseos    167 k
        ima-evm-utils               x86_64 1.3.2-12.el8                baseos     64 k
        iproute                     x86_64 5.9.0-4.el8                 baseos    692 k
        iptables-libs               x86_64 1.8.4-17.el8                baseos    107 k
        iputils                     x86_64 20180629-7.el8              baseos    148 k
        json-c                      x86_64 0.13.1-0.4.el8              baseos     40 k
        kexec-tools                 x86_64 2.0.20-46.el8_4.1           baseos    508 k
        kmod                        x86_64 25-17.el8                   baseos    126 k
        kmod-libs                   x86_64 25-17.el8                   baseos     68 k
        krb5-libs                   x86_64 1.18.2-8.el8                baseos    838 k
        libarchive                  x86_64 3.3.3-1.el8                 baseos    359 k
        libblkid                    x86_64 2.32.1-27.el8               baseos    217 k
        libcomps                    x86_64 0.1.11-5.el8                baseos     81 k
        libcurl-minimal             x86_64 7.61.1-18.el8               baseos    286 k
        libdb                       x86_64 5.3.28-40.el8               baseos    751 k
        libdb-utils                 x86_64 5.3.28-40.el8               baseos    150 k
        libdnf                      x86_64 0.55.0-7.el8                baseos    681 k
        libfdisk                    x86_64 2.32.1-27.el8               baseos    250 k
        libgcc                      x86_64 8.4.1-1.el8                 baseos     78 k
        libmount                    x86_64 2.32.1-27.el8               baseos    233 k
        libpcap                     x86_64 14:1.9.1-5.el8              baseos    169 k
        libpwquality                x86_64 1.4.4-3.el8                 baseos    107 k
        librepo                     x86_64 1.12.0-3.el8                baseos     91 k
        libseccomp                  x86_64 2.5.1-1.el8                 baseos     71 k
        libselinux                  x86_64 2.9-5.el8                   baseos    165 k
        libsemanage                 x86_64 2.9-6.el8                   baseos    165 k
        libsepol                    x86_64 2.9-2.el8                   baseos    339 k
        libsmartcols                x86_64 2.32.1-27.el8               baseos    176 k
        libsolv                     x86_64 0.7.16-2.el8                baseos    362 k
        libstdc++                   x86_64 8.4.1-1.el8                 baseos    451 k
        libuuid                     x86_64 2.32.1-27.el8               baseos     95 k
        libxml2                     x86_64 2.9.7-9.el8_4.2             baseos    696 k
        lz4-libs                    x86_64 1.8.3-3.el8_4               baseos     66 k
        nettle                      x86_64 3.4.1-4.el8_3               baseos    301 k
        openldap                    x86_64 2.4.46-17.el8_4             baseos    351 k
        openssl-libs                x86_64 1:1.1.1g-15.el8_3           baseos    1.5 M
        p11-kit                     x86_64 0.23.22-1.el8               baseos    324 k
        p11-kit-trust               x86_64 0.23.22-1.el8               baseos    137 k
        pam                         x86_64 1.3.1-14.el8                baseos    738 k
        platform-python             x86_64 3.6.8-37.el8                baseos     84 k
        popt                        x86_64 1.18-1.el8                  baseos     61 k
        procps-ng                   x86_64 3.3.15-6.el8                baseos    329 k
        python3-dnf                 noarch 4.4.2-11.el8                baseos    541 k
        python3-gpg                 x86_64 1.13.1-7.el8                baseos    245 k
        python3-hawkey              x86_64 0.55.0-7.el8                baseos    114 k
        python3-libcomps            x86_64 0.1.11-5.el8                baseos     52 k
        python3-libdnf              x86_64 0.55.0-7.el8                baseos    769 k
        python3-libs                x86_64 3.6.8-37.el8                baseos    7.8 M
        python3-pip-wheel           noarch 9.0.3-19.el8                baseos    1.0 M
        python3-rpm                 x86_64 4.14.3-14.el8_4             baseos    158 k
        rpm                         x86_64 4.14.3-14.el8_4             baseos    542 k
        rpm-build-libs              x86_64 4.14.3-14.el8_4             baseos    155 k
        rpm-libs                    x86_64 4.14.3-14.el8_4             baseos    339 k
        shadow-utils                x86_64 2:4.6-12.el8                baseos    1.2 M
        sqlite-libs                 x86_64 3.26.0-13.el8               baseos    580 k
        squashfs-tools              x86_64 4.3-20.el8                  baseos    165 k
        systemd                     x86_64 239-45.el8_4.2              baseos    3.6 M
        systemd-libs                x86_64 239-45.el8_4.2              baseos    1.1 M
        systemd-pam                 x86_64 239-45.el8_4.2              baseos    469 k
        systemd-udev                x86_64 239-45.el8_4.2              baseos    1.4 M
        tzdata                      noarch 2021a-1.el8                 baseos    473 k
        util-linux                  x86_64 2.32.1-27.el8               baseos    2.5 M
        yum                         noarch 4.4.2-11.el8                baseos    198 k
        zlib                        x86_64 1.2.11-17.el8               baseos    102 k
        Installing dependencies:
        cracklib-dicts              x86_64 2.9.6-15.el8                baseos    4.0 M
        file                        x86_64 5.33-16.el8_3.1             baseos     77 k
        gettext                     x86_64 0.19.8.1-17.el8             baseos    1.1 M
        gettext-libs                x86_64 0.19.8.1-17.el8             baseos    314 k
        grub2-common                noarch 1:2.02-99.el8               baseos    890 k
        grub2-tools                 x86_64 1:2.02-99.el8               baseos    2.0 M
        grub2-tools-minimal         x86_64 1:2.02-99.el8               baseos    209 k
        hwdata                      noarch 0.314-8.8.el8               baseos    1.7 M
        kbd-legacy                  noarch 2.0.4-10.el8                baseos    481 k
        kbd-misc                    noarch 2.0.4-10.el8                baseos    1.5 M
        libcroco                    x86_64 0.6.12-4.el8_2.1            baseos    113 k
        libevent                    x86_64 2.1.8-5.el8                 baseos    253 k
        libgomp                     x86_64 8.4.1-1.el8                 baseos    204 k
        libibverbs                  x86_64 32.0-4.el8                  baseos    321 k
        libnl3                      x86_64 3.5.0-1.el8                 baseos    320 k
        openssl                     x86_64 1:1.1.1g-15.el8_3           baseos    707 k
        os-prober                   x86_64 1.74-6.el8                  baseos     51 k
        pciutils                    x86_64 3.7.0-1.el8                 baseos    105 k
        pciutils-libs               x86_64 3.7.0-1.el8                 baseos     54 k
        rdma-core                   x86_64 32.0-4.el8                  baseos     59 k
        tpm2-tss                    x86_64 2.3.2-3.el8                 baseos    275 k
        trousers-lib                x86_64 0.3.15-1.el8                baseos    168 k
        unbound-libs                x86_64 1.7.3-15.el8                appstream 503 k
        which                       x86_64 2.21-12.el8                 baseos     49 k
        xkeyboard-config            noarch 2.28-1.el8                  appstream 782 k
        Installing weak dependencies:
        crypto-policies-scripts     noarch 20210209-1.gitbfb6bed.el8_3 baseos     67 k
        diffutils                   x86_64 3.6-6.el8                   baseos    358 k
        elfutils-debuginfod-client  x86_64 0.182-3.el8                 baseos     65 k
        glibc-langpack-en           x86_64 2.28-151.el8                baseos    827 k
        grubby                      x86_64 8.40-41.el8                 baseos     49 k
        hardlink                    x86_64 1:1.3-6.el8                 baseos     29 k
        kbd                         x86_64 2.0.4-10.el8                baseos    390 k
        kpartx                      x86_64 0.8.4-10.el8                baseos    111 k
        libxkbcommon                x86_64 0.9.1-1.el8                 appstream 116 k
        memstrack                   x86_64 0.1.11-1.el8                baseos     48 k
        openssl-pkcs11              x86_64 0.4.10-2.el8                baseos     66 k
        pigz                        x86_64 2.4-4.el8                   baseos     79 k
        platform-python-pip         noarch 9.0.3-19.el8                baseos    1.7 M
        python3-unbound             x86_64 1.7.3-15.el8                appstream 119 k
        rpm-plugin-systemd-inhibit  x86_64 4.14.3-14.el8_4             baseos     77 k
        shared-mime-info            x86_64 1.9-3.el8                   baseos    329 k
        trousers                    x86_64 0.3.15-1.el8                baseos    152 k

        Transaction Summary
        ================================================================================
        Install  42 Packages
        Upgrade  99 Packages

        Total download size: 80 M
        Downloading Packages:
        (1/141): libxkbcommon-0.9.1-1.el8.x86_64.rpm     13 MB/s | 116 kB     00:00    
        (2/141): python3-unbound-1.7.3-15.el8.x86_64.rp  12 MB/s | 119 kB     00:00    
        (3/141): unbound-libs-1.7.3-15.el8.x86_64.rpm    30 MB/s | 503 kB     00:00    
        (4/141): crypto-policies-scripts-20210209-1.git 9.8 MB/s |  67 kB     00:00    
        (5/141): xkeyboard-config-2.28-1.el8.noarch.rpm  36 MB/s | 782 kB     00:00    
        (6/141): elfutils-debuginfod-client-0.182-3.el8  16 MB/s |  65 kB     00:00    
        (7/141): diffutils-3.6-6.el8.x86_64.rpm          22 MB/s | 358 kB     00:00    
        (8/141): file-5.33-16.el8_3.1.x86_64.rpm         15 MB/s |  77 kB     00:00    
        (9/141): gettext-libs-0.19.8.1-17.el8.x86_64.rp  15 MB/s | 314 kB     00:00    
        (10/141): gettext-0.19.8.1-17.el8.x86_64.rpm     24 MB/s | 1.1 MB     00:00    
        (11/141): glibc-langpack-en-2.28-151.el8.x86_64  26 MB/s | 827 kB     00:00    
        (12/141): cracklib-dicts-2.9.6-15.el8.x86_64.rp  38 MB/s | 4.0 MB     00:00    
        (13/141): grub2-common-2.02-99.el8.noarch.rpm    24 MB/s | 890 kB     00:00    
        (14/141): grub2-tools-minimal-2.02-99.el8.x86_6  19 MB/s | 209 kB     00:00    
        (15/141): grubby-8.40-41.el8.x86_64.rpm          12 MB/s |  49 kB     00:00    
        (16/141): hardlink-1.3-6.el8.x86_64.rpm          13 MB/s |  29 kB     00:00    
        (17/141): kbd-2.0.4-10.el8.x86_64.rpm            34 MB/s | 390 kB     00:00    
        (18/141): grub2-tools-2.02-99.el8.x86_64.rpm     37 MB/s | 2.0 MB     00:00    
        (19/141): kbd-legacy-2.0.4-10.el8.noarch.rpm     30 MB/s | 481 kB     00:00    
        (20/141): kpartx-0.8.4-10.el8.x86_64.rpm         12 MB/s | 111 kB     00:00    
        (21/141): hwdata-0.314-8.8.el8.noarch.rpm        37 MB/s | 1.7 MB     00:00    
        (22/141): libcroco-0.6.12-4.el8_2.1.x86_64.rpm   12 MB/s | 113 kB     00:00    
        (23/141): libevent-2.1.8-5.el8.x86_64.rpm        44 MB/s | 253 kB     00:00    
        (24/141): libgomp-8.4.1-1.el8.x86_64.rpm         31 MB/s | 204 kB     00:00    
        (25/141): libibverbs-32.0-4.el8.x86_64.rpm       42 MB/s | 321 kB     00:00    
        (26/141): libnl3-3.5.0-1.el8.x86_64.rpm          38 MB/s | 320 kB     00:00    
        (27/141): memstrack-0.1.11-1.el8.x86_64.rpm      11 MB/s |  48 kB     00:00    
        (28/141): kbd-misc-2.0.4-10.el8.noarch.rpm       31 MB/s | 1.5 MB     00:00    
        (29/141): openssl-pkcs11-0.4.10-2.el8.x86_64.rp 8.4 MB/s |  66 kB     00:00    
        (30/141): os-prober-1.74-6.el8.x86_64.rpm        17 MB/s |  51 kB     00:00    
        (31/141): pciutils-3.7.0-1.el8.x86_64.rpm        29 MB/s | 105 kB     00:00    
        (32/141): pciutils-libs-3.7.0-1.el8.x86_64.rpm   18 MB/s |  54 kB     00:00    
        (33/141): pigz-2.4-4.el8.x86_64.rpm              27 MB/s |  79 kB     00:00    
        (34/141): openssl-1.1.1g-15.el8_3.x86_64.rpm     35 MB/s | 707 kB     00:00    
        (35/141): rdma-core-32.0-4.el8.x86_64.rpm       8.5 MB/s |  59 kB     00:00    
        (36/141): rpm-plugin-systemd-inhibit-4.14.3-14. 8.7 MB/s |  77 kB     00:00    
        (37/141): shared-mime-info-1.9-3.el8.x86_64.rpm  23 MB/s | 329 kB     00:00    
        (38/141): tpm2-tss-2.3.2-3.el8.x86_64.rpm        21 MB/s | 275 kB     00:00    
        (39/141): trousers-0.3.15-1.el8.x86_64.rpm       26 MB/s | 152 kB     00:00    
        (40/141): platform-python-pip-9.0.3-19.el8.noar  44 MB/s | 1.7 MB     00:00    
        (41/141): trousers-lib-0.3.15-1.el8.x86_64.rpm   15 MB/s | 168 kB     00:00    
        (42/141): which-2.21-12.el8.x86_64.rpm          4.4 MB/s |  49 kB     00:00    
        (43/141): bind-export-libs-9.11.26-4.el8_4.x86_  24 MB/s | 1.1 MB     00:00    
        (44/141): bash-4.4.20-1.el8_4.x86_64.rpm         27 MB/s | 1.5 MB     00:00    
        (45/141): centos-linux-release-8.4-1.2105.el8.n 2.4 MB/s |  22 kB     00:00    
        (46/141): crypto-policies-20210209-1.gitbfb6bed 6.0 MB/s |  62 kB     00:00    
        (47/141): cpio-2.12-10.el8.x86_64.rpm            11 MB/s | 265 kB     00:00    
        (48/141): cryptsetup-libs-2.3.3-4.el8.x86_64.rp  23 MB/s | 470 kB     00:00    
        (49/141): dbus-1.12.8-12.el8_4.2.x86_64.rpm      11 MB/s |  41 kB     00:00    
        (50/141): curl-7.61.1-18.el8.x86_64.rpm          26 MB/s | 353 kB     00:00    
        (51/141): dbus-common-1.12.8-12.el8_4.2.noarch.  15 MB/s |  46 kB     00:00    
        (52/141): dbus-daemon-1.12.8-12.el8_4.2.x86_64.  19 MB/s | 240 kB     00:00    
        (53/141): binutils-2.30-93.el8.x86_64.rpm        43 MB/s | 5.8 MB     00:00    
        (54/141): dbus-tools-1.12.8-12.el8_4.2.x86_64.r 2.8 MB/s |  85 kB     00:00    
        (55/141): device-mapper-1.02.175-5.el8.x86_64.r  29 MB/s | 375 kB     00:00    
        (56/141): device-mapper-libs-1.02.175-5.el8.x86  29 MB/s | 408 kB     00:00    
        (57/141): dbus-libs-1.12.8-12.el8_4.2.x86_64.rp 3.1 MB/s | 184 kB     00:00    
        (58/141): dhcp-client-4.3.6-44.0.1.el8.x86_64.r  43 MB/s | 318 kB     00:00    
        (59/141): dhcp-common-4.3.6-44.0.1.el8.noarch.r  30 MB/s | 207 kB     00:00    
        (60/141): dhcp-libs-4.3.6-44.0.1.el8.x86_64.rpm  22 MB/s | 148 kB     00:00    
        (61/141): dnf-data-4.4.2-11.el8.noarch.rpm       17 MB/s | 152 kB     00:00    
        (62/141): dnf-4.4.2-11.el8.noarch.rpm            38 MB/s | 539 kB     00:00    
        (63/141): dracut-049-135.git20210121.el8.x86_64  30 MB/s | 372 kB     00:00    
        (64/141): dracut-network-049-135.git20210121.el  15 MB/s | 105 kB     00:00    
        (65/141): dracut-squash-049-135.git20210121.el8  13 MB/s |  58 kB     00:00    
        (66/141): elfutils-default-yama-scope-0.182-3.e  16 MB/s |  49 kB     00:00    
        (67/141): elfutils-libelf-0.182-3.el8.x86_64.rp  24 MB/s | 216 kB     00:00    
        (68/141): elfutils-libs-0.182-3.el8.x86_64.rpm   27 MB/s | 293 kB     00:00    
        (69/141): ethtool-5.8-5.el8.x86_64.rpm           19 MB/s | 206 kB     00:00    
        (70/141): file-libs-5.33-16.el8_3.1.x86_64.rpm   25 MB/s | 543 kB     00:00    
        (71/141): gawk-4.2.1-2.el8.x86_64.rpm            32 MB/s | 1.1 MB     00:00    
        (72/141): glib2-2.56.4-10.el8_4.x86_64.rpm       32 MB/s | 2.5 MB     00:00    
        (73/141): glibc-minimal-langpack-2.28-151.el8.x  16 MB/s |  56 kB     00:00    
        (74/141): glibc-common-2.28-151.el8.x86_64.rpm   23 MB/s | 1.3 MB     00:00    
        (75/141): glibc-2.28-151.el8.x86_64.rpm          37 MB/s | 3.6 MB     00:00    
        (76/141): gnutls-3.6.14-8.el8_3.x86_64.rpm       25 MB/s | 1.0 MB     00:00    
        (77/141): gpgme-1.13.1-7.el8.x86_64.rpm          10 MB/s | 336 kB     00:00    
        (78/141): ima-evm-utils-1.3.2-12.el8.x86_64.rpm  18 MB/s |  64 kB     00:00    
        (79/141): gzip-1.9-12.el8.x86_64.rpm             17 MB/s | 167 kB     00:00    
        (80/141): iptables-libs-1.8.4-17.el8.x86_64.rpm  24 MB/s | 107 kB     00:00    
        (81/141): json-c-0.13.1-0.4.el8.x86_64.rpm      8.0 MB/s |  40 kB     00:00    
        (82/141): iputils-20180629-7.el8.x86_64.rpm      14 MB/s | 148 kB     00:00    
        (83/141): iproute-5.9.0-4.el8.x86_64.rpm         43 MB/s | 692 kB     00:00    
        (84/141): kmod-25-17.el8.x86_64.rpm              25 MB/s | 126 kB     00:00    
        (85/141): kmod-libs-25-17.el8.x86_64.rpm         16 MB/s |  68 kB     00:00    
        (86/141): kexec-tools-2.0.20-46.el8_4.1.x86_64.  39 MB/s | 508 kB     00:00    
        (87/141): libarchive-3.3.3-1.el8.x86_64.rpm      24 MB/s | 359 kB     00:00    
        (88/141): libblkid-2.32.1-27.el8.x86_64.rpm      17 MB/s | 217 kB     00:00    
        (89/141): libcomps-0.1.11-5.el8.x86_64.rpm       23 MB/s |  81 kB     00:00    
        (90/141): krb5-libs-1.18.2-8.el8.x86_64.rpm      32 MB/s | 838 kB     00:00    
        (91/141): libcurl-minimal-7.61.1-18.el8.x86_64.  29 MB/s | 286 kB     00:00    
        (92/141): libdb-utils-5.3.28-40.el8.x86_64.rpm   28 MB/s | 150 kB     00:00    
        (93/141): libdb-5.3.28-40.el8.x86_64.rpm         45 MB/s | 751 kB     00:00    
        (94/141): libfdisk-2.32.1-27.el8.x86_64.rpm      25 MB/s | 250 kB     00:00    
        (95/141): libgcc-8.4.1-1.el8.x86_64.rpm          17 MB/s |  78 kB     00:00    
        (96/141): libdnf-0.55.0-7.el8.x86_64.rpm         38 MB/s | 681 kB     00:00    
        (97/141): libpcap-1.9.1-5.el8.x86_64.rpm         27 MB/s | 169 kB     00:00    
        (98/141): libmount-2.32.1-27.el8.x86_64.rpm      25 MB/s | 233 kB     00:00    
        (99/141): libpwquality-1.4.4-3.el8.x86_64.rpm    20 MB/s | 107 kB     00:00    
        (100/141): librepo-1.12.0-3.el8.x86_64.rpm       22 MB/s |  91 kB     00:00    
        (101/141): libseccomp-2.5.1-1.el8.x86_64.rpm     20 MB/s |  71 kB     00:00    
        (102/141): libselinux-2.9-5.el8.x86_64.rpm       25 MB/s | 165 kB     00:00    
        (103/141): libsemanage-2.9-6.el8.x86_64.rpm      24 MB/s | 165 kB     00:00    
        (104/141): libsmartcols-2.32.1-27.el8.x86_64.rp  41 MB/s | 176 kB     00:00    
        (105/141): libsepol-2.9-2.el8.x86_64.rpm         27 MB/s | 339 kB     00:00    
        (106/141): libsolv-0.7.16-2.el8.x86_64.rpm       35 MB/s | 362 kB     00:00    
        (107/141): libuuid-2.32.1-27.el8.x86_64.rpm      18 MB/s |  95 kB     00:00    
        (108/141): libstdc++-8.4.1-1.el8.x86_64.rpm      33 MB/s | 451 kB     00:00    
        (109/141): lz4-libs-1.8.3-3.el8_4.x86_64.rpm     13 MB/s |  66 kB     00:00    
        (110/141): libxml2-2.9.7-9.el8_4.2.x86_64.rpm    52 MB/s | 696 kB     00:00    
        (111/141): openldap-2.4.46-17.el8_4.x86_64.rpm   32 MB/s | 351 kB     00:00    
        (112/141): p11-kit-0.23.22-1.el8.x86_64.rpm      33 MB/s | 324 kB     00:00    
        (113/141): p11-kit-trust-0.23.22-1.el8.x86_64.r  24 MB/s | 137 kB     00:00    
        (114/141): openssl-libs-1.1.1g-15.el8_3.x86_64.  52 MB/s | 1.5 MB     00:00    
        (115/141): platform-python-3.6.8-37.el8.x86_64.  27 MB/s |  84 kB     00:00    
        (116/141): popt-1.18-1.el8.x86_64.rpm            21 MB/s |  61 kB     00:00    
        (117/141): pam-1.3.1-14.el8.x86_64.rpm           38 MB/s | 738 kB     00:00    
        (118/141): nettle-3.4.1-4.el8_3.x86_64.rpm      5.9 MB/s | 301 kB     00:00    
        (119/141): procps-ng-3.3.15-6.el8.x86_64.rpm     29 MB/s | 329 kB     00:00    
        (120/141): python3-gpg-1.13.1-7.el8.x86_64.rpm   32 MB/s | 245 kB     00:00    
        (121/141): python3-dnf-4.4.2-11.el8.noarch.rpm   44 MB/s | 541 kB     00:00    
        (122/141): python3-libcomps-0.1.11-5.el8.x86_64  15 MB/s |  52 kB     00:00    
        (123/141): python3-libdnf-0.55.0-7.el8.x86_64.r  48 MB/s | 769 kB     00:00    
        (124/141): python3-hawkey-0.55.0-7.el8.x86_64.r 2.8 MB/s | 114 kB     00:00    
        (125/141): python3-pip-wheel-9.0.3-19.el8.noarc  36 MB/s | 1.0 MB     00:00    
        (126/141): python3-rpm-4.14.3-14.el8_4.x86_64.r  13 MB/s | 158 kB     00:00    
        (127/141): rpm-build-libs-4.14.3-14.el8_4.x86_6  19 MB/s | 155 kB     00:00    
        (128/141): rpm-4.14.3-14.el8_4.x86_64.rpm        34 MB/s | 542 kB     00:00    
        (129/141): rpm-libs-4.14.3-14.el8_4.x86_64.rpm   29 MB/s | 339 kB     00:00    
        (130/141): sqlite-libs-3.26.0-13.el8.x86_64.rpm  30 MB/s | 580 kB     00:00    
        (131/141): shadow-utils-4.6-12.el8.x86_64.rpm    37 MB/s | 1.2 MB     00:00    
        (132/141): squashfs-tools-4.3-20.el8.x86_64.rpm  14 MB/s | 165 kB     00:00    
        (133/141): systemd-libs-239-45.el8_4.2.x86_64.r  31 MB/s | 1.1 MB     00:00    
        (134/141): systemd-pam-239-45.el8_4.2.x86_64.rp  33 MB/s | 469 kB     00:00    
        (135/141): python3-libs-3.6.8-37.el8.x86_64.rpm  40 MB/s | 7.8 MB     00:00    
        (136/141): systemd-udev-239-45.el8_4.2.x86_64.r  21 MB/s | 1.4 MB     00:00    
        (137/141): tzdata-2021a-1.el8.noarch.rpm         24 MB/s | 473 kB     00:00    
        (138/141): systemd-239-45.el8_4.2.x86_64.rpm     26 MB/s | 3.6 MB     00:00    
        (139/141): yum-4.4.2-11.el8.noarch.rpm           11 MB/s | 198 kB     00:00    
        (140/141): zlib-1.2.11-17.el8.x86_64.rpm         23 MB/s | 102 kB     00:00    
        (141/141): util-linux-2.32.1-27.el8.x86_64.rpm   54 MB/s | 2.5 MB     00:00    
        --------------------------------------------------------------------------------
        Total                                            62 MB/s |  80 MB     00:01     
        Running transaction check
        Transaction check succeeded.
        Running transaction test
        Transaction test succeeded.
        Running transaction
        Preparing        :                                                        1/1 
        Running scriptlet: libgcc-8.4.1-1.el8.x86_64                              1/1 
        Upgrading        : libgcc-8.4.1-1.el8.x86_64                            1/240 
        Running scriptlet: libgcc-8.4.1-1.el8.x86_64                            1/240 
        Upgrading        : python3-pip-wheel-9.0.3-19.el8.noarch                2/240 
        Installing       : cracklib-dicts-2.9.6-15.el8.x86_64                   3/240 
        Upgrading        : tzdata-2021a-1.el8.noarch                            4/240 
        Upgrading        : libselinux-2.9-5.el8.x86_64                          5/240 
        Upgrading        : glibc-common-2.28-151.el8.x86_64                     6/240 
        Installing       : glibc-langpack-en-2.28-151.el8.x86_64                7/240 
        Running scriptlet: glibc-2.28-151.el8.x86_64                            8/240 
        Upgrading        : glibc-2.28-151.el8.x86_64                            8/240 
        Running scriptlet: glibc-2.28-151.el8.x86_64                            8/240 
        Upgrading        : bash-4.4.20-1.el8_4.x86_64                           9/240 
        Running scriptlet: bash-4.4.20-1.el8_4.x86_64                           9/240 
        Upgrading        : libsepol-2.9-2.el8.x86_64                           10/240 
        Running scriptlet: libsepol-2.9-2.el8.x86_64                           10/240 
        Upgrading        : zlib-1.2.11-17.el8.x86_64                           11/240 
        Upgrading        : elfutils-libelf-0.182-3.el8.x86_64                  12/240 
        Upgrading        : libxml2-2.9.7-9.el8_4.2.x86_64                      13/240 
        Upgrading        : gpgme-1.13.1-7.el8.x86_64                           14/240 
        Upgrading        : libstdc++-8.4.1-1.el8.x86_64                        15/240 
        Running scriptlet: libstdc++-8.4.1-1.el8.x86_64                        15/240 
        Upgrading        : libuuid-2.32.1-27.el8.x86_64                        16/240 
        Running scriptlet: libuuid-2.32.1-27.el8.x86_64                        16/240 
        Upgrading        : libblkid-2.32.1-27.el8.x86_64                       17/240 
        Running scriptlet: libblkid-2.32.1-27.el8.x86_64                       17/240 
        Upgrading        : libmount-2.32.1-27.el8.x86_64                       18/240 
        Running scriptlet: libmount-2.32.1-27.el8.x86_64                       18/240 
        Upgrading        : popt-1.18-1.el8.x86_64                              19/240 
        Upgrading        : sqlite-libs-3.26.0-13.el8.x86_64                    20/240 
        Upgrading        : json-c-0.13.1-0.4.el8.x86_64                        21/240 
        Upgrading        : libsmartcols-2.32.1-27.el8.x86_64                   22/240 
        Running scriptlet: libsmartcols-2.32.1-27.el8.x86_64                   22/240 
        Upgrading        : lz4-libs-1.8.3-3.el8_4.x86_64                       23/240 
        Upgrading        : systemd-libs-239-45.el8_4.2.x86_64                  24/240 
        Running scriptlet: systemd-libs-239-45.el8_4.2.x86_64                  24/240 
        Upgrading        : dbus-libs-1:1.12.8-12.el8_4.2.x86_64                25/240 
        Running scriptlet: dbus-libs-1:1.12.8-12.el8_4.2.x86_64                25/240 
        Upgrading        : file-libs-5.33-16.el8_3.1.x86_64                    26/240 
        Installing       : grub2-common-1:2.02-99.el8.noarch                   27/240 
        Installing       : libgomp-8.4.1-1.el8.x86_64                          28/240 
        Running scriptlet: libgomp-8.4.1-1.el8.x86_64                          28/240 
        Installing       : libnl3-3.5.0-1.el8.x86_64                           29/240 
        Running scriptlet: libnl3-3.5.0-1.el8.x86_64                           29/240 
        Upgrading        : gawk-4.2.1-2.el8.x86_64                             30/240 
        Upgrading        : p11-kit-0.23.22-1.el8.x86_64                        31/240 
        Upgrading        : p11-kit-trust-0.23.22-1.el8.x86_64                  32/240 
        Running scriptlet: p11-kit-trust-0.23.22-1.el8.x86_64                  32/240 
        Installing       : file-5.33-16.el8_3.1.x86_64                         33/240 
        Upgrading        : dbus-tools-1:1.12.8-12.el8_4.2.x86_64               34/240 
        Upgrading        : dhcp-libs-12:4.3.6-44.0.1.el8.x86_64                35/240 
        Upgrading        : procps-ng-3.3.15-6.el8.x86_64                       36/240 
        Upgrading        : squashfs-tools-4.3-20.el8.x86_64                    37/240 
        Upgrading        : libfdisk-2.32.1-27.el8.x86_64                       38/240 
        Running scriptlet: libfdisk-2.32.1-27.el8.x86_64                       38/240 
        Upgrading        : libcomps-0.1.11-5.el8.x86_64                        39/240 
        Installing       : pigz-2.4-4.el8.x86_64                               40/240 
        Upgrading        : libsemanage-2.9-6.el8.x86_64                        41/240 
        Upgrading        : shadow-utils-2:4.6-12.el8.x86_64                    42/240 
        Installing       : diffutils-3.6-6.el8.x86_64                          43/240 
        Running scriptlet: diffutils-3.6-6.el8.x86_64                          43/240 
        Upgrading        : gzip-1.9-12.el8.x86_64                              44/240 
        Running scriptlet: gzip-1.9-12.el8.x86_64                              44/240 
        Upgrading        : nettle-3.4.1-4.el8_3.x86_64                         45/240 
        Running scriptlet: nettle-3.4.1-4.el8_3.x86_64                         45/240 
        Installing       : hardlink-1:1.3-6.el8.x86_64                         46/240 
        Installing       : memstrack-0.1.11-1.el8.x86_64                       47/240 
        Installing       : pciutils-libs-3.7.0-1.el8.x86_64                    48/240 
        Running scriptlet: pciutils-libs-3.7.0-1.el8.x86_64                    48/240 
        Installing       : which-2.21-12.el8.x86_64                            49/240 
        Upgrading        : cpio-2.12-10.el8.x86_64                             50/240 
        Upgrading        : ethtool-2:5.8-5.el8.x86_64                          51/240 
        Upgrading        : libseccomp-2.5.1-1.el8.x86_64                       52/240 
        Running scriptlet: libseccomp-2.5.1-1.el8.x86_64                       52/240 
        Upgrading        : dnf-data-4.4.2-11.el8.noarch                        53/240 
        Upgrading        : dhcp-common-12:4.3.6-44.0.1.el8.noarch              54/240 
        Upgrading        : dbus-common-1:1.12.8-12.el8_4.2.noarch              55/240 
        Running scriptlet: dbus-daemon-1:1.12.8-12.el8_4.2.x86_64              56/240 
        Upgrading        : dbus-daemon-1:1.12.8-12.el8_4.2.x86_64              56/240 
        Running scriptlet: dbus-daemon-1:1.12.8-12.el8_4.2.x86_64              56/240 
        Installing       : kbd-misc-2.0.4-10.el8.noarch                        57/240 
        Installing       : kbd-legacy-2.0.4-10.el8.noarch                      58/240 
        Installing       : hwdata-0.314-8.8.el8.noarch                         59/240 
        Installing       : xkeyboard-config-2.28-1.el8.noarch                  60/240 
        Installing       : libxkbcommon-0.9.1-1.el8.x86_64                     61/240 
        Installing       : pciutils-3.7.0-1.el8.x86_64                         62/240 
        Installing       : rdma-core-32.0-4.el8.x86_64                         63/240 
        Running scriptlet: rdma-core-32.0-4.el8.x86_64                         63/240 
        Installing       : libibverbs-32.0-4.el8.x86_64                        64/240 
        Running scriptlet: libibverbs-32.0-4.el8.x86_64                        64/240 
        Upgrading        : libpcap-14:1.9.1-5.el8.x86_64                       65/240 
        Upgrading        : iptables-libs-1.8.4-17.el8.x86_64                   66/240 
        Upgrading        : krb5-libs-1.18.2-8.el8.x86_64                       67/240 
        Installing       : grub2-tools-minimal-1:2.02-99.el8.x86_64            68/240 
        Installing       : platform-python-pip-9.0.3-19.el8.noarch             69/240 
        Upgrading        : python3-libs-3.6.8-37.el8.x86_64                    70/240 
        Upgrading        : libcurl-minimal-7.61.1-18.el8.x86_64                71/240 
        Upgrading        : platform-python-3.6.8-37.el8.x86_64                 72/240 
        Running scriptlet: platform-python-3.6.8-37.el8.x86_64                 72/240 
        Installing       : grubby-8.40-41.el8.x86_64                           73/240 
        Upgrading        : elfutils-default-yama-scope-0.182-3.el8.noarch      74/240 
        Running scriptlet: elfutils-default-yama-scope-0.182-3.el8.noarch      74/240 
        Installing       : openssl-1:1.1.1g-15.el8_3.x86_64                    75/240 
        Upgrading        : libarchive-3.3.3-1.el8.x86_64                       76/240 
        Installing       : elfutils-debuginfod-client-0.182-3.el8.x86_64       77/240 
        Upgrading        : elfutils-libs-0.182-3.el8.x86_64                    78/240 
        Upgrading        : curl-7.61.1-18.el8.x86_64                           79/240 
        Upgrading        : libpwquality-1.4.4-3.el8.x86_64                     80/240 
        Upgrading        : libdb-utils-5.3.28-40.el8.x86_64                    81/240 
        Installing       : crypto-policies-scripts-20210209-1.gitbfb6bed.el    82/240 
        Upgrading        : crypto-policies-20210209-1.gitbfb6bed.el8_3.noar    83/240 
        Running scriptlet: crypto-policies-20210209-1.gitbfb6bed.el8_3.noar    83/240 
        Installing       : openssl-pkcs11-0.4.10-2.el8.x86_64                  84/240 
        Upgrading        : openssl-libs-1:1.1.1g-15.el8_3.x86_64               85/240 
        Running scriptlet: openssl-libs-1:1.1.1g-15.el8_3.x86_64               85/240 
        Upgrading        : libdb-5.3.28-40.el8.x86_64                          86/240 
        Running scriptlet: libdb-5.3.28-40.el8.x86_64                          86/240 
        Upgrading        : pam-1.3.1-14.el8.x86_64                             87/240 
        Running scriptlet: pam-1.3.1-14.el8.x86_64                             87/240 
        Upgrading        : util-linux-2.32.1-27.el8.x86_64                     88/240 
        Running scriptlet: util-linux-2.32.1-27.el8.x86_64                     88/240 
        Upgrading        : kmod-libs-25-17.el8.x86_64                          89/240 
        Running scriptlet: kmod-libs-25-17.el8.x86_64                          89/240 
        Upgrading        : kmod-25-17.el8.x86_64                               90/240 
        Installing       : kbd-2.0.4-10.el8.x86_64                             91/240 
        Installing       : trousers-lib-0.3.15-1.el8.x86_64                    92/240 
        Running scriptlet: trousers-lib-0.3.15-1.el8.x86_64                    92/240 
        Installing       : gettext-libs-0.19.8.1-17.el8.x86_64                 93/240 
        Installing       : libcroco-0.6.12-4.el8_2.1.x86_64                    94/240 
        Running scriptlet: libcroco-0.6.12-4.el8_2.1.x86_64                    94/240 
        Upgrading        : gnutls-3.6.14-8.el8_3.x86_64                        95/240 
        Upgrading        : systemd-pam-239-45.el8_4.2.x86_64                   96/240 
        Installing       : kpartx-0.8.4-10.el8.x86_64                          97/240 
        Upgrading        : device-mapper-8:1.02.175-5.el8.x86_64               98/240 
        Upgrading        : device-mapper-libs-8:1.02.175-5.el8.x86_64          99/240 
        Upgrading        : cryptsetup-libs-2.3.3-4.el8.x86_64                 100/240 
        Running scriptlet: cryptsetup-libs-2.3.3-4.el8.x86_64                 100/240 
        Upgrading        : rpm-4.14.3-14.el8_4.x86_64                         101/240 
        Upgrading        : rpm-libs-4.14.3-14.el8_4.x86_64                    102/240 
        Running scriptlet: rpm-libs-4.14.3-14.el8_4.x86_64                    102/240 
        Installing       : gettext-0.19.8.1-17.el8.x86_64                     103/240 
        Running scriptlet: gettext-0.19.8.1-17.el8.x86_64                     103/240 
        Upgrading        : glib2-2.56.4-10.el8_4.x86_64                       104/240 
        Installing       : shared-mime-info-1.9-3.el8.x86_64                  105/240 
        Running scriptlet: shared-mime-info-1.9-3.el8.x86_64                  105/240 
        Installing       : os-prober-1.74-6.el8.x86_64                        106/240 
        Upgrading        : dracut-049-135.git20210121.el8.x86_64              107/240 
        Running scriptlet: grub2-tools-1:2.02-99.el8.x86_64                   108/240 
        Installing       : grub2-tools-1:2.02-99.el8.x86_64                   108/240 
        Running scriptlet: grub2-tools-1:2.02-99.el8.x86_64                   108/240 
        Running scriptlet: systemd-239-45.el8_4.2.x86_64                      109/240 
        Upgrading        : systemd-239-45.el8_4.2.x86_64                      109/240 
        Running scriptlet: systemd-239-45.el8_4.2.x86_64                      109/240 
        Upgrading        : systemd-udev-239-45.el8_4.2.x86_64                 110/240 
        Running scriptlet: systemd-udev-239-45.el8_4.2.x86_64                 110/240 
        Running scriptlet: trousers-0.3.15-1.el8.x86_64                       111/240 
        Installing       : trousers-0.3.15-1.el8.x86_64                       111/240 
        Running scriptlet: trousers-0.3.15-1.el8.x86_64                       111/240 
        Upgrading        : dbus-1:1.12.8-12.el8_4.2.x86_64                    112/240 
        Upgrading        : librepo-1.12.0-3.el8.x86_64                        113/240 
        Upgrading        : libsolv-0.7.16-2.el8.x86_64                        114/240 
        Upgrading        : libdnf-0.55.0-7.el8.x86_64                         115/240 
        Upgrading        : python3-libdnf-0.55.0-7.el8.x86_64                 116/240 
        Upgrading        : iputils-20180629-7.el8.x86_64                      117/240 
        Running scriptlet: iputils-20180629-7.el8.x86_64                      117/240 
        Upgrading        : iproute-5.9.0-4.el8.x86_64                         118/240 
        Installing       : libevent-2.1.8-5.el8.x86_64                        119/240 
        Running scriptlet: unbound-libs-1.7.3-15.el8.x86_64                   120/240 
        Installing       : unbound-libs-1.7.3-15.el8.x86_64                   120/240 
        Running scriptlet: unbound-libs-1.7.3-15.el8.x86_64                   120/240 
        Installing       : python3-unbound-1.7.3-15.el8.x86_64                121/240 
        Upgrading        : python3-hawkey-0.55.0-7.el8.x86_64                 122/240 
        Upgrading        : dracut-squash-049-135.git20210121.el8.x86_64       123/240 
        Installing       : rpm-plugin-systemd-inhibit-4.14.3-14.el8_4.x86_6   124/240 
        Running scriptlet: tpm2-tss-2.3.2-3.el8.x86_64                        125/240 
        Installing       : tpm2-tss-2.3.2-3.el8.x86_64                        125/240 
        Running scriptlet: tpm2-tss-2.3.2-3.el8.x86_64                        125/240 
        Upgrading        : ima-evm-utils-1.3.2-12.el8.x86_64                  126/240 
        Upgrading        : rpm-build-libs-4.14.3-14.el8_4.x86_64              127/240 
        Running scriptlet: rpm-build-libs-4.14.3-14.el8_4.x86_64              127/240 
        Upgrading        : python3-rpm-4.14.3-14.el8_4.x86_64                 128/240 
        Upgrading        : bind-export-libs-32:9.11.26-4.el8_4.x86_64         129/240 
        Running scriptlet: bind-export-libs-32:9.11.26-4.el8_4.x86_64         129/240 
        Upgrading        : dhcp-client-12:4.3.6-44.0.1.el8.x86_64             130/240 
        Upgrading        : dracut-network-049-135.git20210121.el8.x86_64      131/240 
        Upgrading        : python3-gpg-1.13.1-7.el8.x86_64                    132/240 
        Upgrading        : python3-libcomps-0.1.11-5.el8.x86_64               133/240 
        Upgrading        : python3-dnf-4.4.2-11.el8.noarch                    134/240 
        Upgrading        : dnf-4.4.2-11.el8.noarch                            135/240 
        Running scriptlet: dnf-4.4.2-11.el8.noarch                            135/240 
        Upgrading        : yum-4.4.2-11.el8.noarch                            136/240 
        Upgrading        : kexec-tools-2.0.20-46.el8_4.1.x86_64               137/240 
        Running scriptlet: kexec-tools-2.0.20-46.el8_4.1.x86_64               137/240 
        Upgrading        : openldap-2.4.46-17.el8_4.x86_64                    138/240 
        Upgrading        : binutils-2.30-93.el8.x86_64                        139/240 
        Running scriptlet: binutils-2.30-93.el8.x86_64                        139/240 
        Upgrading        : glibc-minimal-langpack-2.28-151.el8.x86_64         140/240 
        Upgrading        : centos-linux-release-8.4-1.2105.el8.noarch         141/240 
        Running scriptlet: kexec-tools-2.0.20-34.el8.x86_64                   142/240 
        Cleanup          : kexec-tools-2.0.20-34.el8.x86_64                   142/240 
        Running scriptlet: kexec-tools-2.0.20-34.el8.x86_64                   142/240 
        Running scriptlet: binutils-2.30-79.el8.x86_64                        143/240 
        Cleanup          : binutils-2.30-79.el8.x86_64                        143/240 
        Running scriptlet: binutils-2.30-79.el8.x86_64                        143/240 
        Cleanup          : dracut-network-049-95.git20200804.el8.x86_64       144/240 
        Cleanup          : dhcp-client-12:4.3.6-41.el8.x86_64                 145/240 
        Cleanup          : dhcp-libs-12:4.3.6-41.el8.x86_64                   146/240 
        Cleanup          : dracut-squash-049-95.git20200804.el8.x86_64        147/240 
        Cleanup          : yum-4.2.23-4.el8.noarch                            148/240 
        Running scriptlet: dnf-4.2.23-4.el8.noarch                            149/240 
        Cleanup          : dnf-4.2.23-4.el8.noarch                            149/240 
        Running scriptlet: dnf-4.2.23-4.el8.noarch                            149/240 
        Cleanup          : python3-dnf-4.2.23-4.el8.noarch                    150/240 
        Cleanup          : dnf-data-4.2.23-4.el8.noarch                       151/240 
        Cleanup          : dhcp-common-12:4.3.6-41.el8.noarch                 152/240 
        Cleanup          : centos-linux-release-8.3-1.2011.el8.noarch         153/240 
        Cleanup          : python3-hawkey-0.48.0-5.el8.x86_64                 154/240 
        Cleanup          : python3-libdnf-0.48.0-5.el8.x86_64                 155/240 
        Cleanup          : libdnf-0.48.0-5.el8.x86_64                         156/240 
        Cleanup          : dracut-049-95.git20200804.el8.x86_64               157/240 
        Cleanup          : systemd-udev-239-41.el8_3.x86_64                   158/240 
        Running scriptlet: systemd-udev-239-41.el8_3.x86_64                   158/240 
        Cleanup          : python3-rpm-4.14.3-4.el8.x86_64                    159/240 
        Cleanup          : rpm-build-libs-4.14.3-4.el8.x86_64                 160/240 
        Running scriptlet: rpm-build-libs-4.14.3-4.el8.x86_64                 160/240 
        Cleanup          : device-mapper-8:1.02.171-5.el8.x86_64              161/240 
        Running scriptlet: iputils-20180629-2.el8.x86_64                      162/240 
        Cleanup          : iputils-20180629-2.el8.x86_64                      162/240 
        Running scriptlet: iputils-20180629-2.el8.x86_64                      162/240 
        Cleanup          : elfutils-libs-0.180-1.el8.x86_64                   163/240 
        Cleanup          : elfutils-default-yama-scope-0.180-1.el8.noarch     164/240 
        Cleanup          : dbus-1:1.12.8-11.el8.x86_64                        165/240 
        Running scriptlet: systemd-239-41.el8_3.x86_64                        166/240 
        Cleanup          : systemd-239-41.el8_3.x86_64                        166/240 
        Cleanup          : util-linux-2.32.1-24.el8.x86_64                    167/240 
        Cleanup          : systemd-pam-239-41.el8_3.x86_64                    168/240 
        Cleanup          : cryptsetup-libs-2.3.3-2.el8.x86_64                 169/240 
        Running scriptlet: cryptsetup-libs-2.3.3-2.el8.x86_64                 169/240 
        Running scriptlet: dbus-daemon-1:1.12.8-11.el8.x86_64                 170/240 
        Cleanup          : dbus-daemon-1:1.12.8-11.el8.x86_64                 170/240 
        Running scriptlet: dbus-daemon-1:1.12.8-11.el8.x86_64                 170/240 
        Cleanup          : libfdisk-2.32.1-24.el8.x86_64                      171/240 
        Running scriptlet: libfdisk-2.32.1-24.el8.x86_64                      171/240 
        Cleanup          : librepo-1.12.0-2.el8.x86_64                        172/240 
        Cleanup          : glib2-2.56.4-8.el8.x86_64                          173/240 
        Cleanup          : gnutls-3.6.14-6.el8.x86_64                         174/240 
        Cleanup          : p11-kit-trust-0.23.14-5.el8_0.x86_64               175/240 
        Running scriptlet: p11-kit-trust-0.23.14-5.el8_0.x86_64               175/240 
        Cleanup          : p11-kit-0.23.14-5.el8_0.x86_64                     176/240 
        Running scriptlet: p11-kit-0.23.14-5.el8_0.x86_64                     176/240 
        Cleanup          : libstdc++-8.3.1-5.1.el8.x86_64                     177/240 
        Running scriptlet: libstdc++-8.3.1-5.1.el8.x86_64                     177/240 
        Cleanup          : iproute-5.3.0-5.el8.x86_64                         178/240 
        Cleanup          : device-mapper-libs-8:1.02.171-5.el8.x86_64         179/240 
        Cleanup          : squashfs-tools-4.3-19.el8.x86_64                   180/240 
        Cleanup          : bind-export-libs-32:9.11.20-5.el8.x86_64           181/240 
        Running scriptlet: bind-export-libs-32:9.11.20-5.el8.x86_64           181/240 
        Cleanup          : kmod-libs-25-16.el8.x86_64                         182/240 
        Running scriptlet: kmod-libs-25-16.el8.x86_64                         182/240 
        Cleanup          : libsolv-0.7.11-1.el8.x86_64                        183/240 
        Cleanup          : rpm-4.14.3-4.el8.x86_64                            184/240 
        Cleanup          : rpm-libs-4.14.3-4.el8.x86_64                       185/240 
        Running scriptlet: rpm-libs-4.14.3-4.el8.x86_64                       185/240 
        Cleanup          : libarchive-3.3.2-9.el8.x86_64                      186/240 
        Cleanup          : curl-7.61.1-14.el8.x86_64                          187/240 
        Cleanup          : libcurl-minimal-7.61.1-14.el8.x86_64               188/240 
        Cleanup          : krb5-libs-1.18.2-5.el8.x86_64                      189/240 
        Cleanup          : openldap-2.4.46-15.el8.x86_64                      190/240 
        Cleanup          : libsmartcols-2.32.1-24.el8.x86_64                  191/240 
        Running scriptlet: libsmartcols-2.32.1-24.el8.x86_64                  191/240 
        Cleanup          : kmod-25-16.el8.x86_64                              192/240 
        Cleanup          : procps-ng-3.3.15-3.el8.x86_64                      193/240 
        Cleanup          : dbus-tools-1:1.12.8-11.el8.x86_64                  194/240 
        Cleanup          : dbus-libs-1:1.12.8-11.el8.x86_64                   195/240 
        Running scriptlet: dbus-libs-1:1.12.8-11.el8.x86_64                   195/240 
        Cleanup          : systemd-libs-239-41.el8_3.x86_64                   196/240 
        Cleanup          : libmount-2.32.1-24.el8.x86_64                      197/240 
        Running scriptlet: libmount-2.32.1-24.el8.x86_64                      197/240 
        Cleanup          : libblkid-2.32.1-24.el8.x86_64                      198/240 
        Running scriptlet: libblkid-2.32.1-24.el8.x86_64                      198/240 
        Cleanup          : python3-gpg-1.13.1-3.el8.x86_64                    199/240 
        Cleanup          : libuuid-2.32.1-24.el8.x86_64                       200/240 
        Running scriptlet: libuuid-2.32.1-24.el8.x86_64                       200/240 
        Cleanup          : gawk-4.2.1-1.el8.x86_64                            201/240 
        Cleanup          : shadow-utils-2:4.6-11.el8.x86_64                   202/240 
        Cleanup          : libsemanage-2.9-3.el8.x86_64                       203/240 
        Cleanup          : iptables-libs-1.8.4-15.el8.x86_64                  204/240 
        Cleanup          : python3-libcomps-0.1.11-4.el8.x86_64               205/240 
        Cleanup          : python3-libs-3.6.8-31.el8.x86_64                   206/240 
        Cleanup          : platform-python-3.6.8-31.el8.x86_64                207/240 
        Running scriptlet: platform-python-3.6.8-31.el8.x86_64                207/240 
        Cleanup          : libcomps-0.1.11-4.el8.x86_64                       208/240 
        Cleanup          : libxml2-2.9.7-8.el8.x86_64                         209/240 
        Cleanup          : sqlite-libs-3.26.0-11.el8.x86_64                   210/240 
        Cleanup          : libpwquality-1.4.0-9.el8.x86_64                    211/240 
        Cleanup          : pam-1.3.1-11.el8.x86_64                            212/240 
        Running scriptlet: pam-1.3.1-11.el8.x86_64                            212/240 
        Cleanup          : gpgme-1.13.1-3.el8.x86_64                          213/240 
        Cleanup          : libdb-utils-5.3.28-39.el8.x86_64                   214/240 
        Cleanup          : libdb-5.3.28-39.el8.x86_64                         215/240 
        Running scriptlet: libdb-5.3.28-39.el8.x86_64                         215/240 
        Cleanup          : file-libs-5.33-16.el8.x86_64                       216/240 
        Running scriptlet: gzip-1.9-9.el8.x86_64                              217/240 
        Cleanup          : gzip-1.9-9.el8.x86_64                              217/240 
        Cleanup          : ima-evm-utils-1.1-5.el8.x86_64                     218/240 
        Cleanup          : openssl-libs-1:1.1.1g-11.el8.x86_64                219/240 
        Running scriptlet: openssl-libs-1:1.1.1g-11.el8.x86_64                219/240 
        Cleanup          : libpcap-14:1.9.1-4.el8.x86_64                      220/240 
        Running scriptlet: nettle-3.4.1-2.el8.x86_64                          221/240 
        Cleanup          : nettle-3.4.1-2.el8.x86_64                          221/240 
        Running scriptlet: nettle-3.4.1-2.el8.x86_64                          221/240 
        Cleanup          : json-c-0.13.1-0.2.el8.x86_64                       222/240 
        Cleanup          : ethtool-2:5.0-2.el8.x86_64                         223/240 
        Cleanup          : elfutils-libelf-0.180-1.el8.x86_64                 224/240 
        Cleanup          : popt-1.16-14.el8.x86_64                            225/240 
        Cleanup          : cpio-2.12-8.el8.x86_64                             226/240 
        Cleanup          : libseccomp-2.4.3-1.el8.x86_64                      227/240 
        Running scriptlet: libseccomp-2.4.3-1.el8.x86_64                      227/240 
        Cleanup          : crypto-policies-20200713-1.git51d1222.el8.noarch   228/240 
        Cleanup          : python3-pip-wheel-9.0.3-18.el8.noarch              229/240 
        Cleanup          : dbus-common-1:1.12.8-11.el8.noarch                 230/240 
        Cleanup          : zlib-1.2.11-16.el8_2.x86_64                        231/240 
        Cleanup          : lz4-libs-1.8.3-2.el8.x86_64                        232/240 
        Cleanup          : glibc-minimal-langpack-2.28-127.el8.x86_64         233/240 
        Cleanup          : glibc-common-2.28-127.el8.x86_64                   234/240 
        Cleanup          : libselinux-2.9-4.el8_3.x86_64                      235/240 
        Cleanup          : libsepol-2.9-1.el8.x86_64                          236/240 
        Running scriptlet: libsepol-2.9-1.el8.x86_64                          236/240 
        Cleanup          : bash-4.4.19-12.el8.x86_64                          237/240 
        Running scriptlet: bash-4.4.19-12.el8.x86_64                          237/240 
        Cleanup          : glibc-2.28-127.el8.x86_64                          238/240 
        Cleanup          : tzdata-2020d-1.el8.noarch                          239/240 
        Cleanup          : libgcc-8.3.1-5.1.el8.x86_64                        240/240 
        Running scriptlet: libgcc-8.3.1-5.1.el8.x86_64                        240/240 
        Running scriptlet: crypto-policies-scripts-20210209-1.gitbfb6bed.el   240/240 
        Running scriptlet: libgcc-8.3.1-5.1.el8.x86_64                        240/240 
        Running scriptlet: glibc-common-2.28-151.el8.x86_64                   240/240 
        Running scriptlet: glib2-2.56.4-10.el8_4.x86_64                       240/240 
        Running scriptlet: shared-mime-info-1.9-3.el8.x86_64                  240/240 
        Running scriptlet: systemd-239-45.el8_4.2.x86_64                      240/240 
        Running scriptlet: systemd-udev-239-45.el8_4.2.x86_64                 240/240 
        Verifying        : libxkbcommon-0.9.1-1.el8.x86_64                      1/240 
        Verifying        : python3-unbound-1.7.3-15.el8.x86_64                  2/240 
        Verifying        : unbound-libs-1.7.3-15.el8.x86_64                     3/240 
        Verifying        : xkeyboard-config-2.28-1.el8.noarch                   4/240 
        Verifying        : cracklib-dicts-2.9.6-15.el8.x86_64                   5/240 
        Verifying        : crypto-policies-scripts-20210209-1.gitbfb6bed.el     6/240 
        Verifying        : diffutils-3.6-6.el8.x86_64                           7/240 
        Verifying        : elfutils-debuginfod-client-0.182-3.el8.x86_64        8/240 
        Verifying        : file-5.33-16.el8_3.1.x86_64                          9/240 
        Verifying        : gettext-0.19.8.1-17.el8.x86_64                      10/240 
        Verifying        : gettext-libs-0.19.8.1-17.el8.x86_64                 11/240 
        Verifying        : glibc-langpack-en-2.28-151.el8.x86_64               12/240 
        Verifying        : grub2-common-1:2.02-99.el8.noarch                   13/240 
        Verifying        : grub2-tools-1:2.02-99.el8.x86_64                    14/240 
        Verifying        : grub2-tools-minimal-1:2.02-99.el8.x86_64            15/240 
        Verifying        : grubby-8.40-41.el8.x86_64                           16/240 
        Verifying        : hardlink-1:1.3-6.el8.x86_64                         17/240 
        Verifying        : hwdata-0.314-8.8.el8.noarch                         18/240 
        Verifying        : kbd-2.0.4-10.el8.x86_64                             19/240 
        Verifying        : kbd-legacy-2.0.4-10.el8.noarch                      20/240 
        Verifying        : kbd-misc-2.0.4-10.el8.noarch                        21/240 
        Verifying        : kpartx-0.8.4-10.el8.x86_64                          22/240 
        Verifying        : libcroco-0.6.12-4.el8_2.1.x86_64                    23/240 
        Verifying        : libevent-2.1.8-5.el8.x86_64                         24/240 
        Verifying        : libgomp-8.4.1-1.el8.x86_64                          25/240 
        Verifying        : libibverbs-32.0-4.el8.x86_64                        26/240 
        Verifying        : libnl3-3.5.0-1.el8.x86_64                           27/240 
        Verifying        : memstrack-0.1.11-1.el8.x86_64                       28/240 
        Verifying        : openssl-1:1.1.1g-15.el8_3.x86_64                    29/240 
        Verifying        : openssl-pkcs11-0.4.10-2.el8.x86_64                  30/240 
        Verifying        : os-prober-1.74-6.el8.x86_64                         31/240 
        Verifying        : pciutils-3.7.0-1.el8.x86_64                         32/240 
        Verifying        : pciutils-libs-3.7.0-1.el8.x86_64                    33/240 
        Verifying        : pigz-2.4-4.el8.x86_64                               34/240 
        Verifying        : platform-python-pip-9.0.3-19.el8.noarch             35/240 
        Verifying        : rdma-core-32.0-4.el8.x86_64                         36/240 
        Verifying        : rpm-plugin-systemd-inhibit-4.14.3-14.el8_4.x86_6    37/240 
        Verifying        : shared-mime-info-1.9-3.el8.x86_64                   38/240 
        Verifying        : tpm2-tss-2.3.2-3.el8.x86_64                         39/240 
        Verifying        : trousers-0.3.15-1.el8.x86_64                        40/240 
        Verifying        : trousers-lib-0.3.15-1.el8.x86_64                    41/240 
        Verifying        : which-2.21-12.el8.x86_64                            42/240 
        Verifying        : bash-4.4.20-1.el8_4.x86_64                          43/240 
        Verifying        : bash-4.4.19-12.el8.x86_64                           44/240 
        Verifying        : bind-export-libs-32:9.11.26-4.el8_4.x86_64          45/240 
        Verifying        : bind-export-libs-32:9.11.20-5.el8.x86_64            46/240 
        Verifying        : binutils-2.30-93.el8.x86_64                         47/240 
        Verifying        : binutils-2.30-79.el8.x86_64                         48/240 
        Verifying        : centos-linux-release-8.4-1.2105.el8.noarch          49/240 
        Verifying        : centos-linux-release-8.3-1.2011.el8.noarch          50/240 
        Verifying        : cpio-2.12-10.el8.x86_64                             51/240 
        Verifying        : cpio-2.12-8.el8.x86_64                              52/240 
        Verifying        : crypto-policies-20210209-1.gitbfb6bed.el8_3.noar    53/240 
        Verifying        : crypto-policies-20200713-1.git51d1222.el8.noarch    54/240 
        Verifying        : cryptsetup-libs-2.3.3-4.el8.x86_64                  55/240 
        Verifying        : cryptsetup-libs-2.3.3-2.el8.x86_64                  56/240 
        Verifying        : curl-7.61.1-18.el8.x86_64                           57/240 
        Verifying        : curl-7.61.1-14.el8.x86_64                           58/240 
        Verifying        : dbus-1:1.12.8-12.el8_4.2.x86_64                     59/240 
        Verifying        : dbus-1:1.12.8-11.el8.x86_64                         60/240 
        Verifying        : dbus-common-1:1.12.8-12.el8_4.2.noarch              61/240 
        Verifying        : dbus-common-1:1.12.8-11.el8.noarch                  62/240 
        Verifying        : dbus-daemon-1:1.12.8-12.el8_4.2.x86_64              63/240 
        Verifying        : dbus-daemon-1:1.12.8-11.el8.x86_64                  64/240 
        Verifying        : dbus-libs-1:1.12.8-12.el8_4.2.x86_64                65/240 
        Verifying        : dbus-libs-1:1.12.8-11.el8.x86_64                    66/240 
        Verifying        : dbus-tools-1:1.12.8-12.el8_4.2.x86_64               67/240 
        Verifying        : dbus-tools-1:1.12.8-11.el8.x86_64                   68/240 
        Verifying        : device-mapper-8:1.02.175-5.el8.x86_64               69/240 
        Verifying        : device-mapper-8:1.02.171-5.el8.x86_64               70/240 
        Verifying        : device-mapper-libs-8:1.02.175-5.el8.x86_64          71/240 
        Verifying        : device-mapper-libs-8:1.02.171-5.el8.x86_64          72/240 
        Verifying        : dhcp-client-12:4.3.6-44.0.1.el8.x86_64              73/240 
        Verifying        : dhcp-client-12:4.3.6-41.el8.x86_64                  74/240 
        Verifying        : dhcp-common-12:4.3.6-44.0.1.el8.noarch              75/240 
        Verifying        : dhcp-common-12:4.3.6-41.el8.noarch                  76/240 
        Verifying        : dhcp-libs-12:4.3.6-44.0.1.el8.x86_64                77/240 
        Verifying        : dhcp-libs-12:4.3.6-41.el8.x86_64                    78/240 
        Verifying        : dnf-4.4.2-11.el8.noarch                             79/240 
        Verifying        : dnf-4.2.23-4.el8.noarch                             80/240 
        Verifying        : dnf-data-4.4.2-11.el8.noarch                        81/240 
        Verifying        : dnf-data-4.2.23-4.el8.noarch                        82/240 
        Verifying        : dracut-049-135.git20210121.el8.x86_64               83/240 
        Verifying        : dracut-049-95.git20200804.el8.x86_64                84/240 
        Verifying        : dracut-network-049-135.git20210121.el8.x86_64       85/240 
        Verifying        : dracut-network-049-95.git20200804.el8.x86_64        86/240 
        Verifying        : dracut-squash-049-135.git20210121.el8.x86_64        87/240 
        Verifying        : dracut-squash-049-95.git20200804.el8.x86_64         88/240 
        Verifying        : elfutils-default-yama-scope-0.182-3.el8.noarch      89/240 
        Verifying        : elfutils-default-yama-scope-0.180-1.el8.noarch      90/240 
        Verifying        : elfutils-libelf-0.182-3.el8.x86_64                  91/240 
        Verifying        : elfutils-libelf-0.180-1.el8.x86_64                  92/240 
        Verifying        : elfutils-libs-0.182-3.el8.x86_64                    93/240 
        Verifying        : elfutils-libs-0.180-1.el8.x86_64                    94/240 
        Verifying        : ethtool-2:5.8-5.el8.x86_64                          95/240 
        Verifying        : ethtool-2:5.0-2.el8.x86_64                          96/240 
        Verifying        : file-libs-5.33-16.el8_3.1.x86_64                    97/240 
        Verifying        : file-libs-5.33-16.el8.x86_64                        98/240 
        Verifying        : gawk-4.2.1-2.el8.x86_64                             99/240 
        Verifying        : gawk-4.2.1-1.el8.x86_64                            100/240 
        Verifying        : glib2-2.56.4-10.el8_4.x86_64                       101/240 
        Verifying        : glib2-2.56.4-8.el8.x86_64                          102/240 
        Verifying        : glibc-2.28-151.el8.x86_64                          103/240 
        Verifying        : glibc-2.28-127.el8.x86_64                          104/240 
        Verifying        : glibc-common-2.28-151.el8.x86_64                   105/240 
        Verifying        : glibc-common-2.28-127.el8.x86_64                   106/240 
        Verifying        : glibc-minimal-langpack-2.28-151.el8.x86_64         107/240 
        Verifying        : glibc-minimal-langpack-2.28-127.el8.x86_64         108/240 
        Verifying        : gnutls-3.6.14-8.el8_3.x86_64                       109/240 
        Verifying        : gnutls-3.6.14-6.el8.x86_64                         110/240 
        Verifying        : gpgme-1.13.1-7.el8.x86_64                          111/240 
        Verifying        : gpgme-1.13.1-3.el8.x86_64                          112/240 
        Verifying        : gzip-1.9-12.el8.x86_64                             113/240 
        Verifying        : gzip-1.9-9.el8.x86_64                              114/240 
        Verifying        : ima-evm-utils-1.3.2-12.el8.x86_64                  115/240 
        Verifying        : ima-evm-utils-1.1-5.el8.x86_64                     116/240 
        Verifying        : iproute-5.9.0-4.el8.x86_64                         117/240 
        Verifying        : iproute-5.3.0-5.el8.x86_64                         118/240 
        Verifying        : iptables-libs-1.8.4-17.el8.x86_64                  119/240 
        Verifying        : iptables-libs-1.8.4-15.el8.x86_64                  120/240 
        Verifying        : iputils-20180629-7.el8.x86_64                      121/240 
        Verifying        : iputils-20180629-2.el8.x86_64                      122/240 
        Verifying        : json-c-0.13.1-0.4.el8.x86_64                       123/240 
        Verifying        : json-c-0.13.1-0.2.el8.x86_64                       124/240 
        Verifying        : kexec-tools-2.0.20-46.el8_4.1.x86_64               125/240 
        Verifying        : kexec-tools-2.0.20-34.el8.x86_64                   126/240 
        Verifying        : kmod-25-17.el8.x86_64                              127/240 
        Verifying        : kmod-25-16.el8.x86_64                              128/240 
        Verifying        : kmod-libs-25-17.el8.x86_64                         129/240 
        Verifying        : kmod-libs-25-16.el8.x86_64                         130/240 
        Verifying        : krb5-libs-1.18.2-8.el8.x86_64                      131/240 
        Verifying        : krb5-libs-1.18.2-5.el8.x86_64                      132/240 
        Verifying        : libarchive-3.3.3-1.el8.x86_64                      133/240 
        Verifying        : libarchive-3.3.2-9.el8.x86_64                      134/240 
        Verifying        : libblkid-2.32.1-27.el8.x86_64                      135/240 
        Verifying        : libblkid-2.32.1-24.el8.x86_64                      136/240 
        Verifying        : libcomps-0.1.11-5.el8.x86_64                       137/240 
        Verifying        : libcomps-0.1.11-4.el8.x86_64                       138/240 
        Verifying        : libcurl-minimal-7.61.1-18.el8.x86_64               139/240 
        Verifying        : libcurl-minimal-7.61.1-14.el8.x86_64               140/240 
        Verifying        : libdb-5.3.28-40.el8.x86_64                         141/240 
        Verifying        : libdb-5.3.28-39.el8.x86_64                         142/240 
        Verifying        : libdb-utils-5.3.28-40.el8.x86_64                   143/240 
        Verifying        : libdb-utils-5.3.28-39.el8.x86_64                   144/240 
        Verifying        : libdnf-0.55.0-7.el8.x86_64                         145/240 
        Verifying        : libdnf-0.48.0-5.el8.x86_64                         146/240 
        Verifying        : libfdisk-2.32.1-27.el8.x86_64                      147/240 
        Verifying        : libfdisk-2.32.1-24.el8.x86_64                      148/240 
        Verifying        : libgcc-8.4.1-1.el8.x86_64                          149/240 
        Verifying        : libgcc-8.3.1-5.1.el8.x86_64                        150/240 
        Verifying        : libmount-2.32.1-27.el8.x86_64                      151/240 
        Verifying        : libmount-2.32.1-24.el8.x86_64                      152/240 
        Verifying        : libpcap-14:1.9.1-5.el8.x86_64                      153/240 
        Verifying        : libpcap-14:1.9.1-4.el8.x86_64                      154/240 
        Verifying        : libpwquality-1.4.4-3.el8.x86_64                    155/240 
        Verifying        : libpwquality-1.4.0-9.el8.x86_64                    156/240 
        Verifying        : librepo-1.12.0-3.el8.x86_64                        157/240 
        Verifying        : librepo-1.12.0-2.el8.x86_64                        158/240 
        Verifying        : libseccomp-2.5.1-1.el8.x86_64                      159/240 
        Verifying        : libseccomp-2.4.3-1.el8.x86_64                      160/240 
        Verifying        : libselinux-2.9-5.el8.x86_64                        161/240 
        Verifying        : libselinux-2.9-4.el8_3.x86_64                      162/240 
        Verifying        : libsemanage-2.9-6.el8.x86_64                       163/240 
        Verifying        : libsemanage-2.9-3.el8.x86_64                       164/240 
        Verifying        : libsepol-2.9-2.el8.x86_64                          165/240 
        Verifying        : libsepol-2.9-1.el8.x86_64                          166/240 
        Verifying        : libsmartcols-2.32.1-27.el8.x86_64                  167/240 
        Verifying        : libsmartcols-2.32.1-24.el8.x86_64                  168/240 
        Verifying        : libsolv-0.7.16-2.el8.x86_64                        169/240 
        Verifying        : libsolv-0.7.11-1.el8.x86_64                        170/240 
        Verifying        : libstdc++-8.4.1-1.el8.x86_64                       171/240 
        Verifying        : libstdc++-8.3.1-5.1.el8.x86_64                     172/240 
        Verifying        : libuuid-2.32.1-27.el8.x86_64                       173/240 
        Verifying        : libuuid-2.32.1-24.el8.x86_64                       174/240 
        Verifying        : libxml2-2.9.7-9.el8_4.2.x86_64                     175/240 
        Verifying        : libxml2-2.9.7-8.el8.x86_64                         176/240 
        Verifying        : lz4-libs-1.8.3-3.el8_4.x86_64                      177/240 
        Verifying        : lz4-libs-1.8.3-2.el8.x86_64                        178/240 
        Verifying        : nettle-3.4.1-4.el8_3.x86_64                        179/240 
        Verifying        : nettle-3.4.1-2.el8.x86_64                          180/240 
        Verifying        : openldap-2.4.46-17.el8_4.x86_64                    181/240 
        Verifying        : openldap-2.4.46-15.el8.x86_64                      182/240 
        Verifying        : openssl-libs-1:1.1.1g-15.el8_3.x86_64              183/240 
        Verifying        : openssl-libs-1:1.1.1g-11.el8.x86_64                184/240 
        Verifying        : p11-kit-0.23.22-1.el8.x86_64                       185/240 
        Verifying        : p11-kit-0.23.14-5.el8_0.x86_64                     186/240 
        Verifying        : p11-kit-trust-0.23.22-1.el8.x86_64                 187/240 
        Verifying        : p11-kit-trust-0.23.14-5.el8_0.x86_64               188/240 
        Verifying        : pam-1.3.1-14.el8.x86_64                            189/240 
        Verifying        : pam-1.3.1-11.el8.x86_64                            190/240 
        Verifying        : platform-python-3.6.8-37.el8.x86_64                191/240 
        Verifying        : platform-python-3.6.8-31.el8.x86_64                192/240 
        Verifying        : popt-1.18-1.el8.x86_64                             193/240 
        Verifying        : popt-1.16-14.el8.x86_64                            194/240 
        Verifying        : procps-ng-3.3.15-6.el8.x86_64                      195/240 
        Verifying        : procps-ng-3.3.15-3.el8.x86_64                      196/240 
        Verifying        : python3-dnf-4.4.2-11.el8.noarch                    197/240 
        Verifying        : python3-dnf-4.2.23-4.el8.noarch                    198/240 
        Verifying        : python3-gpg-1.13.1-7.el8.x86_64                    199/240 
        Verifying        : python3-gpg-1.13.1-3.el8.x86_64                    200/240 
        Verifying        : python3-hawkey-0.55.0-7.el8.x86_64                 201/240 
        Verifying        : python3-hawkey-0.48.0-5.el8.x86_64                 202/240 
        Verifying        : python3-libcomps-0.1.11-5.el8.x86_64               203/240 
        Verifying        : python3-libcomps-0.1.11-4.el8.x86_64               204/240 
        Verifying        : python3-libdnf-0.55.0-7.el8.x86_64                 205/240 
        Verifying        : python3-libdnf-0.48.0-5.el8.x86_64                 206/240 
        Verifying        : python3-libs-3.6.8-37.el8.x86_64                   207/240 
        Verifying        : python3-libs-3.6.8-31.el8.x86_64                   208/240 
        Verifying        : python3-pip-wheel-9.0.3-19.el8.noarch              209/240 
        Verifying        : python3-pip-wheel-9.0.3-18.el8.noarch              210/240 
        Verifying        : python3-rpm-4.14.3-14.el8_4.x86_64                 211/240 
        Verifying        : python3-rpm-4.14.3-4.el8.x86_64                    212/240 
        Verifying        : rpm-4.14.3-14.el8_4.x86_64                         213/240 
        Verifying        : rpm-4.14.3-4.el8.x86_64                            214/240 
        Verifying        : rpm-build-libs-4.14.3-14.el8_4.x86_64              215/240 
        Verifying        : rpm-build-libs-4.14.3-4.el8.x86_64                 216/240 
        Verifying        : rpm-libs-4.14.3-14.el8_4.x86_64                    217/240 
        Verifying        : rpm-libs-4.14.3-4.el8.x86_64                       218/240 
        Verifying        : shadow-utils-2:4.6-12.el8.x86_64                   219/240 
        Verifying        : shadow-utils-2:4.6-11.el8.x86_64                   220/240 
        Verifying        : sqlite-libs-3.26.0-13.el8.x86_64                   221/240 
        Verifying        : sqlite-libs-3.26.0-11.el8.x86_64                   222/240 
        Verifying        : squashfs-tools-4.3-20.el8.x86_64                   223/240 
        Verifying        : squashfs-tools-4.3-19.el8.x86_64                   224/240 
        Verifying        : systemd-239-45.el8_4.2.x86_64                      225/240 
        Verifying        : systemd-239-41.el8_3.x86_64                        226/240 
        Verifying        : systemd-libs-239-45.el8_4.2.x86_64                 227/240 
        Verifying        : systemd-libs-239-41.el8_3.x86_64                   228/240 
        Verifying        : systemd-pam-239-45.el8_4.2.x86_64                  229/240 
        Verifying        : systemd-pam-239-41.el8_3.x86_64                    230/240 
        Verifying        : systemd-udev-239-45.el8_4.2.x86_64                 231/240 
        Verifying        : systemd-udev-239-41.el8_3.x86_64                   232/240 
        Verifying        : tzdata-2021a-1.el8.noarch                          233/240 
        Verifying        : tzdata-2020d-1.el8.noarch                          234/240 
        Verifying        : util-linux-2.32.1-27.el8.x86_64                    235/240 
        Verifying        : util-linux-2.32.1-24.el8.x86_64                    236/240 
        Verifying        : yum-4.4.2-11.el8.noarch                            237/240 
        Verifying        : yum-4.2.23-4.el8.noarch                            238/240 
        Verifying        : zlib-1.2.11-17.el8.x86_64                          239/240 
        Verifying        : zlib-1.2.11-16.el8_2.x86_64                        240/240 

        Upgraded:
        bash-4.4.20-1.el8_4.x86_64                                                    
        bind-export-libs-32:9.11.26-4.el8_4.x86_64                                    
        binutils-2.30-93.el8.x86_64                                                   
        centos-linux-release-8.4-1.2105.el8.noarch                                    
        cpio-2.12-10.el8.x86_64                                                       
        crypto-policies-20210209-1.gitbfb6bed.el8_3.noarch                            
        cryptsetup-libs-2.3.3-4.el8.x86_64                                            
        curl-7.61.1-18.el8.x86_64                                                     
        dbus-1:1.12.8-12.el8_4.2.x86_64                                               
        dbus-common-1:1.12.8-12.el8_4.2.noarch                                        
        dbus-daemon-1:1.12.8-12.el8_4.2.x86_64                                        
        dbus-libs-1:1.12.8-12.el8_4.2.x86_64                                          
        dbus-tools-1:1.12.8-12.el8_4.2.x86_64                                         
        device-mapper-8:1.02.175-5.el8.x86_64                                         
        device-mapper-libs-8:1.02.175-5.el8.x86_64                                    
        dhcp-client-12:4.3.6-44.0.1.el8.x86_64                                        
        dhcp-common-12:4.3.6-44.0.1.el8.noarch                                        
        dhcp-libs-12:4.3.6-44.0.1.el8.x86_64                                          
        dnf-4.4.2-11.el8.noarch                                                       
        dnf-data-4.4.2-11.el8.noarch                                                  
        dracut-049-135.git20210121.el8.x86_64                                         
        dracut-network-049-135.git20210121.el8.x86_64                                 
        dracut-squash-049-135.git20210121.el8.x86_64                                  
        elfutils-default-yama-scope-0.182-3.el8.noarch                                
        elfutils-libelf-0.182-3.el8.x86_64                                            
        elfutils-libs-0.182-3.el8.x86_64                                              
        ethtool-2:5.8-5.el8.x86_64                                                    
        file-libs-5.33-16.el8_3.1.x86_64                                              
        gawk-4.2.1-2.el8.x86_64                                                       
        glib2-2.56.4-10.el8_4.x86_64                                                  
        glibc-2.28-151.el8.x86_64                                                     
        glibc-common-2.28-151.el8.x86_64                                              
        glibc-minimal-langpack-2.28-151.el8.x86_64                                    
        gnutls-3.6.14-8.el8_3.x86_64                                                  
        gpgme-1.13.1-7.el8.x86_64                                                     
        gzip-1.9-12.el8.x86_64                                                        
        ima-evm-utils-1.3.2-12.el8.x86_64                                             
        iproute-5.9.0-4.el8.x86_64                                                    
        iptables-libs-1.8.4-17.el8.x86_64                                             
        iputils-20180629-7.el8.x86_64                                                 
        json-c-0.13.1-0.4.el8.x86_64                                                  
        kexec-tools-2.0.20-46.el8_4.1.x86_64                                          
        kmod-25-17.el8.x86_64                                                         
        kmod-libs-25-17.el8.x86_64                                                    
        krb5-libs-1.18.2-8.el8.x86_64                                                 
        libarchive-3.3.3-1.el8.x86_64                                                 
        libblkid-2.32.1-27.el8.x86_64                                                 
        libcomps-0.1.11-5.el8.x86_64                                                  
        libcurl-minimal-7.61.1-18.el8.x86_64                                          
        libdb-5.3.28-40.el8.x86_64                                                    
        libdb-utils-5.3.28-40.el8.x86_64                                              
        libdnf-0.55.0-7.el8.x86_64                                                    
        libfdisk-2.32.1-27.el8.x86_64                                                 
        libgcc-8.4.1-1.el8.x86_64                                                     
        libmount-2.32.1-27.el8.x86_64                                                 
        libpcap-14:1.9.1-5.el8.x86_64                                                 
        libpwquality-1.4.4-3.el8.x86_64                                               
        librepo-1.12.0-3.el8.x86_64                                                   
        libseccomp-2.5.1-1.el8.x86_64                                                 
        libselinux-2.9-5.el8.x86_64                                                   
        libsemanage-2.9-6.el8.x86_64                                                  
        libsepol-2.9-2.el8.x86_64                                                     
        libsmartcols-2.32.1-27.el8.x86_64                                             
        libsolv-0.7.16-2.el8.x86_64                                                   
        libstdc++-8.4.1-1.el8.x86_64                                                  
        libuuid-2.32.1-27.el8.x86_64                                                  
        libxml2-2.9.7-9.el8_4.2.x86_64                                                
        lz4-libs-1.8.3-3.el8_4.x86_64                                                 
        nettle-3.4.1-4.el8_3.x86_64                                                   
        openldap-2.4.46-17.el8_4.x86_64                                               
        openssl-libs-1:1.1.1g-15.el8_3.x86_64                                         
        p11-kit-0.23.22-1.el8.x86_64                                                  
        p11-kit-trust-0.23.22-1.el8.x86_64                                            
        pam-1.3.1-14.el8.x86_64                                                       
        platform-python-3.6.8-37.el8.x86_64                                           
        popt-1.18-1.el8.x86_64                                                        
        procps-ng-3.3.15-6.el8.x86_64                                                 
        python3-dnf-4.4.2-11.el8.noarch                                               
        python3-gpg-1.13.1-7.el8.x86_64                                               
        python3-hawkey-0.55.0-7.el8.x86_64                                            
        python3-libcomps-0.1.11-5.el8.x86_64                                          
        python3-libdnf-0.55.0-7.el8.x86_64                                            
        python3-libs-3.6.8-37.el8.x86_64                                              
        python3-pip-wheel-9.0.3-19.el8.noarch                                         
        python3-rpm-4.14.3-14.el8_4.x86_64                                            
        rpm-4.14.3-14.el8_4.x86_64                                                    
        rpm-build-libs-4.14.3-14.el8_4.x86_64                                         
        rpm-libs-4.14.3-14.el8_4.x86_64                                               
        shadow-utils-2:4.6-12.el8.x86_64                                              
        sqlite-libs-3.26.0-13.el8.x86_64                                              
        squashfs-tools-4.3-20.el8.x86_64                                              
        systemd-239-45.el8_4.2.x86_64                                                 
        systemd-libs-239-45.el8_4.2.x86_64                                            
        systemd-pam-239-45.el8_4.2.x86_64                                             
        systemd-udev-239-45.el8_4.2.x86_64                                            
        tzdata-2021a-1.el8.noarch                                                     
        util-linux-2.32.1-27.el8.x86_64                                               
        yum-4.4.2-11.el8.noarch                                                       
        zlib-1.2.11-17.el8.x86_64                                                     

        Installed:
        cracklib-dicts-2.9.6-15.el8.x86_64                                            
        crypto-policies-scripts-20210209-1.gitbfb6bed.el8_3.noarch                    
        diffutils-3.6-6.el8.x86_64                                                    
        elfutils-debuginfod-client-0.182-3.el8.x86_64                                 
        file-5.33-16.el8_3.1.x86_64                                                   
        gettext-0.19.8.1-17.el8.x86_64                                                
        gettext-libs-0.19.8.1-17.el8.x86_64                                           
        glibc-langpack-en-2.28-151.el8.x86_64                                         
        grub2-common-1:2.02-99.el8.noarch                                             
        grub2-tools-1:2.02-99.el8.x86_64                                              
        grub2-tools-minimal-1:2.02-99.el8.x86_64                                      
        grubby-8.40-41.el8.x86_64                                                     
        hardlink-1:1.3-6.el8.x86_64                                                   
        hwdata-0.314-8.8.el8.noarch                                                   
        kbd-2.0.4-10.el8.x86_64                                                       
        kbd-legacy-2.0.4-10.el8.noarch                                                
        kbd-misc-2.0.4-10.el8.noarch                                                  
        kpartx-0.8.4-10.el8.x86_64                                                    
        libcroco-0.6.12-4.el8_2.1.x86_64                                              
        libevent-2.1.8-5.el8.x86_64                                                   
        libgomp-8.4.1-1.el8.x86_64                                                    
        libibverbs-32.0-4.el8.x86_64                                                  
        libnl3-3.5.0-1.el8.x86_64                                                     
        libxkbcommon-0.9.1-1.el8.x86_64                                               
        memstrack-0.1.11-1.el8.x86_64                                                 
        openssl-1:1.1.1g-15.el8_3.x86_64                                              
        openssl-pkcs11-0.4.10-2.el8.x86_64                                            
        os-prober-1.74-6.el8.x86_64                                                   
        pciutils-3.7.0-1.el8.x86_64                                                   
        pciutils-libs-3.7.0-1.el8.x86_64                                              
        pigz-2.4-4.el8.x86_64                                                         
        platform-python-pip-9.0.3-19.el8.noarch                                       
        python3-unbound-1.7.3-15.el8.x86_64                                           
        rdma-core-32.0-4.el8.x86_64                                                   
        rpm-plugin-systemd-inhibit-4.14.3-14.el8_4.x86_64                             
        shared-mime-info-1.9-3.el8.x86_64                                             
        tpm2-tss-2.3.2-3.el8.x86_64                                                   
        trousers-0.3.15-1.el8.x86_64                                                  
        trousers-lib-0.3.15-1.el8.x86_64                                              
        unbound-libs-1.7.3-15.el8.x86_64                                              
        which-2.21-12.el8.x86_64                                                      
        xkeyboard-config-2.28-1.el8.noarch                                            

        Complete!
        Removing intermediate container 46a1755090c7
        ---> 238499cfb5c1
        Step 5/8 : RUN yum -y install nginx
        ---> Running in 8d736840692b
        Last metadata expiration check: 0:00:43 ago on Sat Aug  7 08:31:46 2021.
        Dependencies resolved.
        ==============================================================================================
        Package                       Arch    Version                                Repo        Size
        ==============================================================================================
        Installing:
        nginx                         x86_64  1:1.14.1-9.module_el8.0.0+184+e34fea82 appstream  570 k
        Installing dependencies:
        dejavu-fonts-common           noarch  2.35-7.el8                             baseos      74 k
        dejavu-sans-fonts             noarch  2.35-7.el8                             baseos     1.6 M
        fontconfig                    x86_64  2.13.1-3.el8                           baseos     275 k
        fontpackages-filesystem       noarch  1.44-22.el8                            baseos      16 k
        freetype                      x86_64  2.9.1-4.el8_3.1                        baseos     394 k
        gd                            x86_64  2.2.5-7.el8                            appstream  144 k
        groff-base                    x86_64  1.22.3-18.el8                          baseos     1.0 M
        jbigkit-libs                  x86_64  2.1-14.el8                             appstream   55 k
        libX11                        x86_64  1.6.8-4.el8                            appstream  611 k
        libX11-common                 noarch  1.6.8-4.el8                            appstream  158 k
        libXau                        x86_64  1.0.9-3.el8                            appstream   37 k
        libXpm                        x86_64  3.5.12-8.el8                           appstream   58 k
        libjpeg-turbo                 x86_64  1.5.3-10.el8                           appstream  156 k
        libpng                        x86_64  2:1.6.34-5.el8                         baseos     126 k
        libtiff                       x86_64  4.0.9-18.el8                           appstream  188 k
        libwebp                       x86_64  1.0.0-3.el8_4                          appstream  272 k
        libxcb                        x86_64  1.13.1-1.el8                           appstream  229 k
        libxslt                       x86_64  1.1.32-6.el8                           baseos     250 k
        ncurses                       x86_64  6.1-7.20180224.el8                     baseos     387 k
        nginx-all-modules             noarch  1:1.14.1-9.module_el8.0.0+184+e34fea82 appstream   23 k
        nginx-filesystem              noarch  1:1.14.1-9.module_el8.0.0+184+e34fea82 appstream   24 k
        nginx-mod-http-image-filter   x86_64  1:1.14.1-9.module_el8.0.0+184+e34fea82 appstream   35 k
        nginx-mod-http-perl           x86_64  1:1.14.1-9.module_el8.0.0+184+e34fea82 appstream   45 k
        nginx-mod-http-xslt-filter    x86_64  1:1.14.1-9.module_el8.0.0+184+e34fea82 appstream   33 k
        nginx-mod-mail                x86_64  1:1.14.1-9.module_el8.0.0+184+e34fea82 appstream   64 k
        nginx-mod-stream              x86_64  1:1.14.1-9.module_el8.0.0+184+e34fea82 appstream   85 k
        perl-Carp                     noarch  1.42-396.el8                           baseos      30 k
        perl-Data-Dumper              x86_64  2.167-399.el8                          baseos      58 k
        perl-Digest                   noarch  1.17-395.el8                           appstream   27 k
        perl-Digest-MD5               x86_64  2.55-396.el8                           appstream   37 k
        perl-Encode                   x86_64  4:2.97-3.el8                           baseos     1.5 M
        perl-Errno                    x86_64  1.28-419.el8                           baseos      76 k
        perl-Exporter                 noarch  5.72-396.el8                           baseos      34 k
        perl-File-Path                noarch  2.15-2.el8                             baseos      38 k
        perl-File-Temp                noarch  0.230.600-1.el8                        baseos      63 k
        perl-Getopt-Long              noarch  1:2.50-4.el8                           baseos      63 k
        perl-HTTP-Tiny                noarch  0.074-1.el8                            baseos      58 k
        perl-IO                       x86_64  1.38-419.el8                           baseos     142 k
        perl-MIME-Base64              x86_64  3.15-396.el8                           baseos      31 k
        perl-Net-SSLeay               x86_64  1.88-1.module_el8.3.0+410+ff426aa3     appstream  379 k
        perl-PathTools                x86_64  3.74-1.el8                             baseos      90 k
        perl-Pod-Escapes              noarch  1:1.07-395.el8                         baseos      20 k
        perl-Pod-Perldoc              noarch  3.28-396.el8                           baseos      86 k
        perl-Pod-Simple               noarch  1:3.35-395.el8                         baseos     213 k
        perl-Pod-Usage                noarch  4:1.69-395.el8                         baseos      34 k
        perl-Scalar-List-Utils        x86_64  3:1.49-2.el8                           baseos      68 k
        perl-Socket                   x86_64  4:2.027-3.el8                          baseos      59 k
        perl-Storable                 x86_64  1:3.11-3.el8                           baseos      98 k
        perl-Term-ANSIColor           noarch  4.06-396.el8                           baseos      46 k
        perl-Term-Cap                 noarch  1.17-395.el8                           baseos      23 k
        perl-Text-ParseWords          noarch  3.30-395.el8                           baseos      18 k
        perl-Text-Tabs+Wrap           noarch  2013.0523-395.el8                      baseos      24 k
        perl-Time-Local               noarch  1:1.280-1.el8                          baseos      34 k
        perl-URI                      noarch  1.73-3.el8                             appstream  116 k
        perl-Unicode-Normalize        x86_64  1.25-396.el8                           baseos      82 k
        perl-constant                 noarch  1.33-396.el8                           baseos      25 k
        perl-interpreter              x86_64  4:5.26.3-419.el8                       baseos     6.3 M
        perl-libnet                   noarch  3.11-3.el8                             appstream  121 k
        perl-libs                     x86_64  4:5.26.3-419.el8                       baseos     1.6 M
        perl-macros                   x86_64  4:5.26.3-419.el8                       baseos      72 k
        perl-parent                   noarch  1:0.237-1.el8                          baseos      20 k
        perl-podlators                noarch  4.11-1.el8                             baseos     118 k
        perl-threads                  x86_64  1:2.21-2.el8                           baseos      61 k
        perl-threads-shared           x86_64  1.58-2.el8                             baseos      48 k
        Installing weak dependencies:
        perl-IO-Socket-IP             noarch  0.39-5.el8                             appstream   47 k
        perl-IO-Socket-SSL            noarch  2.066-4.module_el8.3.0+410+ff426aa3    appstream  298 k
        perl-Mozilla-CA               noarch  20160104-7.module_el8.3.0+416+dee7bcef appstream   15 k
        Enabling module streams:
        nginx                                 1.14                                                   
        perl                                  5.26                                                   
        perl-IO-Socket-SSL                    2.066                                                  
        perl-libwww-perl                      6.34                                                   

        Transaction Summary
        ==============================================================================================
        Install  68 Packages

        Total download size: 19 M
        Installed size: 56 M
        Downloading Packages:
        (1/68): jbigkit-libs-2.1-14.el8.x86_64.rpm      7.7 MB/s |  55 kB     00:00    
        (2/68): gd-2.2.5-7.el8.x86_64.rpm                14 MB/s | 144 kB     00:00    
        (3/68): libX11-common-1.6.8-4.el8.noarch.rpm     20 MB/s | 158 kB     00:00    
        (4/68): libXau-1.0.9-3.el8.x86_64.rpm           6.0 MB/s |  37 kB     00:00    
        (5/68): libX11-1.6.8-4.el8.x86_64.rpm            29 MB/s | 611 kB     00:00    
        (6/68): libXpm-3.5.12-8.el8.x86_64.rpm          9.4 MB/s |  58 kB     00:00    
        (7/68): libjpeg-turbo-1.5.3-10.el8.x86_64.rpm    19 MB/s | 156 kB     00:00    
        (8/68): libtiff-4.0.9-18.el8.x86_64.rpm          22 MB/s | 188 kB     00:00    
        (9/68): libwebp-1.0.0-3.el8_4.x86_64.rpm         27 MB/s | 272 kB     00:00    
        (10/68): libxcb-1.13.1-1.el8.x86_64.rpm          21 MB/s | 229 kB     00:00    
        (11/68): nginx-all-modules-1.14.1-9.module_el8. 5.1 MB/s |  23 kB     00:00    
        (12/68): nginx-filesystem-1.14.1-9.module_el8.0 8.4 MB/s |  24 kB     00:00    
        (13/68): nginx-mod-http-image-filter-1.14.1-9.m 8.0 MB/s |  35 kB     00:00    
        (14/68): nginx-mod-http-perl-1.14.1-9.module_el  11 MB/s |  45 kB     00:00    
        (15/68): nginx-1.14.1-9.module_el8.0.0+184+e34f  30 MB/s | 570 kB     00:00    
        (16/68): nginx-mod-http-xslt-filter-1.14.1-9.mo 5.2 MB/s |  33 kB     00:00    
        (17/68): nginx-mod-mail-1.14.1-9.module_el8.0.0  13 MB/s |  64 kB     00:00    
        (18/68): perl-Digest-1.17-395.el8.noarch.rpm    8.3 MB/s |  27 kB     00:00    
        (19/68): nginx-mod-stream-1.14.1-9.module_el8.0  15 MB/s |  85 kB     00:00    
        (20/68): perl-Digest-MD5-2.55-396.el8.x86_64.rp 8.6 MB/s |  37 kB     00:00    
        (21/68): perl-IO-Socket-IP-0.39-5.el8.noarch.rp  15 MB/s |  47 kB     00:00    
        (22/68): perl-Mozilla-CA-20160104-7.module_el8. 6.8 MB/s |  15 kB     00:00    
        (23/68): perl-IO-Socket-SSL-2.066-4.module_el8.  27 MB/s | 298 kB     00:00    
        (24/68): perl-URI-1.73-3.el8.noarch.rpm          13 MB/s | 116 kB     00:00    
        (25/68): perl-Net-SSLeay-1.88-1.module_el8.3.0+  30 MB/s | 379 kB     00:00    
        (26/68): perl-libnet-3.11-3.el8.noarch.rpm       15 MB/s | 121 kB     00:00    
        (27/68): fontconfig-2.13.1-3.el8.x86_64.rpm      19 MB/s | 275 kB     00:00    
        (28/68): fontpackages-filesystem-1.44-22.el8.no 5.0 MB/s |  16 kB     00:00    
        (29/68): dejavu-fonts-common-2.35-7.el8.noarch. 2.1 MB/s |  74 kB     00:00    
        (30/68): dejavu-sans-fonts-2.35-7.el8.noarch.rp  39 MB/s | 1.6 MB     00:00    
        (31/68): freetype-2.9.1-4.el8_3.1.x86_64.rpm     19 MB/s | 394 kB     00:00    
        (32/68): libpng-1.6.34-5.el8.x86_64.rpm          24 MB/s | 126 kB     00:00    
        (33/68): libxslt-1.1.32-6.el8.x86_64.rpm         20 MB/s | 250 kB     00:00    
        (34/68): ncurses-6.1-7.20180224.el8.x86_64.rpm   31 MB/s | 387 kB     00:00    
        (35/68): perl-Carp-1.42-396.el8.noarch.rpm       12 MB/s |  30 kB     00:00    
        (36/68): perl-Data-Dumper-2.167-399.el8.x86_64.  15 MB/s |  58 kB     00:00    
        (37/68): perl-Errno-1.28-419.el8.x86_64.rpm      15 MB/s |  76 kB     00:00    
        (38/68): perl-Exporter-5.72-396.el8.noarch.rpm   11 MB/s |  34 kB     00:00    
        (39/68): groff-base-1.22.3-18.el8.x86_64.rpm     23 MB/s | 1.0 MB     00:00    
        (40/68): perl-File-Path-2.15-2.el8.noarch.rpm   6.2 MB/s |  38 kB     00:00    
        (41/68): perl-File-Temp-0.230.600-1.el8.noarch.  14 MB/s |  63 kB     00:00    
        (42/68): perl-Getopt-Long-2.50-4.el8.noarch.rpm  13 MB/s |  63 kB     00:00    
        (43/68): perl-HTTP-Tiny-0.074-1.el8.noarch.rpm   12 MB/s |  58 kB     00:00    
        (44/68): perl-IO-1.38-419.el8.x86_64.rpm         25 MB/s | 142 kB     00:00    
        (45/68): perl-MIME-Base64-3.15-396.el8.x86_64.r  11 MB/s |  31 kB     00:00    
        (46/68): perl-Encode-2.97-3.el8.x86_64.rpm       42 MB/s | 1.5 MB     00:00    
        (47/68): perl-Pod-Escapes-1.07-395.el8.noarch.r 2.6 MB/s |  20 kB     00:00    
        (48/68): perl-PathTools-3.74-1.el8.x86_64.rpm   8.9 MB/s |  90 kB     00:00    
        (49/68): perl-Pod-Perldoc-3.28-396.el8.noarch.r  23 MB/s |  86 kB     00:00    
        (50/68): perl-Pod-Usage-1.69-395.el8.noarch.rpm  12 MB/s |  34 kB     00:00    
        (51/68): perl-Scalar-List-Utils-1.49-2.el8.x86_  23 MB/s |  68 kB     00:00    
        (52/68): perl-Pod-Simple-3.35-395.el8.noarch.rp  26 MB/s | 213 kB     00:00    
        (53/68): perl-Socket-2.027-3.el8.x86_64.rpm      12 MB/s |  59 kB     00:00    
        (54/68): perl-Term-ANSIColor-4.06-396.el8.noarc  13 MB/s |  46 kB     00:00    
        (55/68): perl-Storable-3.11-3.el8.x86_64.rpm     15 MB/s |  98 kB     00:00    
        (56/68): perl-Text-ParseWords-3.30-395.el8.noar 6.3 MB/s |  18 kB     00:00    
        (57/68): perl-Text-Tabs+Wrap-2013.0523-395.el8. 7.3 MB/s |  24 kB     00:00    
        (58/68): perl-Time-Local-1.280-1.el8.noarch.rpm  11 MB/s |  34 kB     00:00    
        (59/68): perl-Unicode-Normalize-1.25-396.el8.x8  26 MB/s |  82 kB     00:00    
        (60/68): perl-constant-1.33-396.el8.noarch.rpm   11 MB/s |  25 kB     00:00    
        (61/68): perl-Term-Cap-1.17-395.el8.noarch.rpm  1.1 MB/s |  23 kB     00:00    
        (62/68): perl-macros-5.26.3-419.el8.x86_64.rpm   18 MB/s |  72 kB     00:00    
        (63/68): perl-parent-0.237-1.el8.noarch.rpm     4.7 MB/s |  20 kB     00:00    
        (64/68): perl-podlators-4.11-1.el8.noarch.rpm    15 MB/s | 118 kB     00:00    
        (65/68): perl-threads-2.21-2.el8.x86_64.rpm      15 MB/s |  61 kB     00:00    
        (66/68): perl-threads-shared-1.58-2.el8.x86_64.  10 MB/s |  48 kB     00:00    
        (67/68): perl-libs-5.26.3-419.el8.x86_64.rpm     29 MB/s | 1.6 MB     00:00    
        (68/68): perl-interpreter-5.26.3-419.el8.x86_64  53 MB/s | 6.3 MB     00:00    
        --------------------------------------------------------------------------------
        Total                                            33 MB/s |  19 MB     00:00     
        Running transaction check
        Transaction check succeeded.
        Running transaction test
        Transaction test succeeded.
        Running transaction
        Preparing        :                                                        1/1 
        Installing       : libpng-2:1.6.34-5.el8.x86_64                          1/68 
        Installing       : freetype-2.9.1-4.el8_3.1.x86_64                       2/68 
        Installing       : fontpackages-filesystem-1.44-22.el8.noarch            3/68 
        Installing       : libjpeg-turbo-1.5.3-10.el8.x86_64                     4/68 
        Installing       : dejavu-fonts-common-2.35-7.el8.noarch                 5/68 
        Installing       : dejavu-sans-fonts-2.35-7.el8.noarch                   6/68 
        Installing       : fontconfig-2.13.1-3.el8.x86_64                        7/68 
        Running scriptlet: fontconfig-2.13.1-3.el8.x86_64                        7/68 
        Installing       : ncurses-6.1-7.20180224.el8.x86_64                     8/68 
        Installing       : libxslt-1.1.32-6.el8.x86_64                           9/68 
        Installing       : groff-base-1.22.3-18.el8.x86_64                      10/68 
        Installing       : perl-Digest-1.17-395.el8.noarch                      11/68 
        Installing       : perl-Digest-MD5-2.55-396.el8.x86_64                  12/68 
        Installing       : perl-Data-Dumper-2.167-399.el8.x86_64                13/68 
        Installing       : perl-libnet-3.11-3.el8.noarch                        14/68 
        Installing       : perl-Net-SSLeay-1.88-1.module_el8.3.0+410+ff426aa3   15/68 
        Installing       : perl-URI-1.73-3.el8.noarch                           16/68 
        Installing       : perl-Pod-Escapes-1:1.07-395.el8.noarch               17/68 
        Installing       : perl-Mozilla-CA-20160104-7.module_el8.3.0+416+dee7   18/68 
        Installing       : perl-IO-Socket-IP-0.39-5.el8.noarch                  19/68 
        Installing       : perl-Time-Local-1:1.280-1.el8.noarch                 20/68 
        Installing       : perl-IO-Socket-SSL-2.066-4.module_el8.3.0+410+ff42   21/68 
        Installing       : perl-Term-ANSIColor-4.06-396.el8.noarch              22/68 
        Installing       : perl-Term-Cap-1.17-395.el8.noarch                    23/68 
        Installing       : perl-File-Temp-0.230.600-1.el8.noarch                24/68 
        Installing       : perl-Pod-Simple-1:3.35-395.el8.noarch                25/68 
        Installing       : perl-HTTP-Tiny-0.074-1.el8.noarch                    26/68 
        Installing       : perl-podlators-4.11-1.el8.noarch                     27/68 
        Installing       : perl-Pod-Perldoc-3.28-396.el8.noarch                 28/68 
        Installing       : perl-Text-ParseWords-3.30-395.el8.noarch             29/68 
        Installing       : perl-Pod-Usage-4:1.69-395.el8.noarch                 30/68 
        Installing       : perl-MIME-Base64-3.15-396.el8.x86_64                 31/68 
        Installing       : perl-Storable-1:3.11-3.el8.x86_64                    32/68 
        Installing       : perl-Getopt-Long-1:2.50-4.el8.noarch                 33/68 
        Installing       : perl-Errno-1.28-419.el8.x86_64                       34/68 
        Installing       : perl-Socket-4:2.027-3.el8.x86_64                     35/68 
        Installing       : perl-Encode-4:2.97-3.el8.x86_64                      36/68 
        Installing       : perl-Carp-1.42-396.el8.noarch                        37/68 
        Installing       : perl-Exporter-5.72-396.el8.noarch                    38/68 
        Installing       : perl-libs-4:5.26.3-419.el8.x86_64                    39/68 
        Installing       : perl-Scalar-List-Utils-3:1.49-2.el8.x86_64           40/68 
        Installing       : perl-parent-1:0.237-1.el8.noarch                     41/68 
        Installing       : perl-macros-4:5.26.3-419.el8.x86_64                  42/68 
        Installing       : perl-Text-Tabs+Wrap-2013.0523-395.el8.noarch         43/68 
        Installing       : perl-Unicode-Normalize-1.25-396.el8.x86_64           44/68 
        Installing       : perl-File-Path-2.15-2.el8.noarch                     45/68 
        Installing       : perl-IO-1.38-419.el8.x86_64                          46/68 
        Installing       : perl-PathTools-3.74-1.el8.x86_64                     47/68 
        Installing       : perl-constant-1.33-396.el8.noarch                    48/68 
        Installing       : perl-threads-1:2.21-2.el8.x86_64                     49/68 
        Installing       : perl-threads-shared-1.58-2.el8.x86_64                50/68 
        Installing       : perl-interpreter-4:5.26.3-419.el8.x86_64             51/68 
        Running scriptlet: nginx-filesystem-1:1.14.1-9.module_el8.0.0+184+e34   52/68 
        Installing       : nginx-filesystem-1:1.14.1-9.module_el8.0.0+184+e34   52/68 
        Installing       : libwebp-1.0.0-3.el8_4.x86_64                         53/68 
        Installing       : libXau-1.0.9-3.el8.x86_64                            54/68 
        Installing       : libxcb-1.13.1-1.el8.x86_64                           55/68 
        Installing       : libX11-common-1.6.8-4.el8.noarch                     56/68 
        Installing       : libX11-1.6.8-4.el8.x86_64                            57/68 
        Installing       : libXpm-3.5.12-8.el8.x86_64                           58/68 
        Installing       : jbigkit-libs-2.1-14.el8.x86_64                       59/68 
        Running scriptlet: jbigkit-libs-2.1-14.el8.x86_64                       59/68 
        Installing       : libtiff-4.0.9-18.el8.x86_64                          60/68 
        Installing       : gd-2.2.5-7.el8.x86_64                                61/68 
        Running scriptlet: gd-2.2.5-7.el8.x86_64                                61/68 
        Installing       : nginx-mod-http-perl-1:1.14.1-9.module_el8.0.0+184+   62/68 
        Running scriptlet: nginx-mod-http-perl-1:1.14.1-9.module_el8.0.0+184+   62/68 
        Installing       : nginx-mod-http-xslt-filter-1:1.14.1-9.module_el8.0   63/68 
        Running scriptlet: nginx-mod-http-xslt-filter-1:1.14.1-9.module_el8.0   63/68 
        Installing       : nginx-mod-mail-1:1.14.1-9.module_el8.0.0+184+e34fe   64/68 
        Running scriptlet: nginx-mod-mail-1:1.14.1-9.module_el8.0.0+184+e34fe   64/68 
        Installing       : nginx-mod-stream-1:1.14.1-9.module_el8.0.0+184+e34   65/68 
        Running scriptlet: nginx-mod-stream-1:1.14.1-9.module_el8.0.0+184+e34   65/68 
        Installing       : nginx-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_6   66/68 
        Running scriptlet: nginx-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_6   66/68 
        Installing       : nginx-mod-http-image-filter-1:1.14.1-9.module_el8.   67/68 
        Running scriptlet: nginx-mod-http-image-filter-1:1.14.1-9.module_el8.   67/68 
        Installing       : nginx-all-modules-1:1.14.1-9.module_el8.0.0+184+e3   68/68 
        Running scriptlet: nginx-all-modules-1:1.14.1-9.module_el8.0.0+184+e3   68/68 
        Running scriptlet: fontconfig-2.13.1-3.el8.x86_64                       68/68 
        Verifying        : gd-2.2.5-7.el8.x86_64                                 1/68 
        Verifying        : jbigkit-libs-2.1-14.el8.x86_64                        2/68 
        Verifying        : libX11-1.6.8-4.el8.x86_64                             3/68 
        Verifying        : libX11-common-1.6.8-4.el8.noarch                      4/68 
        Verifying        : libXau-1.0.9-3.el8.x86_64                             5/68 
        Verifying        : libXpm-3.5.12-8.el8.x86_64                            6/68 
        Verifying        : libjpeg-turbo-1.5.3-10.el8.x86_64                     7/68 
        Verifying        : libtiff-4.0.9-18.el8.x86_64                           8/68 
        Verifying        : libwebp-1.0.0-3.el8_4.x86_64                          9/68 
        Verifying        : libxcb-1.13.1-1.el8.x86_64                           10/68 
        Verifying        : nginx-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_6   11/68 
        Verifying        : nginx-all-modules-1:1.14.1-9.module_el8.0.0+184+e3   12/68 
        Verifying        : nginx-filesystem-1:1.14.1-9.module_el8.0.0+184+e34   13/68 
        Verifying        : nginx-mod-http-image-filter-1:1.14.1-9.module_el8.   14/68 
        Verifying        : nginx-mod-http-perl-1:1.14.1-9.module_el8.0.0+184+   15/68 
        Verifying        : nginx-mod-http-xslt-filter-1:1.14.1-9.module_el8.0   16/68 
        Verifying        : nginx-mod-mail-1:1.14.1-9.module_el8.0.0+184+e34fe   17/68 
        Verifying        : nginx-mod-stream-1:1.14.1-9.module_el8.0.0+184+e34   18/68 
        Verifying        : perl-Digest-1.17-395.el8.noarch                      19/68 
        Verifying        : perl-Digest-MD5-2.55-396.el8.x86_64                  20/68 
        Verifying        : perl-IO-Socket-IP-0.39-5.el8.noarch                  21/68 
        Verifying        : perl-IO-Socket-SSL-2.066-4.module_el8.3.0+410+ff42   22/68 
        Verifying        : perl-Mozilla-CA-20160104-7.module_el8.3.0+416+dee7   23/68 
        Verifying        : perl-Net-SSLeay-1.88-1.module_el8.3.0+410+ff426aa3   24/68 
        Verifying        : perl-URI-1.73-3.el8.noarch                           25/68 
        Verifying        : perl-libnet-3.11-3.el8.noarch                        26/68 
        Verifying        : dejavu-fonts-common-2.35-7.el8.noarch                27/68 
        Verifying        : dejavu-sans-fonts-2.35-7.el8.noarch                  28/68 
        Verifying        : fontconfig-2.13.1-3.el8.x86_64                       29/68 
        Verifying        : fontpackages-filesystem-1.44-22.el8.noarch           30/68 
        Verifying        : freetype-2.9.1-4.el8_3.1.x86_64                      31/68 
        Verifying        : groff-base-1.22.3-18.el8.x86_64                      32/68 
        Verifying        : libpng-2:1.6.34-5.el8.x86_64                         33/68 
        Verifying        : libxslt-1.1.32-6.el8.x86_64                          34/68 
        Verifying        : ncurses-6.1-7.20180224.el8.x86_64                    35/68 
        Verifying        : perl-Carp-1.42-396.el8.noarch                        36/68 
        Verifying        : perl-Data-Dumper-2.167-399.el8.x86_64                37/68 
        Verifying        : perl-Encode-4:2.97-3.el8.x86_64                      38/68 
        Verifying        : perl-Errno-1.28-419.el8.x86_64                       39/68 
        Verifying        : perl-Exporter-5.72-396.el8.noarch                    40/68 
        Verifying        : perl-File-Path-2.15-2.el8.noarch                     41/68 
        Verifying        : perl-File-Temp-0.230.600-1.el8.noarch                42/68 
        Verifying        : perl-Getopt-Long-1:2.50-4.el8.noarch                 43/68 
        Verifying        : perl-HTTP-Tiny-0.074-1.el8.noarch                    44/68 
        Verifying        : perl-IO-1.38-419.el8.x86_64                          45/68 
        Verifying        : perl-MIME-Base64-3.15-396.el8.x86_64                 46/68 
        Verifying        : perl-PathTools-3.74-1.el8.x86_64                     47/68 
        Verifying        : perl-Pod-Escapes-1:1.07-395.el8.noarch               48/68 
        Verifying        : perl-Pod-Perldoc-3.28-396.el8.noarch                 49/68 
        Verifying        : perl-Pod-Simple-1:3.35-395.el8.noarch                50/68 
        Verifying        : perl-Pod-Usage-4:1.69-395.el8.noarch                 51/68 
        Verifying        : perl-Scalar-List-Utils-3:1.49-2.el8.x86_64           52/68 
        Verifying        : perl-Socket-4:2.027-3.el8.x86_64                     53/68 
        Verifying        : perl-Storable-1:3.11-3.el8.x86_64                    54/68 
        Verifying        : perl-Term-ANSIColor-4.06-396.el8.noarch              55/68 
        Verifying        : perl-Term-Cap-1.17-395.el8.noarch                    56/68 
        Verifying        : perl-Text-ParseWords-3.30-395.el8.noarch             57/68 
        Verifying        : perl-Text-Tabs+Wrap-2013.0523-395.el8.noarch         58/68 
        Verifying        : perl-Time-Local-1:1.280-1.el8.noarch                 59/68 
        Verifying        : perl-Unicode-Normalize-1.25-396.el8.x86_64           60/68 
        Verifying        : perl-constant-1.33-396.el8.noarch                    61/68 
        Verifying        : perl-interpreter-4:5.26.3-419.el8.x86_64             62/68 
        Verifying        : perl-libs-4:5.26.3-419.el8.x86_64                    63/68 
        Verifying        : perl-macros-4:5.26.3-419.el8.x86_64                  64/68 
        Verifying        : perl-parent-1:0.237-1.el8.noarch                     65/68 
        Verifying        : perl-podlators-4.11-1.el8.noarch                     66/68 
        Verifying        : perl-threads-1:2.21-2.el8.x86_64                     67/68 
        Verifying        : perl-threads-shared-1.58-2.el8.x86_64                68/68 

        Installed:
        dejavu-fonts-common-2.35-7.el8.noarch                                         
        dejavu-sans-fonts-2.35-7.el8.noarch                                           
        fontconfig-2.13.1-3.el8.x86_64                                                
        fontpackages-filesystem-1.44-22.el8.noarch                                    
        freetype-2.9.1-4.el8_3.1.x86_64                                               
        gd-2.2.5-7.el8.x86_64                                                         
        groff-base-1.22.3-18.el8.x86_64                                               
        jbigkit-libs-2.1-14.el8.x86_64                                                
        libX11-1.6.8-4.el8.x86_64                                                     
        libX11-common-1.6.8-4.el8.noarch                                              
        libXau-1.0.9-3.el8.x86_64                                                     
        libXpm-3.5.12-8.el8.x86_64                                                    
        libjpeg-turbo-1.5.3-10.el8.x86_64                                             
        libpng-2:1.6.34-5.el8.x86_64                                                  
        libtiff-4.0.9-18.el8.x86_64                                                   
        libwebp-1.0.0-3.el8_4.x86_64                                                  
        libxcb-1.13.1-1.el8.x86_64                                                    
        libxslt-1.1.32-6.el8.x86_64                                                   
        ncurses-6.1-7.20180224.el8.x86_64                                             
        nginx-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_64                           
        nginx-all-modules-1:1.14.1-9.module_el8.0.0+184+e34fea82.noarch               
        nginx-filesystem-1:1.14.1-9.module_el8.0.0+184+e34fea82.noarch                
        nginx-mod-http-image-filter-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_64     
        nginx-mod-http-perl-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_64             
        nginx-mod-http-xslt-filter-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_64      
        nginx-mod-mail-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_64                  
        nginx-mod-stream-1:1.14.1-9.module_el8.0.0+184+e34fea82.x86_64                
        perl-Carp-1.42-396.el8.noarch                                                 
        perl-Data-Dumper-2.167-399.el8.x86_64                                         
        perl-Digest-1.17-395.el8.noarch                                               
        perl-Digest-MD5-2.55-396.el8.x86_64                                           
        perl-Encode-4:2.97-3.el8.x86_64                                               
        perl-Errno-1.28-419.el8.x86_64                                                
        perl-Exporter-5.72-396.el8.noarch                                             
        perl-File-Path-2.15-2.el8.noarch                                              
        perl-File-Temp-0.230.600-1.el8.noarch                                         
        perl-Getopt-Long-1:2.50-4.el8.noarch                                          
        perl-HTTP-Tiny-0.074-1.el8.noarch                                             
        perl-IO-1.38-419.el8.x86_64                                                   
        perl-IO-Socket-IP-0.39-5.el8.noarch                                           
        perl-IO-Socket-SSL-2.066-4.module_el8.3.0+410+ff426aa3.noarch                 
        perl-MIME-Base64-3.15-396.el8.x86_64                                          
        perl-Mozilla-CA-20160104-7.module_el8.3.0+416+dee7bcef.noarch                 
        perl-Net-SSLeay-1.88-1.module_el8.3.0+410+ff426aa3.x86_64                     
        perl-PathTools-3.74-1.el8.x86_64                                              
        perl-Pod-Escapes-1:1.07-395.el8.noarch                                        
        perl-Pod-Perldoc-3.28-396.el8.noarch                                          
        perl-Pod-Simple-1:3.35-395.el8.noarch                                         
        perl-Pod-Usage-4:1.69-395.el8.noarch                                          
        perl-Scalar-List-Utils-3:1.49-2.el8.x86_64                                    
        perl-Socket-4:2.027-3.el8.x86_64                                              
        perl-Storable-1:3.11-3.el8.x86_64                                             
        perl-Term-ANSIColor-4.06-396.el8.noarch                                       
        perl-Term-Cap-1.17-395.el8.noarch                                             
        perl-Text-ParseWords-3.30-395.el8.noarch                                      
        perl-Text-Tabs+Wrap-2013.0523-395.el8.noarch                                  
        perl-Time-Local-1:1.280-1.el8.noarch                                          
        perl-URI-1.73-3.el8.noarch                                                    
        perl-Unicode-Normalize-1.25-396.el8.x86_64                                    
        perl-constant-1.33-396.el8.noarch                                             
        perl-interpreter-4:5.26.3-419.el8.x86_64                                      
        perl-libnet-3.11-3.el8.noarch                                                 
        perl-libs-4:5.26.3-419.el8.x86_64                                             
        perl-macros-4:5.26.3-419.el8.x86_64                                           
        perl-parent-1:0.237-1.el8.noarch                                              
        perl-podlators-4.11-1.el8.noarch                                              
        perl-threads-1:2.21-2.el8.x86_64                                              
        perl-threads-shared-1.58-2.el8.x86_64                                         

        Complete!
        Removing intermediate container 8d736840692b
        ---> aa4d24e85ffa
        Step 6/8 : COPY ./html/nginx/* /usr/share/nginx/html
        ---> 1ee2c05efb41
        Step 7/8 : EXPOSE 80
        ---> Running in 196299c64191
        Removing intermediate container 196299c64191
        ---> cb9992587783
        Step 8/8 : CMD ["nginx", "-g daemon off;"]
        ---> Running in 119c7c79debc
        Removing intermediate container 119c7c79debc
        ---> 249ffd78a4af
        Successfully built 249ffd78a4af
        Successfully tagged 8452/nginxweb:vara
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Deploy_nginx_image)
        [Pipeline] node
        Running on Jenkins in /var/lib/jenkins/workspace/Terraform-nginx_main
        [Pipeline] {
        [Pipeline] withDockerRegistry
        $ docker login -u 8452 -p ******** https://index.docker.io/v1/
        WARNING! Using --password via the CLI is insecure. Use --password-stdin.
        WARNING! Your password will be stored unencrypted in /var/lib/jenkins/workspace/Terraform-nginx_main@tmp/91584225-2abe-4270-afbb-da44bb34f33e/config.json.
        Configure a credential helper to remove this warning. See
        https://docs.docker.com/engine/reference/commandline/login/#credentials-store

        Login Succeeded
        [Pipeline] {
        [Pipeline] sh
        + docker push 8452/nginxweb:vara
        The push refers to repository [docker.io/8452/nginxweb]
        5f598f8da9f7: Preparing
        33452234f3bb: Preparing
        09b73ca7d9f9: Preparing
        d7db0337fab1: Preparing
        2653d992f4ef: Preparing
        2653d992f4ef: Mounted from library/centos
        5f598f8da9f7: Pushed
        d7db0337fab1: Pushed
        33452234f3bb: Pushed
        09b73ca7d9f9: Pushed
        vara: digest: sha256:2c90c68c66007c56e6a0490f47ddf8bfa3b03a0b8413332ea156637466b5ab74 size: 1373
        [Pipeline] }
        [Pipeline] // withDockerRegistry
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (Cleaning_up)
        [Pipeline] node
        Running on Jenkins in /var/lib/jenkins/workspace/Terraform-nginx_main
        [Pipeline] {
        [Pipeline] sh
        + docker rmi 8452/nginxweb:vara
        Untagged: 8452/nginxweb:vara
        Untagged: 8452/nginxweb@sha256:2c90c68c66007c56e6a0490f47ddf8bfa3b03a0b8413332ea156637466b5ab74
        Deleted: sha256:249ffd78a4aff298adad38c9fc22a487b154d15e805131b4a8c424ac909d8456
        Deleted: sha256:cb99925877832416728be7b77eb7b69a971564eda71b62d95b3aec4d057385d6
        Deleted: sha256:1ee2c05efb4175ae67ece8223ff7263d0ba67d8870ccac90a63c61b670edcb9f
        Deleted: sha256:84dbb04a6788dd99389bf2fbef391a49352d1dca7439ca719a6f9b68a45fdbf2
        Deleted: sha256:aa4d24e85ffaf1a8666da7314c3da790fa7b23be05c764c3cff5fe908f8617be
        Deleted: sha256:35c534f2b460a17ec690857d74d9be1943a987a7e9a8b40c0ea303d7a92e898b
        Deleted: sha256:238499cfb5c1339bf9f1a5a51e624bdfbb65b2d37d765f33795ee80f33603237
        Deleted: sha256:3304a94663c6eb5d0fd8ad88afbe0c9499079ee2650c59e70a13713983bbb4f7
        Deleted: sha256:c45c9ae8b3693bf335cbc26453af0df1cde1bec38edd37ad8dd07619cb4d64b4
        Deleted: sha256:28330790cc5686359b08effdb6941d0ee4648e43034cc7fcfe60c546e482592e
        Deleted: sha256:f46ac7411984a51eea5c08bd6165b7438806d0ab38b9fba2c40b567b2dcf168d
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] stage
        [Pipeline] { (deploy)
        [Pipeline] node
        Running on Jenkins in /var/lib/jenkins/workspace/Terraform-nginx_main
        [Pipeline] {
        [Pipeline] withCredentials
        Masking supported pattern matches of $AWS_ACCESS_KEY_ID or $AWS_SECRET_ACCESS_KEY
        [Pipeline] {
        [Pipeline] ansiColor
        [Pipeline] {

        [Pipeline] sh
        + echo 45
        45
        + cd assignment
        + terraform init

        [0m[1mInitializing the backend...[0m

        [0m[1mInitializing provider plugins...[0m
        - Checking for available provider plugins...
        - Downloading plugin for provider "null" (hashicorp/null) 3.1.0...
        - Downloading plugin for provider "aws" (hashicorp/aws) 3.37.0...

        The following providers do not have any version constraints in configuration,
        so the latest version was installed.

        To prevent automatic upgrades to new major versions that may contain breaking
        changes, it is recommended to add version = "..." constraints to the
        corresponding provider blocks in configuration, with the constraint strings
        suggested below.

        * provider.aws: version = "~> 3.37"
        * provider.null: version = "~> 3.1"

        [33m
        [1m[33mWarning: [0m[0m[1mregistry.terraform.io: This version of Terraform has an outdated GPG key and is unable to verify new provider releases. Please upgrade Terraform to at least 0.12.31 to receive new provider updates. For details see: https://discuss.hashicorp.com/t/hcsec-2021-12-codecov-security-event-and-hashicorp-gpg-key-exposure/23512[0m

        [0m[0m[0m
        [33m
        [1m[33mWarning: [0m[0m[1mregistry.terraform.io: This version of Terraform has an outdated GPG key and is unable to verify new provider releases. Please upgrade Terraform to at least 0.12.31 to receive new provider updates. For details see: https://discuss.hashicorp.com/t/hcsec-2021-12-codecov-security-event-and-hashicorp-gpg-key-exposure/23512[0m

        [0m[0m[0m
        [0m[1m[32mTerraform has been successfully initialized![0m[32m[0m
        [0m[32m
        You may now begin working with Terraform. Try running "terraform plan" to see
        any changes that are required for your infrastructure. All Terraform commands
        should now work.

        If you ever set or change modules or backend configuration for Terraform,
        rerun this command to reinitialize your working directory. If you forget, other
        commands will detect it and remind you to do so if necessary.[0m
        + terraform plan
        [0m[1mRefreshing Terraform state in-memory prior to plan...[0m
        The refreshed state will be used to calculate this plan, but will not be
        persisted to local or remote state storage.
        [0m

        ------------------------------------------------------------------------

        An execution plan has been generated and is shown below.
        Resource actions are indicated with the following symbols:
        [32m+[0m create
        [0m
        Terraform will perform the following actions:

        [1m  # aws_eip.myNAT[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_eip" "myNAT" {
            [32m+[0m [0m[1m[0mallocation_id[0m[0m        = (known after apply)
            [32m+[0m [0m[1m[0massociation_id[0m[0m       = (known after apply)
            [32m+[0m [0m[1m[0mcarrier_ip[0m[0m           = (known after apply)
            [32m+[0m [0m[1m[0mcustomer_owned_ip[0m[0m    = (known after apply)
            [32m+[0m [0m[1m[0mdomain[0m[0m               = (known after apply)
            [32m+[0m [0m[1m[0mid[0m[0m                   = (known after apply)
            [32m+[0m [0m[1m[0minstance[0m[0m             = (known after apply)
            [32m+[0m [0m[1m[0mnetwork_border_group[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0mnetwork_interface[0m[0m    = (known after apply)
            [32m+[0m [0m[1m[0mprivate_dns[0m[0m          = (known after apply)
            [32m+[0m [0m[1m[0mprivate_ip[0m[0m           = (known after apply)
            [32m+[0m [0m[1m[0mpublic_dns[0m[0m           = (known after apply)
            [32m+[0m [0m[1m[0mpublic_ip[0m[0m            = (known after apply)
            [32m+[0m [0m[1m[0mpublic_ipv4_pool[0m[0m     = (known after apply)
            [32m+[0m [0m[1m[0mtags[0m[0m                 = {
                [32m+[0m [0m"Name" = "myNAT"
                }
            [32m+[0m [0m[1m[0mvpc[0m[0m                  = true
            }

        [1m  # aws_instance.my-ec2-1[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_instance" "my-ec2-1" {
            [32m+[0m [0m[1m[0mami[0m[0m                          = "ami-0c2b8ca1dad447f8a"
            [32m+[0m [0m[1m[0marn[0m[0m                          = (known after apply)
            [32m+[0m [0m[1m[0massociate_public_ip_address[0m[0m  = true
            [32m+[0m [0m[1m[0mavailability_zone[0m[0m            = (known after apply)
            [32m+[0m [0m[1m[0mcpu_core_count[0m[0m               = (known after apply)
            [32m+[0m [0m[1m[0mcpu_threads_per_core[0m[0m         = (known after apply)
            [32m+[0m [0m[1m[0mget_password_data[0m[0m            = false
            [32m+[0m [0m[1m[0mhost_id[0m[0m                      = (known after apply)
            [32m+[0m [0m[1m[0mid[0m[0m                           = (known after apply)
            [32m+[0m [0m[1m[0minstance_state[0m[0m               = (known after apply)
            [32m+[0m [0m[1m[0minstance_type[0m[0m                = "t2.medium"
            [32m+[0m [0m[1m[0mipv6_address_count[0m[0m           = (known after apply)
            [32m+[0m [0m[1m[0mipv6_addresses[0m[0m               = (known after apply)
            [32m+[0m [0m[1m[0mkey_name[0m[0m                     = "VARA-NOV"
            [32m+[0m [0m[1m[0moutpost_arn[0m[0m                  = (known after apply)
            [32m+[0m [0m[1m[0mpassword_data[0m[0m                = (known after apply)
            [32m+[0m [0m[1m[0mplacement_group[0m[0m              = (known after apply)
            [32m+[0m [0m[1m[0mprimary_network_interface_id[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0mprivate_dns[0m[0m                  = (known after apply)
            [32m+[0m [0m[1m[0mprivate_ip[0m[0m                   = (known after apply)
            [32m+[0m [0m[1m[0mpublic_dns[0m[0m                   = (known after apply)
            [32m+[0m [0m[1m[0mpublic_ip[0m[0m                    = (known after apply)
            [32m+[0m [0m[1m[0msecondary_private_ips[0m[0m        = (known after apply)
            [32m+[0m [0m[1m[0msecurity_groups[0m[0m              = (known after apply)
            [32m+[0m [0m[1m[0msource_dest_check[0m[0m            = true
            [32m+[0m [0m[1m[0msubnet_id[0m[0m                    = (known after apply)
            [32m+[0m [0m[1m[0mtags[0m[0m                         = {
                [32m+[0m [0m"Name" = "my-ec2-1"
                }
            [32m+[0m [0m[1m[0mtenancy[0m[0m                      = (known after apply)
            [32m+[0m [0m[1m[0muser_data[0m[0m                    = "771763f471f5f61137291d90447958445cc116c5"
            [32m+[0m [0m[1m[0mvpc_security_group_ids[0m[0m       = (known after apply)

            [32m+[0m [0mebs_block_device {
                [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
                [32m+[0m [0m[1m[0mdevice_name[0m[0m           = (known after apply)
                [32m+[0m [0m[1m[0mencrypted[0m[0m             = (known after apply)
                [32m+[0m [0m[1m[0miops[0m[0m                  = (known after apply)
                [32m+[0m [0m[1m[0mkms_key_id[0m[0m            = (known after apply)
                [32m+[0m [0m[1m[0msnapshot_id[0m[0m           = (known after apply)
                [32m+[0m [0m[1m[0mtags[0m[0m                  = (known after apply)
                [32m+[0m [0m[1m[0mthroughput[0m[0m            = (known after apply)
                [32m+[0m [0m[1m[0mvolume_id[0m[0m             = (known after apply)
                [32m+[0m [0m[1m[0mvolume_size[0m[0m           = (known after apply)
                [32m+[0m [0m[1m[0mvolume_type[0m[0m           = (known after apply)
                }

            [32m+[0m [0menclave_options {
                [32m+[0m [0m[1m[0menabled[0m[0m = (known after apply)
                }

            [32m+[0m [0mephemeral_block_device {
                [32m+[0m [0m[1m[0mdevice_name[0m[0m  = (known after apply)
                [32m+[0m [0m[1m[0mno_device[0m[0m    = (known after apply)
                [32m+[0m [0m[1m[0mvirtual_name[0m[0m = (known after apply)
                }

            [32m+[0m [0mmetadata_options {
                [32m+[0m [0m[1m[0mhttp_endpoint[0m[0m               = (known after apply)
                [32m+[0m [0m[1m[0mhttp_put_response_hop_limit[0m[0m = (known after apply)
                [32m+[0m [0m[1m[0mhttp_tokens[0m[0m                 = (known after apply)
                }

            [32m+[0m [0mnetwork_interface {
                [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
                [32m+[0m [0m[1m[0mdevice_index[0m[0m          = (known after apply)
                [32m+[0m [0m[1m[0mnetwork_interface_id[0m[0m  = (known after apply)
                }

            [32m+[0m [0mroot_block_device {
                [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = true
                [32m+[0m [0m[1m[0mdevice_name[0m[0m           = (known after apply)
                [32m+[0m [0m[1m[0mencrypted[0m[0m             = (known after apply)
                [32m+[0m [0m[1m[0miops[0m[0m                  = (known after apply)
                [32m+[0m [0m[1m[0mkms_key_id[0m[0m            = (known after apply)
                [32m+[0m [0m[1m[0mthroughput[0m[0m            = (known after apply)
                [32m+[0m [0m[1m[0mvolume_id[0m[0m             = (known after apply)
                [32m+[0m [0m[1m[0mvolume_size[0m[0m           = 30
                [32m+[0m [0m[1m[0mvolume_type[0m[0m           = "gp2"
                }
            }

        [1m  # aws_internet_gateway.myIGW[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_internet_gateway" "myIGW" {
            [32m+[0m [0m[1m[0marn[0m[0m      = (known after apply)
            [32m+[0m [0m[1m[0mid[0m[0m       = (known after apply)
            [32m+[0m [0m[1m[0mowner_id[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0mtags[0m[0m     = {
                [32m+[0m [0m"Name" = "myIGW"
                }
            [32m+[0m [0m[1m[0mvpc_id[0m[0m   = (known after apply)
            }

        [1m  # aws_nat_gateway.natGT[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_nat_gateway" "natGT" {
            [32m+[0m [0m[1m[0mallocation_id[0m[0m        = (known after apply)
            [32m+[0m [0m[1m[0mid[0m[0m                   = (known after apply)
            [32m+[0m [0m[1m[0mnetwork_interface_id[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0mprivate_ip[0m[0m           = (known after apply)
            [32m+[0m [0m[1m[0mpublic_ip[0m[0m            = (known after apply)
            [32m+[0m [0m[1m[0msubnet_id[0m[0m            = (known after apply)
            }

        [1m  # aws_route.jenkins-route[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_route" "jenkins-route" {
            [32m+[0m [0m[1m[0mdestination_cidr_block[0m[0m    = "10.20.0.0/16"
            [32m+[0m [0m[1m[0mid[0m[0m                        = (known after apply)
            [32m+[0m [0m[1m[0minstance_id[0m[0m               = (known after apply)
            [32m+[0m [0m[1m[0minstance_owner_id[0m[0m         = (known after apply)
            [32m+[0m [0m[1m[0mnetwork_interface_id[0m[0m      = (known after apply)
            [32m+[0m [0m[1m[0morigin[0m[0m                    = (known after apply)
            [32m+[0m [0m[1m[0mroute_table_id[0m[0m            = "rtb-098b917dbc5d4773f"
            [32m+[0m [0m[1m[0mstate[0m[0m                     = (known after apply)
            [32m+[0m [0m[1m[0mvpc_peering_connection_id[0m[0m = (known after apply)
            }

        [1m  # aws_route_table.myRT-NAT-private[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_route_table" "myRT-NAT-private" {
            [32m+[0m [0m[1m[0marn[0m[0m              = (known after apply)
            [32m+[0m [0m[1m[0mid[0m[0m               = (known after apply)
            [32m+[0m [0m[1m[0mowner_id[0m[0m         = (known after apply)
            [32m+[0m [0m[1m[0mpropagating_vgws[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0mroute[0m[0m            = [
                [32m+[0m [0m{
                    [32m+[0m [0mcarrier_gateway_id         = ""
                    [32m+[0m [0mcidr_block                 = "0.0.0.0/0"
                    [32m+[0m [0mdestination_prefix_list_id = ""
                    [32m+[0m [0megress_only_gateway_id     = ""
                    [32m+[0m [0mgateway_id                 = ""
                    [32m+[0m [0minstance_id                = ""
                    [32m+[0m [0mipv6_cidr_block            = ""
                    [32m+[0m [0mlocal_gateway_id           = ""
                    [32m+[0m [0mnat_gateway_id             = (known after apply)
                    [32m+[0m [0mnetwork_interface_id       = ""
                    [32m+[0m [0mtransit_gateway_id         = ""
                    [32m+[0m [0mvpc_endpoint_id            = ""
                    [32m+[0m [0mvpc_peering_connection_id  = ""
                    },
                ]
            [32m+[0m [0m[1m[0mtags[0m[0m             = {
                [32m+[0m [0m"Name" = "myRT-NAT-private"
                }
            [32m+[0m [0m[1m[0mvpc_id[0m[0m           = (known after apply)
            }

        [1m  # aws_route_table.myRT-public[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_route_table" "myRT-public" {
            [32m+[0m [0m[1m[0marn[0m[0m              = (known after apply)
            [32m+[0m [0m[1m[0mid[0m[0m               = (known after apply)
            [32m+[0m [0m[1m[0mowner_id[0m[0m         = (known after apply)
            [32m+[0m [0m[1m[0mpropagating_vgws[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0mroute[0m[0m            = [
                [32m+[0m [0m{
                    [32m+[0m [0mcarrier_gateway_id         = ""
                    [32m+[0m [0mcidr_block                 = "0.0.0.0/0"
                    [32m+[0m [0mdestination_prefix_list_id = ""
                    [32m+[0m [0megress_only_gateway_id     = ""
                    [32m+[0m [0mgateway_id                 = (known after apply)
                    [32m+[0m [0minstance_id                = ""
                    [32m+[0m [0mipv6_cidr_block            = ""
                    [32m+[0m [0mlocal_gateway_id           = ""
                    [32m+[0m [0mnat_gateway_id             = ""
                    [32m+[0m [0mnetwork_interface_id       = ""
                    [32m+[0m [0mtransit_gateway_id         = ""
                    [32m+[0m [0mvpc_endpoint_id            = ""
                    [32m+[0m [0mvpc_peering_connection_id  = ""
                    },
                [32m+[0m [0m{
                    [32m+[0m [0mcarrier_gateway_id         = ""
                    [32m+[0m [0mcidr_block                 = "10.0.0.0/16"
                    [32m+[0m [0mdestination_prefix_list_id = ""
                    [32m+[0m [0megress_only_gateway_id     = ""
                    [32m+[0m [0mgateway_id                 = (known after apply)
                    [32m+[0m [0minstance_id                = ""
                    [32m+[0m [0mipv6_cidr_block            = ""
                    [32m+[0m [0mlocal_gateway_id           = ""
                    [32m+[0m [0mnat_gateway_id             = ""
                    [32m+[0m [0mnetwork_interface_id       = ""
                    [32m+[0m [0mtransit_gateway_id         = ""
                    [32m+[0m [0mvpc_endpoint_id            = ""
                    [32m+[0m [0mvpc_peering_connection_id  = ""
                    },
                ]
            [32m+[0m [0m[1m[0mtags[0m[0m             = {
                [32m+[0m [0m"Name" = "myRT-public-1"
                }
            [32m+[0m [0m[1m[0mvpc_id[0m[0m           = (known after apply)
            }

        [1m  # aws_route_table_association.myRTA-private-1-a[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_route_table_association" "myRTA-private-1-a" {
            [32m+[0m [0m[1m[0mid[0m[0m             = (known after apply)
            [32m+[0m [0m[1m[0mroute_table_id[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0msubnet_id[0m[0m      = (known after apply)
            }

        [1m  # aws_route_table_association.myRTA-public-1-a[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_route_table_association" "myRTA-public-1-a" {
            [32m+[0m [0m[1m[0mid[0m[0m             = (known after apply)
            [32m+[0m [0m[1m[0mroute_table_id[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0msubnet_id[0m[0m      = (known after apply)
            }

        [1m  # aws_security_group.mySG[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_security_group" "mySG" {
            [32m+[0m [0m[1m[0marn[0m[0m                    = (known after apply)
            [32m+[0m [0m[1m[0mdescription[0m[0m            = "security group that allows ssh and all egress traffic"
            [32m+[0m [0m[1m[0megress[0m[0m                 = [
                [32m+[0m [0m{
                    [32m+[0m [0mcidr_blocks      = [
                        [32m+[0m [0m"0.0.0.0/0",
                        ]
                    [32m+[0m [0mdescription      = ""
                    [32m+[0m [0mfrom_port        = 0
                    [32m+[0m [0mipv6_cidr_blocks = []
                    [32m+[0m [0mprefix_list_ids  = []
                    [32m+[0m [0mprotocol         = "-1"
                    [32m+[0m [0msecurity_groups  = []
                    [32m+[0m [0mself             = false
                    [32m+[0m [0mto_port          = 0
                    },
                ]
            [32m+[0m [0m[1m[0mid[0m[0m                     = (known after apply)
            [32m+[0m [0m[1m[0mingress[0m[0m                = [
                [32m+[0m [0m{
                    [32m+[0m [0mcidr_blocks      = [
                        [32m+[0m [0m"10.0.0.0/16",
                        ]
                    [32m+[0m [0mdescription      = ""
                    [32m+[0m [0mfrom_port        = 0
                    [32m+[0m [0mipv6_cidr_blocks = []
                    [32m+[0m [0mprefix_list_ids  = []
                    [32m+[0m [0mprotocol         = "-1"
                    [32m+[0m [0msecurity_groups  = []
                    [32m+[0m [0mself             = false
                    [32m+[0m [0mto_port          = 0
                    },
                [32m+[0m [0m{
                    [32m+[0m [0mcidr_blocks      = [
                        [32m+[0m [0m"10.0.0.0/16",
                        ]
                    [32m+[0m [0mdescription      = ""
                    [32m+[0m [0mfrom_port        = 22
                    [32m+[0m [0mipv6_cidr_blocks = []
                    [32m+[0m [0mprefix_list_ids  = []
                    [32m+[0m [0mprotocol         = "tcp"
                    [32m+[0m [0msecurity_groups  = []
                    [32m+[0m [0mself             = false
                    [32m+[0m [0mto_port          = 22
                    },
                [32m+[0m [0m{
                    [32m+[0m [0mcidr_blocks      = [
                        [32m+[0m [0m"103.99.8.0/24",
                        ]
                    [32m+[0m [0mdescription      = ""
                    [32m+[0m [0mfrom_port        = 0
                    [32m+[0m [0mipv6_cidr_blocks = []
                    [32m+[0m [0mprefix_list_ids  = []
                    [32m+[0m [0mprotocol         = "-1"
                    [32m+[0m [0msecurity_groups  = []
                    [32m+[0m [0mself             = false
                    [32m+[0m [0mto_port          = 0
                    },
                ]
            [32m+[0m [0m[1m[0mname[0m[0m                   = "mySG"
            [32m+[0m [0m[1m[0mname_prefix[0m[0m            = (known after apply)
            [32m+[0m [0m[1m[0mowner_id[0m[0m               = (known after apply)
            [32m+[0m [0m[1m[0mrevoke_rules_on_delete[0m[0m = false
            [32m+[0m [0m[1m[0mtags[0m[0m                   = {
                [32m+[0m [0m"Name" = "mySG"
                }
            [32m+[0m [0m[1m[0mvpc_id[0m[0m                 = (known after apply)
            }

        [1m  # aws_subnet.myVPC-private-1[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_subnet" "myVPC-private-1" {
            [32m+[0m [0m[1m[0marn[0m[0m                             = (known after apply)
            [32m+[0m [0m[1m[0massign_ipv6_address_on_creation[0m[0m = false
            [32m+[0m [0m[1m[0mavailability_zone[0m[0m               = "us-east-1a"
            [32m+[0m [0m[1m[0mavailability_zone_id[0m[0m            = (known after apply)
            [32m+[0m [0m[1m[0mcidr_block[0m[0m                      = "10.20.4.0/24"
            [32m+[0m [0m[1m[0mid[0m[0m                              = (known after apply)
            [32m+[0m [0m[1m[0mipv6_cidr_block_association_id[0m[0m  = (known after apply)
            [32m+[0m [0m[1m[0mmap_public_ip_on_launch[0m[0m         = false
            [32m+[0m [0m[1m[0mowner_id[0m[0m                        = (known after apply)
            [32m+[0m [0m[1m[0mtags[0m[0m                            = {
                [32m+[0m [0m"Name" = "myVPC-private-1"
                }
            [32m+[0m [0m[1m[0mtags_all[0m[0m                        = {
                [32m+[0m [0m"Name" = "myVPC-private-1"
                }
            [32m+[0m [0m[1m[0mvpc_id[0m[0m                          = (known after apply)
            }

        [1m  # aws_subnet.myVPC-public-1[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_subnet" "myVPC-public-1" {
            [32m+[0m [0m[1m[0marn[0m[0m                             = (known after apply)
            [32m+[0m [0m[1m[0massign_ipv6_address_on_creation[0m[0m = false
            [32m+[0m [0m[1m[0mavailability_zone[0m[0m               = "us-east-1a"
            [32m+[0m [0m[1m[0mavailability_zone_id[0m[0m            = (known after apply)
            [32m+[0m [0m[1m[0mcidr_block[0m[0m                      = "10.20.1.0/24"
            [32m+[0m [0m[1m[0mid[0m[0m                              = (known after apply)
            [32m+[0m [0m[1m[0mipv6_cidr_block_association_id[0m[0m  = (known after apply)
            [32m+[0m [0m[1m[0mmap_public_ip_on_launch[0m[0m         = true
            [32m+[0m [0m[1m[0mowner_id[0m[0m                        = (known after apply)
            [32m+[0m [0m[1m[0mtags[0m[0m                            = {
                [32m+[0m [0m"Name" = "myVPC-public-1"
                }
            [32m+[0m [0m[1m[0mtags_all[0m[0m                        = {
                [32m+[0m [0m"Name" = "myVPC-public-1"
                }
            [32m+[0m [0m[1m[0mvpc_id[0m[0m                          = (known after apply)
            }

        [1m  # aws_vpc.myVPC[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_vpc" "myVPC" {
            [32m+[0m [0m[1m[0marn[0m[0m                              = (known after apply)
            [32m+[0m [0m[1m[0massign_generated_ipv6_cidr_block[0m[0m = false
            [32m+[0m [0m[1m[0mcidr_block[0m[0m                       = "10.20.0.0/16"
            [32m+[0m [0m[1m[0mdefault_network_acl_id[0m[0m           = (known after apply)
            [32m+[0m [0m[1m[0mdefault_route_table_id[0m[0m           = (known after apply)
            [32m+[0m [0m[1m[0mdefault_security_group_id[0m[0m        = (known after apply)
            [32m+[0m [0m[1m[0mdhcp_options_id[0m[0m                  = (known after apply)
            [32m+[0m [0m[1m[0menable_classiclink[0m[0m               = false
            [32m+[0m [0m[1m[0menable_classiclink_dns_support[0m[0m   = (known after apply)
            [32m+[0m [0m[1m[0menable_dns_hostnames[0m[0m             = true
            [32m+[0m [0m[1m[0menable_dns_support[0m[0m               = true
            [32m+[0m [0m[1m[0mid[0m[0m                               = (known after apply)
            [32m+[0m [0m[1m[0minstance_tenancy[0m[0m                 = "default"
            [32m+[0m [0m[1m[0mipv6_association_id[0m[0m              = (known after apply)
            [32m+[0m [0m[1m[0mipv6_cidr_block[0m[0m                  = (known after apply)
            [32m+[0m [0m[1m[0mmain_route_table_id[0m[0m              = (known after apply)
            [32m+[0m [0m[1m[0mowner_id[0m[0m                         = (known after apply)
            [32m+[0m [0m[1m[0mtags[0m[0m                             = {
                [32m+[0m [0m"Name" = "myVPC"
                }
            [32m+[0m [0m[1m[0mtags_all[0m[0m                         = {
                [32m+[0m [0m"Name" = "myVPC"
                }
            }

        [1m  # aws_vpc_peering_connection.jenkins-nginx[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "aws_vpc_peering_connection" "jenkins-nginx" {
            [32m+[0m [0m[1m[0maccept_status[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0mauto_accept[0m[0m   = true
            [32m+[0m [0m[1m[0mid[0m[0m            = (known after apply)
            [32m+[0m [0m[1m[0mpeer_owner_id[0m[0m = (known after apply)
            [32m+[0m [0m[1m[0mpeer_region[0m[0m   = (known after apply)
            [32m+[0m [0m[1m[0mpeer_vpc_id[0m[0m   = (known after apply)
            [32m+[0m [0m[1m[0mtags[0m[0m          = {
                [32m+[0m [0m"Name" = "jenkins-nginx"
                }
            [32m+[0m [0m[1m[0mvpc_id[0m[0m        = "vpc-0993ddca304a20577"

            [32m+[0m [0maccepter {
                [32m+[0m [0m[1m[0mallow_classic_link_to_remote_vpc[0m[0m = false
                [32m+[0m [0m[1m[0mallow_remote_vpc_dns_resolution[0m[0m  = true
                [32m+[0m [0m[1m[0mallow_vpc_to_remote_classic_link[0m[0m = false
                }

            [32m+[0m [0mrequester {
                [32m+[0m [0m[1m[0mallow_classic_link_to_remote_vpc[0m[0m = false
                [32m+[0m [0m[1m[0mallow_remote_vpc_dns_resolution[0m[0m  = true
                [32m+[0m [0m[1m[0mallow_vpc_to_remote_classic_link[0m[0m = false
                }
            }

        [1m  # null_resource.configure_nginx[0m will be created[0m[0m
        [0m  [32m+[0m[0m resource "null_resource" "configure_nginx" {
            [32m+[0m [0m[1m[0mid[0m[0m = (known after apply)
            }

        [0m[1mPlan:[0m 15 to add, 0 to change, 0 to destroy.[0m
        [33m
        [1m[33mWarning: [0m[0m[1mInterpolation-only expressions are deprecated[0m

        [0m  on ec2_instance.tf line 3, in provider "aws":
        3:   region = [4m"${var.AWS_REGION}"[0m
        [0m
        Terraform 0.11 and earlier required all non-constant expressions to be
        provided via interpolation syntax, but this pattern is now deprecated. To
        silence this warning, remove the "${ sequence from the start and the }"
        sequence from the end of this expression, leaving just the inner expression.

        Template interpolation syntax is still used to construct strings from
        expressions when the template includes multiple interpolation sequences or a
        mixture of literal strings and interpolations. This deprecation applies only
        to templates that consist entirely of a single interpolation sequence.

        (and 20 more similar warnings elsewhere)
        [0m[0m
        [33m
        [1m[33mWarning: [0m[0m[1mQuoted references are deprecated[0m

        [0m  on ec2_instance.tf line 114, in resource "aws_nat_gateway" "natGT":
        114:     depends_on = [[4m"aws_internet_gateway.myIGW"[0m]
        [0m
        In this context, references are expected literally rather than in quotes.
        Terraform 0.11 and earlier required quotes, but quoted references are now
        deprecated and will be removed in a future version of Terraform. Remove the
        quotes surrounding this reference to silence this warning.
        [0m[0m

        ------------------------------------------------------------------------

        Note: You didn't specify an "-out" parameter to save this plan, so Terraform
        can't guarantee that exactly these actions will be performed if
        "terraform apply" is subsequently run.

        + terraform apply -auto-approve
        [0m[1maws_eip.myNAT: Creating...[0m[0m
        [0m[1maws_vpc.myVPC: Creating...[0m[0m
        [0m[1maws_eip.myNAT: Creation complete after 1s [id=eipalloc-0d73c21ef0cc461d4][0m[0m
        [0m[1maws_vpc.myVPC: Still creating... [10s elapsed][0m[0m
        [0m[1maws_vpc.myVPC: Creation complete after 12s [id=vpc-0f8b4df0a610ffebb][0m[0m
        [0m[1maws_internet_gateway.myIGW: Creating...[0m[0m
        [0m[1maws_subnet.myVPC-public-1: Creating...[0m[0m
        [0m[1maws_subnet.myVPC-private-1: Creating...[0m[0m
        [0m[1maws_vpc_peering_connection.jenkins-nginx: Creating...[0m[0m
        [0m[1maws_security_group.mySG: Creating...[0m[0m
        [0m[1maws_internet_gateway.myIGW: Creation complete after 0s [id=igw-044d5d8fa0eb9b736][0m[0m
        [0m[1maws_subnet.myVPC-private-1: Creation complete after 0s [id=subnet-0ded6dbcc0b0ec47d][0m[0m
        [0m[1maws_vpc_peering_connection.jenkins-nginx: Creation complete after 1s [id=pcx-0a795ce87c6a80d37][0m[0m
        [0m[1maws_route.jenkins-route: Creating...[0m[0m
        [0m[1maws_route_table.myRT-public: Creating...[0m[0m
        [0m[1maws_route.jenkins-route: Creation complete after 0s [id=r-rtb-098b917dbc5d4773f662290444][0m[0m
        [0m[1maws_route_table.myRT-public: Creation complete after 0s [id=rtb-063cc3c94e59c17c4][0m[0m
        [0m[1maws_security_group.mySG: Creation complete after 2s [id=sg-04d02b8bd1be94b24][0m[0m
        [0m[1maws_subnet.myVPC-public-1: Still creating... [10s elapsed][0m[0m
        [0m[1maws_subnet.myVPC-public-1: Creation complete after 10s [id=subnet-00ab5337dfc6aef4b][0m[0m
        [0m[1maws_nat_gateway.natGT: Creating...[0m[0m
        [0m[1maws_route_table_association.myRTA-public-1-a: Creating...[0m[0m
        [0m[1maws_instance.my-ec2-1: Creating...[0m[0m
        [0m[1maws_route_table_association.myRTA-public-1-a: Creation complete after 1s [id=rtbassoc-03ed63bdad09fc6f0][0m[0m
        [0m[1maws_nat_gateway.natGT: Still creating... [10s elapsed][0m[0m
        [0m[1maws_instance.my-ec2-1: Still creating... [10s elapsed][0m[0m
        [0m[1maws_nat_gateway.natGT: Still creating... [20s elapsed][0m[0m
        [0m[1maws_instance.my-ec2-1: Still creating... [20s elapsed][0m[0m
        [0m[1maws_nat_gateway.natGT: Still creating... [30s elapsed][0m[0m
        [0m[1maws_instance.my-ec2-1: Still creating... [30s elapsed][0m[0m
        [0m[1maws_instance.my-ec2-1: Creation complete after 33s [id=i-0e1dc74880e49f18f][0m[0m
        [0m[1mnull_resource.configure_nginx: Creating...[0m[0m
        [0m[1mnull_resource.configure_nginx: Provisioning with 'remote-exec'...[0m[0m
        [0m[0mnull_resource.configure_nginx (remote-exec): Connecting to remote host via SSH...
        null_resource.configure_nginx (remote-exec):   Host: 10.20.1.119
        null_resource.configure_nginx (remote-exec):   User: ec2-user
        null_resource.configure_nginx (remote-exec):   Password: false
        null_resource.configure_nginx (remote-exec):   Private key: true
        null_resource.configure_nginx (remote-exec):   Certificate: false
        null_resource.configure_nginx (remote-exec):   SSH Agent: false
        null_resource.configure_nginx (remote-exec):   Checking Host Key: false
        [0m[1maws_nat_gateway.natGT: Still creating... [40s elapsed][0m[0m
        [0m[0mnull_resource.configure_nginx (remote-exec): Connecting to remote host via SSH...
        null_resource.configure_nginx (remote-exec):   Host: 10.20.1.119
        null_resource.configure_nginx (remote-exec):   User: ec2-user
        null_resource.configure_nginx (remote-exec):   Password: false
        null_resource.configure_nginx (remote-exec):   Private key: true
        null_resource.configure_nginx (remote-exec):   Certificate: false
        null_resource.configure_nginx (remote-exec):   SSH Agent: false
        null_resource.configure_nginx (remote-exec):   Checking Host Key: false
        [0m[1mnull_resource.configure_nginx: Still creating... [10s elapsed][0m[0m
        [0m[0mnull_resource.configure_nginx (remote-exec): Connecting to remote host via SSH...
        null_resource.configure_nginx (remote-exec):   Host: 10.20.1.119
        null_resource.configure_nginx (remote-exec):   User: ec2-user
        null_resource.configure_nginx (remote-exec):   Password: false
        null_resource.configure_nginx (remote-exec):   Private key: true
        null_resource.configure_nginx (remote-exec):   Certificate: false
        null_resource.configure_nginx (remote-exec):   SSH Agent: false
        null_resource.configure_nginx (remote-exec):   Checking Host Key: false
        [0m[0mnull_resource.configure_nginx (remote-exec): Connected!
        [0m[1maws_nat_gateway.natGT: Still creating... [50s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [20s elapsed][0m[0m
        [0m[1maws_nat_gateway.natGT: Still creating... [1m0s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [30s elapsed][0m[0m
        [0m[1maws_nat_gateway.natGT: Still creating... [1m10s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [40s elapsed][0m[0m
        [0m[1maws_nat_gateway.natGT: Still creating... [1m20s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [50s elapsed][0m[0m
        [0m[1maws_nat_gateway.natGT: Still creating... [1m30s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [1m0s elapsed][0m[0m
        [0m[1maws_nat_gateway.natGT: Still creating... [1m40s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [1m10s elapsed][0m[0m
        [0m[1maws_nat_gateway.natGT: Creation complete after 1m45s [id=nat-053d3a1dba3f30b30][0m[0m
        [0m[1maws_route_table.myRT-NAT-private: Creating...[0m[0m
        [0m[1maws_route_table.myRT-NAT-private: Creation complete after 1s [id=rtb-0cdc793607a52a72e][0m[0m
        [0m[1maws_route_table_association.myRTA-private-1-a: Creating...[0m[0m
        [0m[1maws_route_table_association.myRTA-private-1-a: Creation complete after 0s [id=rtbassoc-0ba95c0a8173bc3c1][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [1m20s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [1m30s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [1m40s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [1m50s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [2m0s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [2m10s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [2m20s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [2m30s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [2m40s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [2m50s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [3m0s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [3m10s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [3m20s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [3m30s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [3m40s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [3m50s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [4m0s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [4m10s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [4m20s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [4m30s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [4m40s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [4m50s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [5m0s elapsed][0m[0m
        [0m[1mnull_resource.configure_nginx: Still creating... [5m10s elapsed][0m[0m
        [0m[0mnull_resource.configure_nginx (remote-exec): vara: Pulling from 8452/nginxweb
        [0m[0m
        [0m[0mnull_resource.configure_nginx (remote-exec): [1A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Pulling fs layer
        null_resource.configure_nginx (remote-exec): [1B
        [0m[0mnull_resource.configure_nginx (remote-exec): [1A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Pulling fs layer
        null_resource.configure_nginx (remote-exec): [1B
        [0m[0mnull_resource.configure_nginx (remote-exec): [1A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Pulling fs layer
        null_resource.configure_nginx (remote-exec): [1B
        [0m[0mnull_resource.configure_nginx (remote-exec): [1A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Pulling fs layer
        null_resource.configure_nginx (remote-exec): [1B
        [0m[0mnull_resource.configure_nginx (remote-exec): [1A[2K
        null_resource.configure_nginx (remote-exec): 2d32d753400a: Pulling fs layer
        null_resource.configure_nginx (remote-exec): [1B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Waiting
        null_resource.configure_nginx (remote-exec): [2B[1A[2K
        null_resource.configure_nginx (remote-exec): 2d32d753400a: Waiting
        null_resource.configure_nginx (remote-exec): [1B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  534.5kB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  5.391MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Downloading  258.4kB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  529.5kB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  9.708MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Downloading  2.347MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  2.688MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  12.95MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Downloading  6.786MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  5.926MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Downloading  11.49MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading   15.1MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  10.78MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Downloading  16.45MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  17.26MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading   15.1MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Downloading  21.67MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading   20.5MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  18.88MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Verifying Checksum
        null_resource.configure_nginx (remote-exec): [4B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Download complete
        null_resource.configure_nginx (remote-exec): [4B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  24.81MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading   20.5MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  538.2kB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  28.59MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  22.12MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  5.935MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  31.83MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  24.82MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  11.33MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  33.99MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  28.06MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  16.19MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  36.15MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  19.97MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  30.75MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading   38.3MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  24.82MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  33.45MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading     41MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  29.68MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  36.69MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading   43.7MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  34.54MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  39.93MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  45.86MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  39.39MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  43.17MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  48.02MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  44.25MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading   46.4MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Downloading  49.11MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  50.18MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  49.64MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Verifying Checksum
        null_resource.configure_nginx (remote-exec): [2B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Download complete
        null_resource.configure_nginx (remote-exec): [2B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  52.34MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  52.88MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[1A[2K
        null_resource.configure_nginx (remote-exec): 2d32d753400a: Downloading     302B/302B
        null_resource.configure_nginx (remote-exec): [1B[1A[2K
        null_resource.configure_nginx (remote-exec): 2d32d753400a: Verifying Checksum
        null_resource.configure_nginx (remote-exec): [1B[1A[2K
        null_resource.configure_nginx (remote-exec): 2d32d753400a: Download complete
        null_resource.configure_nginx (remote-exec): [1B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  55.57MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  56.66MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  59.35MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  60.44MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  62.59MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  63.13MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  65.83MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  66.37MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  69.06MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  69.61MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  72.84MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  72.31MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  76.62MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Downloading  75.01MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Verifying Checksum
        null_resource.configure_nginx (remote-exec): [5B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Download complete
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading   80.4MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  557.1kB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  86.87MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  92.27MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  2.228MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  97.67MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  4.456MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  103.1MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  7.242MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading    109MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  10.03MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  114.4MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  12.26MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  120.3MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  13.37MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  126.3MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  14.48MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Downloading  131.1MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Verifying Checksum
        null_resource.configure_nginx (remote-exec): [3B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Download complete
        null_resource.configure_nginx (remote-exec): [3B[5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  17.27MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  18.94MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  21.17MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  24.51MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  28.41MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  32.87MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  36.77MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  41.78MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  45.68MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  50.14MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  52.36MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  54.03MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  55.15MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  57.93MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  60.16MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  62.39MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  65.73MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  67.96MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  69.63MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  71.86MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Extracting  75.18MB/75.18MB
        null_resource.configure_nginx (remote-exec): [5B
        [0m[0mnull_resource.configure_nginx (remote-exec): [5A[2K
        null_resource.configure_nginx (remote-exec): 7a0437f04f83: Pull complete
        null_resource.configure_nginx (remote-exec): [5B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Extracting  262.1kB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B
        [0m[0mnull_resource.configure_nginx (remote-exec): [4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Extracting  4.456MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B
        [0m[0mnull_resource.configure_nginx (remote-exec): [4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Extracting  13.37MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B
        [0m[0mnull_resource.configure_nginx (remote-exec): [4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Extracting  21.23MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B
        [0m[0mnull_resource.configure_nginx (remote-exec): [4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Extracting  24.12MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Extracting  25.48MB/25.48MB
        null_resource.configure_nginx (remote-exec): [4B[4A[2K
        null_resource.configure_nginx (remote-exec): 3bcaf639250b: Pull complete
        null_resource.configure_nginx (remote-exec): [4B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  557.1kB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  3.899MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  7.242MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  10.58MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  12.81MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  14.48MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  18.94MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  20.61MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  22.28MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  23.95MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[1mnull_resource.configure_nginx: Still creating... [5m20s elapsed][0m[0m
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  26.74MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  29.52MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  33.42MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  37.88MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  41.22MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  46.24MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  51.25MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  55.15MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  56.82MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  57.93MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  59.05MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  61.83MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  64.62MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  66.85MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  70.19MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  72.42MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  74.65MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  77.43MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  79.66MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting     83MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  86.34MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  88.01MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  88.57MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  89.69MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  91.36MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  101.4MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting    112MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  121.4MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  127.6MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  130.4MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  133.7MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B[3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Extracting  134.6MB/134.6MB
        null_resource.configure_nginx (remote-exec): [3B
        [0m[0mnull_resource.configure_nginx (remote-exec): [3A[2K
        null_resource.configure_nginx (remote-exec): 6481788b1e44: Pull complete
        null_resource.configure_nginx (remote-exec): [3B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  557.1kB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  4.456MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  6.685MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  10.03MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  12.81MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  16.15MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting   19.5MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  22.28MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting   23.4MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  34.54MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  45.68MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  49.58MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B
        [0m[0mnull_resource.configure_nginx (remote-exec): [2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  53.48MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Extracting  54.31MB/54.31MB
        null_resource.configure_nginx (remote-exec): [2B[2A[2K
        null_resource.configure_nginx (remote-exec): b1e561a9f1dc: Pull complete
        null_resource.configure_nginx (remote-exec): [2B[1A[2K
        null_resource.configure_nginx (remote-exec): 2d32d753400a: Extracting     302B/302B
        null_resource.configure_nginx (remote-exec): [1B[1A[2K
        null_resource.configure_nginx (remote-exec): 2d32d753400a: Extracting     302B/302B
        null_resource.configure_nginx (remote-exec): [1B[1A[2K
        null_resource.configure_nginx (remote-exec): 2d32d753400a: Pull complete
        null_resource.configure_nginx (remote-exec): [1BDigest: sha256:2c90c68c66007c56e6a0490f47ddf8bfa3b03a0b8413332ea156637466b5ab74
        [0m[0mnull_resource.configure_nginx (remote-exec): Status: Downloaded newer image for 8452/nginxweb:vara
        [0m[0mnull_resource.configure_nginx (remote-exec): docker.io/8452/nginxweb:vara
        [0m[1mnull_resource.configure_nginx: Still creating... [5m30s elapsed][0m[0m
        [0m[0mnull_resource.configure_nginx (remote-exec): 4e3afa390c6569dfae42214decdda7169bad206a38d2dda317c0f92817c546f9
        [0m[0m
        [0m[1mnull_resource.configure_nginx: Creation complete after 5m31s [id=5519074128793684650][0m[0m
        [33m
        [1m[33mWarning: [0m[0m[1mInterpolation-only expressions are deprecated[0m

        [0m  on ec2_instance.tf line 3, in provider "aws":
        3:   region = [4m"${var.AWS_REGION}"[0m
        [0m
        Terraform 0.11 and earlier required all non-constant expressions to be
        provided via interpolation syntax, but this pattern is now deprecated. To
        silence this warning, remove the "${ sequence from the start and the }"
        sequence from the end of this expression, leaving just the inner expression.

        Template interpolation syntax is still used to construct strings from
        expressions when the template includes multiple interpolation sequences or a
        mixture of literal strings and interpolations. This deprecation applies only
        to templates that consist entirely of a single interpolation sequence.

        (and 20 more similar warnings elsewhere)
        [0m[0m
        [33m
        [1m[33mWarning: [0m[0m[1mQuoted references are deprecated[0m

        [0m  on ec2_instance.tf line 114, in resource "aws_nat_gateway" "natGT":
        114:     depends_on = [[4m"aws_internet_gateway.myIGW"[0m]
        [0m
        In this context, references are expected literally rather than in quotes.
        Terraform 0.11 and earlier required quotes, but quoted references are now
        deprecated and will be removed in a future version of Terraform. Remove the
        quotes surrounding this reference to silence this warning.
        [0m[0m
        [0m[1m[32m
        Apply complete! Resources: 15 added, 0 changed, 0 destroyed.[0m
        + terraform show
        [0m# aws_eip.myNAT:
        resource "aws_eip" "myNAT" {
            [1m[0mdomain[0m[0m               = "vpc"
            [1m[0mid[0m[0m                   = "eipalloc-0d73c21ef0cc461d4"
            [1m[0mnetwork_border_group[0m[0m = "us-east-1"
            [1m[0mpublic_dns[0m[0m           = "ec2-54-204-229-235.compute-1.amazonaws.com"
            [1m[0mpublic_ip[0m[0m            = "54.204.229.235"
            [1m[0mpublic_ipv4_pool[0m[0m     = "amazon"
            [1m[0mtags[0m[0m                 = {
                "Name" = "myNAT"
            }
            [1m[0mvpc[0m[0m                  = true
        }

        # aws_instance.my-ec2-1:
        resource "aws_instance" "my-ec2-1" {
            [1m[0mami[0m[0m                          = "ami-0c2b8ca1dad447f8a"
            [1m[0marn[0m[0m                          = "arn:aws:ec2:us-east-1:463423328685:instance/i-0e1dc74880e49f18f"
            [1m[0massociate_public_ip_address[0m[0m  = true
            [1m[0mavailability_zone[0m[0m            = "us-east-1a"
            [1m[0mcpu_core_count[0m[0m               = 2
            [1m[0mcpu_threads_per_core[0m[0m         = 1
            [1m[0mdisable_api_termination[0m[0m      = false
            [1m[0mebs_optimized[0m[0m                = false
            [1m[0mget_password_data[0m[0m            = false
            [1m[0mhibernation[0m[0m                  = false
            [1m[0mid[0m[0m                           = "i-0e1dc74880e49f18f"
            [1m[0minstance_state[0m[0m               = "running"
            [1m[0minstance_type[0m[0m                = "t2.medium"
            [1m[0mipv6_address_count[0m[0m           = 0
            [1m[0mipv6_addresses[0m[0m               = []
            [1m[0mkey_name[0m[0m                     = "VARA-NOV"
            [1m[0mmonitoring[0m[0m                   = false
            [1m[0mprimary_network_interface_id[0m[0m = "eni-0e9f6d64f467bb154"
            [1m[0mprivate_dns[0m[0m                  = "ip-10-20-1-119.ec2.internal"
            [1m[0mprivate_ip[0m[0m                   = "10.20.1.119"
            [1m[0mpublic_dns[0m[0m                   = "ec2-34-205-50-170.compute-1.amazonaws.com"
            [1m[0mpublic_ip[0m[0m                    = "34.205.50.170"
            [1m[0msecondary_private_ips[0m[0m        = []
            [1m[0msecurity_groups[0m[0m              = []
            [1m[0msource_dest_check[0m[0m            = true
            [1m[0msubnet_id[0m[0m                    = "subnet-00ab5337dfc6aef4b"
            [1m[0mtags[0m[0m                         = {
                "Name" = "my-ec2-1"
            }
            [1m[0mtenancy[0m[0m                      = "default"
            [1m[0muser_data[0m[0m                    = "771763f471f5f61137291d90447958445cc116c5"
            [1m[0mvpc_security_group_ids[0m[0m       = [
                "sg-04d02b8bd1be94b24",
            ]

            credit_specification {
                [1m[0mcpu_credits[0m[0m = "standard"
            }

            enclave_options {
                [1m[0menabled[0m[0m = false
            }

            metadata_options {
                [1m[0mhttp_endpoint[0m[0m               = "enabled"
                [1m[0mhttp_put_response_hop_limit[0m[0m = 1
                [1m[0mhttp_tokens[0m[0m                 = "optional"
            }

            root_block_device {
                [1m[0mdelete_on_termination[0m[0m = true
                [1m[0mdevice_name[0m[0m           = "/dev/xvda"
                [1m[0mencrypted[0m[0m             = false
                [1m[0miops[0m[0m                  = 100
                [1m[0mthroughput[0m[0m            = 0
                [1m[0mvolume_id[0m[0m             = "vol-0c7f3f68106b45e15"
                [1m[0mvolume_size[0m[0m           = 30
                [1m[0mvolume_type[0m[0m           = "gp2"
            }
        }

        # aws_internet_gateway.myIGW:
        resource "aws_internet_gateway" "myIGW" {
            [1m[0marn[0m[0m      = "arn:aws:ec2:us-east-1:463423328685:internet-gateway/igw-044d5d8fa0eb9b736"
            [1m[0mid[0m[0m       = "igw-044d5d8fa0eb9b736"
            [1m[0mowner_id[0m[0m = "463423328685"
            [1m[0mtags[0m[0m     = {
                "Name" = "myIGW"
            }
            [1m[0mvpc_id[0m[0m   = "vpc-0f8b4df0a610ffebb"
        }

        # aws_nat_gateway.natGT:
        resource "aws_nat_gateway" "natGT" {
            [1m[0mallocation_id[0m[0m        = "eipalloc-0d73c21ef0cc461d4"
            [1m[0mid[0m[0m                   = "nat-053d3a1dba3f30b30"
            [1m[0mnetwork_interface_id[0m[0m = "eni-01028762ed5e34b14"
            [1m[0mprivate_ip[0m[0m           = "10.20.1.82"
            [1m[0mpublic_ip[0m[0m            = "54.204.229.235"
            [1m[0msubnet_id[0m[0m            = "subnet-00ab5337dfc6aef4b"
        }

        # aws_route.jenkins-route:
        resource "aws_route" "jenkins-route" {
            [1m[0mdestination_cidr_block[0m[0m    = "10.20.0.0/16"
            [1m[0mid[0m[0m                        = "r-rtb-098b917dbc5d4773f662290444"
            [1m[0morigin[0m[0m                    = "CreateRoute"
            [1m[0mroute_table_id[0m[0m            = "rtb-098b917dbc5d4773f"
            [1m[0mstate[0m[0m                     = "active"
            [1m[0mvpc_peering_connection_id[0m[0m = "pcx-0a795ce87c6a80d37"
        }

        # aws_route_table.myRT-NAT-private:
        resource "aws_route_table" "myRT-NAT-private" {
            [1m[0marn[0m[0m              = "arn:aws:ec2:us-east-1:463423328685:route-table/rtb-0cdc793607a52a72e"
            [1m[0mid[0m[0m               = "rtb-0cdc793607a52a72e"
            [1m[0mowner_id[0m[0m         = "463423328685"
            [1m[0mpropagating_vgws[0m[0m = []
            [1m[0mroute[0m[0m            = [
                {
                    carrier_gateway_id         = ""
                    cidr_block                 = "0.0.0.0/0"
                    destination_prefix_list_id = ""
                    egress_only_gateway_id     = ""
                    gateway_id                 = ""
                    instance_id                = ""
                    ipv6_cidr_block            = ""
                    local_gateway_id           = ""
                    nat_gateway_id             = "nat-053d3a1dba3f30b30"
                    network_interface_id       = ""
                    transit_gateway_id         = ""
                    vpc_endpoint_id            = ""
                    vpc_peering_connection_id  = ""
                },
            ]
            [1m[0mtags[0m[0m             = {
                "Name" = "myRT-NAT-private"
            }
            [1m[0mvpc_id[0m[0m           = "vpc-0f8b4df0a610ffebb"
        }

        # aws_route_table.myRT-public:
        resource "aws_route_table" "myRT-public" {
            [1m[0marn[0m[0m              = "arn:aws:ec2:us-east-1:463423328685:route-table/rtb-063cc3c94e59c17c4"
            [1m[0mid[0m[0m               = "rtb-063cc3c94e59c17c4"
            [1m[0mowner_id[0m[0m         = "463423328685"
            [1m[0mpropagating_vgws[0m[0m = []
            [1m[0mroute[0m[0m            = [
                {
                    carrier_gateway_id         = ""
                    cidr_block                 = "0.0.0.0/0"
                    destination_prefix_list_id = ""
                    egress_only_gateway_id     = ""
                    gateway_id                 = "igw-044d5d8fa0eb9b736"
                    instance_id                = ""
                    ipv6_cidr_block            = ""
                    local_gateway_id           = ""
                    nat_gateway_id             = ""
                    network_interface_id       = ""
                    transit_gateway_id         = ""
                    vpc_endpoint_id            = ""
                    vpc_peering_connection_id  = ""
                },
                {
                    carrier_gateway_id         = ""
                    cidr_block                 = "10.0.0.0/16"
                    destination_prefix_list_id = ""
                    egress_only_gateway_id     = ""
                    gateway_id                 = "pcx-0a795ce87c6a80d37"
                    instance_id                = ""
                    ipv6_cidr_block            = ""
                    local_gateway_id           = ""
                    nat_gateway_id             = ""
                    network_interface_id       = ""
                    transit_gateway_id         = ""
                    vpc_endpoint_id            = ""
                    vpc_peering_connection_id  = ""
                },
            ]
            [1m[0mtags[0m[0m             = {
                "Name" = "myRT-public-1"
            }
            [1m[0mvpc_id[0m[0m           = "vpc-0f8b4df0a610ffebb"
        }

        # aws_route_table_association.myRTA-private-1-a:
        resource "aws_route_table_association" "myRTA-private-1-a" {
            [1m[0mid[0m[0m             = "rtbassoc-0ba95c0a8173bc3c1"
            [1m[0mroute_table_id[0m[0m = "rtb-0cdc793607a52a72e"
            [1m[0msubnet_id[0m[0m      = "subnet-0ded6dbcc0b0ec47d"
        }

        # aws_route_table_association.myRTA-public-1-a:
        resource "aws_route_table_association" "myRTA-public-1-a" {
            [1m[0mid[0m[0m             = "rtbassoc-03ed63bdad09fc6f0"
            [1m[0mroute_table_id[0m[0m = "rtb-063cc3c94e59c17c4"
            [1m[0msubnet_id[0m[0m      = "subnet-00ab5337dfc6aef4b"
        }

        # aws_security_group.mySG:
        resource "aws_security_group" "mySG" {
            [1m[0marn[0m[0m                    = "arn:aws:ec2:us-east-1:463423328685:security-group/sg-04d02b8bd1be94b24"
            [1m[0mdescription[0m[0m            = "security group that allows ssh and all egress traffic"
            [1m[0megress[0m[0m                 = [
                {
                    cidr_blocks      = [
                        "0.0.0.0/0",
                    ]
                    description      = ""
                    from_port        = 0
                    ipv6_cidr_blocks = []
                    prefix_list_ids  = []
                    protocol         = "-1"
                    security_groups  = []
                    self             = false
                    to_port          = 0
                },
            ]
            [1m[0mid[0m[0m                     = "sg-04d02b8bd1be94b24"
            [1m[0mingress[0m[0m                = [
                {
                    cidr_blocks      = [
                        "10.0.0.0/16",
                    ]
                    description      = ""
                    from_port        = 0
                    ipv6_cidr_blocks = []
                    prefix_list_ids  = []
                    protocol         = "-1"
                    security_groups  = []
                    self             = false
                    to_port          = 0
                },
                {
                    cidr_blocks      = [
                        "10.0.0.0/16",
                    ]
                    description      = ""
                    from_port        = 22
                    ipv6_cidr_blocks = []
                    prefix_list_ids  = []
                    protocol         = "tcp"
                    security_groups  = []
                    self             = false
                    to_port          = 22
                },
                {
                    cidr_blocks      = [
                        "103.99.8.0/24",
                    ]
                    description      = ""
                    from_port        = 0
                    ipv6_cidr_blocks = []
                    prefix_list_ids  = []
                    protocol         = "-1"
                    security_groups  = []
                    self             = false
                    to_port          = 0
                },
            ]
            [1m[0mname[0m[0m                   = "mySG"
            [1m[0mowner_id[0m[0m               = "463423328685"
            [1m[0mrevoke_rules_on_delete[0m[0m = false
            [1m[0mtags[0m[0m                   = {
                "Name" = "mySG"
            }
            [1m[0mvpc_id[0m[0m                 = "vpc-0f8b4df0a610ffebb"
        }

        # aws_subnet.myVPC-private-1:
        resource "aws_subnet" "myVPC-private-1" {
            [1m[0marn[0m[0m                             = "arn:aws:ec2:us-east-1:463423328685:subnet/subnet-0ded6dbcc0b0ec47d"
            [1m[0massign_ipv6_address_on_creation[0m[0m = false
            [1m[0mavailability_zone[0m[0m               = "us-east-1a"
            [1m[0mavailability_zone_id[0m[0m            = "use1-az1"
            [1m[0mcidr_block[0m[0m                      = "10.20.4.0/24"
            [1m[0mid[0m[0m                              = "subnet-0ded6dbcc0b0ec47d"
            [1m[0mmap_customer_owned_ip_on_launch[0m[0m = false
            [1m[0mmap_public_ip_on_launch[0m[0m         = false
            [1m[0mowner_id[0m[0m                        = "463423328685"
            [1m[0mtags[0m[0m                            = {
                "Name" = "myVPC-private-1"
            }
            [1m[0mtags_all[0m[0m                        = {
                "Name" = "myVPC-private-1"
            }
            [1m[0mvpc_id[0m[0m                          = "vpc-0f8b4df0a610ffebb"
        }

        # aws_subnet.myVPC-public-1:
        resource "aws_subnet" "myVPC-public-1" {
            [1m[0marn[0m[0m                             = "arn:aws:ec2:us-east-1:463423328685:subnet/subnet-00ab5337dfc6aef4b"
            [1m[0massign_ipv6_address_on_creation[0m[0m = false
            [1m[0mavailability_zone[0m[0m               = "us-east-1a"
            [1m[0mavailability_zone_id[0m[0m            = "use1-az1"
            [1m[0mcidr_block[0m[0m                      = "10.20.1.0/24"
            [1m[0mid[0m[0m                              = "subnet-00ab5337dfc6aef4b"
            [1m[0mmap_customer_owned_ip_on_launch[0m[0m = false
            [1m[0mmap_public_ip_on_launch[0m[0m         = true
            [1m[0mowner_id[0m[0m                        = "463423328685"
            [1m[0mtags[0m[0m                            = {
                "Name" = "myVPC-public-1"
            }
            [1m[0mtags_all[0m[0m                        = {
                "Name" = "myVPC-public-1"
            }
            [1m[0mvpc_id[0m[0m                          = "vpc-0f8b4df0a610ffebb"
        }

        # aws_vpc.myVPC:
        resource "aws_vpc" "myVPC" {
            [1m[0marn[0m[0m                              = "arn:aws:ec2:us-east-1:463423328685:vpc/vpc-0f8b4df0a610ffebb"
            [1m[0massign_generated_ipv6_cidr_block[0m[0m = false
            [1m[0mcidr_block[0m[0m                       = "10.20.0.0/16"
            [1m[0mdefault_network_acl_id[0m[0m           = "acl-040c7a72f1dbb55f2"
            [1m[0mdefault_route_table_id[0m[0m           = "rtb-05150e8343e25a0ba"
            [1m[0mdefault_security_group_id[0m[0m        = "sg-0bc7af8279cce3ee5"
            [1m[0mdhcp_options_id[0m[0m                  = "dopt-ad73dfd7"
            [1m[0menable_classiclink[0m[0m               = false
            [1m[0menable_classiclink_dns_support[0m[0m   = false
            [1m[0menable_dns_hostnames[0m[0m             = true
            [1m[0menable_dns_support[0m[0m               = true
            [1m[0mid[0m[0m                               = "vpc-0f8b4df0a610ffebb"
            [1m[0minstance_tenancy[0m[0m                 = "default"
            [1m[0mmain_route_table_id[0m[0m              = "rtb-05150e8343e25a0ba"
            [1m[0mowner_id[0m[0m                         = "463423328685"
            [1m[0mtags[0m[0m                             = {
                "Name" = "myVPC"
            }
            [1m[0mtags_all[0m[0m                         = {
                "Name" = "myVPC"
            }
        }

        # aws_vpc_peering_connection.jenkins-nginx:
        resource "aws_vpc_peering_connection" "jenkins-nginx" {
            [1m[0maccept_status[0m[0m = "active"
            [1m[0mauto_accept[0m[0m   = true
            [1m[0mid[0m[0m            = "pcx-0a795ce87c6a80d37"
            [1m[0mpeer_owner_id[0m[0m = "463423328685"
            [1m[0mpeer_region[0m[0m   = "us-east-1"
            [1m[0mpeer_vpc_id[0m[0m   = "vpc-0f8b4df0a610ffebb"
            [1m[0mtags[0m[0m          = {
                "Name" = "jenkins-nginx"
            }
            [1m[0mvpc_id[0m[0m        = "vpc-0993ddca304a20577"

            accepter {
                [1m[0mallow_classic_link_to_remote_vpc[0m[0m = false
                [1m[0mallow_remote_vpc_dns_resolution[0m[0m  = true
                [1m[0mallow_vpc_to_remote_classic_link[0m[0m = false
            }

            requester {
                [1m[0mallow_classic_link_to_remote_vpc[0m[0m = false
                [1m[0mallow_remote_vpc_dns_resolution[0m[0m  = true
                [1m[0mallow_vpc_to_remote_classic_link[0m[0m = false
            }
        }

        # null_resource.configure_nginx:
        resource "null_resource" "configure_nginx" {
            [1m[0mid[0m[0m = "5519074128793684650"
        }[0m[0m
        [Pipeline] }

        [Pipeline] // ansiColor
        [Pipeline] }
        [Pipeline] // withCredentials
        [Pipeline] }
        [Pipeline] // node
        [Pipeline] }
        [Pipeline] // stage
        [Pipeline] End of Pipeline
        Finished: SUCCESS
  </p>
</details>


![image](https://user-images.githubusercontent.com/55577916/128600248-af297040-0857-4cae-b8f9-8a326e20bb31.png)
![image](https://user-images.githubusercontent.com/55577916/128600255-731b3d02-cce2-41ad-8b99-28a2b78e2a5f.png)
![image](https://user-images.githubusercontent.com/55577916/128600281-e8169757-05ee-4a29-9a52-4a753d15ed3a.png)
![image](https://user-images.githubusercontent.com/55577916/128600295-19d48ca6-293e-40e1-9683-3785dd665c2e.png)
![image](https://user-images.githubusercontent.com/55577916/128600305-1a2ae251-efd0-4996-9eb3-7a733b0254e9.png)

