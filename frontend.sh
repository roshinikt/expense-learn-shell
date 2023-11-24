
echo -e "\e[36m install ngnix software \e[0m"
dnf install nginx -y &>>/temp/expense.log
echo $?


echo -e "\e[36m configure ngnix software \e[0m"

cp expense.conf /etc/nginx/default.d/expense.conf &>>/temp/expense.log

echo -e "\e[36m remove old ngnix software \e[0m"

rm -rf /usr/share/nginx/html/* &>>/temp/expense.log

echo -e "\e[36m download frontend application \e[0m"
curl -o /tmp/frontend.zip ht//expense-artifacts.s3.amazonaws.com/frontend.zip &>>/temp/expense.log

echo -e "\e[36m extract frontend application \e[0m"

cd  /usr/share/nginx/html &>>/temp/expense.log
unzip /tmp/frontend.zip &>>/temp/expense.log

echo -e "\e[36m  starting nginx software \e[0m"
systemctl enable nginx &>>/temp/expense.log
systemctl restart nginx &>>/temp/expense.log
