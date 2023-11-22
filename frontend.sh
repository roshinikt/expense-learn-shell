echo -e "\e[31 install ngnix software \e[0m"
dnf install nginx -y   &>>/temp/expense.file

echo -e "\e[31 configure ngnix software \e[0m"

cp expense.conf /etc/nginx/default.d/expense.conf &>>/temp/expense.file

echo -e "\e[31 remove old ngnix software \e[0m"

rm -rf /usr/share/nginx/html/* &>>/temp/expense.file

 echo -e "\e[31 download frontend application \e[0m"
curl -o /tmp/frontend.zip ht//expense-artifacts.s3.amazonaws.com/frontend.zip &>>/temp/expense.file

echo -e "\e[31 extract frontend application \e[0m"

cd  /usr/share/nginx/html &>>/temp/expense.file
unzip /tmp/frontend.zip &>>/temp/expense.file

echo -e "\e[31 extract start nginx software \e[0m"

systemctl enable nginx &>>/temp/expense.file
systemctl restart nginx &>>/temp/expense.file
