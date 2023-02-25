#!/bin/bash

 imgURL=$(curl -s https://api.thecatapi.com/v1/images/search | jq -r '.[].url')

 curl -s $imgURL > catImg
# sleep 1
 catimg catImg
 rm catImg
 
 echo 

 #moze byc jq -r (raw output)
 curl -s https://api.chucknorris.io/jokes/random | jq '.value'

 echo
