log_file = /temp/expense.file

echo -e "\e[31 install ngnix software \e[0m"
dnf install nginx -y   &>>log_file
echo $?

echo -e "\e[31 configure ngnix software \e[0m"

cp expense.conf /etc/nginx/default.d/expense.conf &>>log_file

echo -e "\e[31 remove old ngnix software \e[0m"

rm -rf /usr/share/nginx/html/* &>>log_file

 echo -e "\e[31 download frontend application \e[0m"
curl -o /tmp/frontend.zip ht//expense-artifacts.s3.amazonaws.com/frontend.zip &>>log_file

echo -e "\e[31 extract frontend application \e[0m"

cd  /usr/share/nginx/html &>>log_file
unzip /tmp/frontend.zip &>>log_file

echo -e "\e[31 extract start nginx software \e[0m"

systemctl enable nginx &>>log_file
systemctl restart nginx &>>log_file
