sudo apt install -y wget vim openjdk-8-jdk openjdk-8-jre
sudo useradd --create-home jenkins
sudo usermod --shell /bin/bash jenkins
sudo su -jenkins
wget http://updates.jenkins-ci.org/latest/jenkins.war
exit
sudo cat <<EOT>>  /etc/systemd/system/jenkins.service
[Unit]
Description=Jenkins
[Service]
User=jenkins

WorkingDirectory=/home/jenkins
ExecStart=/usr/bin/java -jar /home/jenkins/jenkins.war

[Install]
WantedBy=multi-user.target
EOT
sudo systemctl daemon-reload
sudo systemctl start jenkins
 

