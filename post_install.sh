sudo yum install epel-release -y
sudo yum install python-pip -y
sudo pip install --upgrade pip
sudo pip install backports.ssl-match-hostname --upgrade
sudo yum install ansible -y
sudo yum install git -y

sudo yum install -y ca-certificates unzip 
sudo update-ca-trust force-enable
sudo cp /vagrant/company_cert.pem /etc/pki/ca-trust/source/anchors/
sudo update-ca-trust extract

# Install AWS CLI
sudo yum install awscli -y

# Install Nodejs
curl -sL https://rpm.nodesource.com/setup_10.x | bash -
sudo yum install nodejs -y
sudo yum install gcc-c++ make -y

# Install SAM-LOCAL
curl -OL https://github.com/awslabs/aws-sam-local/releases/download/v0.2.4/sam_0.2.4_linux_amd64.rpm
sudo rpm -ivh sam_0.2.4_linux_amd64.rpm
