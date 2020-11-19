FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}
read line < ${FILE}
echo "Line Contains ${line}"

head -n3 /etc/passwd > ${FILE}
echo "Contents of file ${FILE}"
cat "${FILE}"

echo "${random}${random}" >> ${FILE}
echo "${random}${random}" >> ${FILE}
echo
echo "Contents of file ${FILE} :"
cat "${FILE}"

###################
###Recirect File as input in line
read line 0< ${FILE}
echo
echo "Line Contains ${LINE}"

#################
##Redirect output to a file using file descriptor
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contents of file is ${FILE}"
cat ${FILE}

##################
####STDERR to a FILE
ERR_FILE="/tmp/error_file"
head -n3 /etc/passwd /etc/dummyfile 2> ${ERR_FILE}

###########
###Redirecting both STDOUT and STDERR in one FILE
#head -n3 /etc/passwd /etc/dummyfile 1> output.txt 2>&1       #this is old method
head -n3 /etc/passwd /etc/dummyfile &> ${FILE}
echo "Content of file are ${FILE}"

##############
##Sending STDERR in another file and STDOUT in another FILE
head -n3 /etc/passwd /etc/dummyfile 1> output.txt 2> error.txt

#############
#Sending STDOUT and STDERR output to file using pipe
head -n3 /etc/passwd /dummyfile |& cat -n
#############
##Sending error to stderr FILE
echo "This is a error!!!" &>2
#now output this script stderr to a file
#ex../test.sh 2> error.out

########No Device   /dev/null
#sending all output of script in /dev/null
#this means we dont want to print anything on screen
head -n3 /etc/passwd /etc/dummyfile >& /dev/null

#discarding STDOUT
head -n /etc/passwd > /dev/null
#Discarding stderr
head -n /etc/passwd /dummyfile 2> /dev/null
#Discarding both
head -n /etc/passwd /dummyfile &> /dev/null
