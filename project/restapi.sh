#!/bin/bash

HTTP_200="HTTP/1.1 200 OK"
HTTP_404="HTTP/1.1 404 Not Found"
HTTP_400="HTTP/1.1 400 Bad Request"

read myvar # reads the std in

http_method=`echo $myvar | awk '{print $1}'` # Command substitution is the $() in lab 7
resource=`echo $myvar | awk '{print $2}' | cut -d '/' -f 3`
status=`echo $myvar | awk '{print $2}' | cut -d '/' -f 2`

if [[ $status == "status" ]]
then
count=`cat messages.dat | wc -l`
echo ""
echo -e "$HTTP_200\nConent-Type: application/json\n\n{\"record_count\":\"$count\"}"
exit 2
fi

sender=`cat messages.dat | grep -E ^5101 | sort -t',' -k 3 | head -n 1 |  cut -d ',' -f 1 | awk '{print $1}'`

#recipient=`echo $resource | cut -d '/' -f 2`

valid_user=`cat /etc/passwd | grep $resource`
uid=`echo $valid_user | cut -d ':' -f 3`
get_sender=`cat messages.dat | grep -E ^$uid | sort -t',' -k 3 |head -n 1 |  cut -d ',' -f 2 | uniq`
valid_sender=`cat /etc/passwd | grep $get_sender`
username=`echo $valid_sender | cut -d ':' -f 1`
special_invalid_chars=`echo $resource | grep -E [[:punct:]]+`
get_posters_id=`id -u`

recipient=`cat messages.dat | grep -E ^$uid | sort -t',' -k 3 |  cut -d ',' -f 1 | uniq`     # | awk '{print $1}'`
time_stamp=`cat messages.dat | grep -E ^$uid | sort -t',' -k 3 | head -n 1 | cut -d ',' -f 3 | uniq`
time=`date --rfc-3339=seconds -d @$time_stamp`
message=`cat messages.dat | grep -E ^$uid | sort -t',' -k 3 | head -n 1 | cut -d ',' -f 4 | uniq` #| sort -t'.' -k 3`    #| awk '{print $1}'`

echo '' # This is to fix the issue of not printing $1 as we discovered in class

if [[ $special_invalid_chars ]]
then
    echo $HTTP_400
    exit 1
fi
# I started the extra credit for post and got most of it except reading the message
#while [[ $valid_user ]]
#do
#if [[ $http_method == POST ]]
#then
    #echo ""
    #post_time_stamp=`date +%s`
    #echo -e "{\n    \"sender\":  \"$uid\",\n    \"message\": \"$message\",\n    \"timestamp\": \"$post_time_stamp\"\n}" 
    #echo -e "\n1,$get_posters_id,$post_time_stamp, message to write " >> messages.dat
#exit 1
#fi
#done

while [[ $http_method == GET ]]
do
if [[ $message == '' ]]
then
     echo -e "$HTTP_200\nContent-Type: application/json\n"
     echo "{}"
exit 2
fi
if [[ $valid_user ]]
then
    echo -e "{\n    \"sender\":  \"$username\",\n    \"message\": \"$message\",\n    \"timestamp\": \"$time\"\n}" 
elif [[ $valid_user != true ]]
then
    echo $HTTP_404
    exit 1
fi
exit 1
done

#id -u gduarte 6327   then echo $? to get the code for invalid user

