# datagov-bosh
Data.gov Docker Swarm on Bosh

####Setting up Bosh for Data.gov which will not live in Cloud.gov's CF Platform####
######IN BOSH DIRECTORY######

##### Install bosh-init: #####
*https://bosh.io/docs/install-bosh-init.html*

##### Install bosh-cli #####
*https://bosh.io/docs/bosh-cli.html*

#####Copy secrets.example.yml to secrets.yml#####
*cp secrets.example.yml  secrets.yml*

#####Edit secrets.yml with the Proper Values#####
*vim secrets.yml*

#####Generate bosh.yml#####
*generate.sh*

#####Create Bosh Server#####
*bosh-init deploy ./bosh.yml*

#####Login to Bosh Director#####
*bosh target http://ip address:port* 

#####Ensure Proper Communincation#####
*bosh info*


####Setting up Docker for Data.gov applications which will not live in Cloud.gov's CF Platform####
######IN DOCKER DIRECTORY######

#####Ensure proper bosh setup from bosh directory and bosh cli#####
*bosh target http://ip address:port*

#####Pull Docker-bosh Release#####
*https://github.com/cloudfoundry-community/docker-boshrelease*

- upload latest release as documented in the above link

#####Upload Bosh Stemcell#####
*bosh upload stemcell https://d26ekeud912fhb.cloudfront.net/bosh-stemcell/aws/light-bosh-stemcell-3197-aws-xen-hvm-ubuntu-trusty-go_agent.tgz*

#####Copy network-template.yml to network.yml#####
*cp network-template.yml  network.yml*

#####Edit network.yml with the Proper Values#####
*vim network.yml*
#####Generate bosh.yml#####
*generate.sh*

#####Select Deployment#####
*bosh deployment ./docker.yml*

#####Push Deployment#####
*bosh -n deploy*

