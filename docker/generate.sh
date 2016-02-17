#!/bin/sh

spiff m main.yml \
    network.yml \
    > docker.yml
if [ $? -gt 0 ] ; then
    echo "Spiff Merge failed.  view errors and fix them"
else
    echo "docker.yml generated.  Deploy using \"bosh deployment ./docker.yml\"\n then \"bosh -n deploy\""
    echo "There is currently an issue where ((meta.networks.controller_ip)) is not expanding in the resulting docker.yml\
        so that will need to be done manually for now"
fi

