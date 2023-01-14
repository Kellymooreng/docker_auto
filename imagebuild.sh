#!/bin/bash
#script to automate docker image build
#Author: Engr Kelechi
#Maintainer: Kelechi
#Company: Etech Consulting LLC
today=`date`
user=`whoami`
dockeruser=kellymooreng
password=Etechdevops4
dockerrepo=autobuild_test1
versions=( 18.04 20.04 21.10 16.04 22.04 )
for i in ${versions[@]}; do
docker build -t $dockeruser/$dockerrepo:$i --build-arg versions=groovy .
docker login -u $dockeruser -p $password
docker push $dockeruser/$dockerrepo:$i
echo "$user is running a docker container with etechteam4/etecapp:$i on $today"
sleep 5
echo " Images have been uploaded to your dockerhub repository !! "
done
   