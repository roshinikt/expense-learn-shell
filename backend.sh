backend_file=/temp/backend.log
color="\e[36m"

echo -e "${color} diable  nodejs software \e[0m"
 dnf module disable nodejs -y &>>backend_file
 if [ $? -eq 0]; then
   echo success
 else
   echo fail
 fi


echo -e "${color} enable  nodejs software \e[0m"
dnf module enable nodejs:18 -y &>>backend_file
echo $?

echo -e "${color} install nodejs software \e[0m"
dnf install nodejs -y &>>backend_file
echo $?


echo -e "${color} backend storage \e[0m"
cp backend.service /etc/systemd/system/backend.service &>>backend_file
echo $?

echo -e "${color} adding user to expense \e[0m"
if
useradd expense &>>backend_file
echo $?

echo -e "${color}creating expense directory \e[0m"
mkdir /app &>>backend_file
echo $?

echo -e "${color}backend file frontend download\e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>backend_file
cd /app &>>backend_file
unzip /tmp/backend.zip &>>backend_file
echo $?

echo -e "${color}directory storage app \e[0m"
cd /app &>>backend_file
echo $?

echo -e "${color}npm package install \e[0m"
npm install &>>backend_file
echo $?

echo -e "${color}install mysql software \e[0m"
dnf install mysql -y &>>backend_file
mysql -h <mysql-dev.roshinitallam7.online> -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>backend_file
echo $?

echo -e "${color}reload backend softwware\e[0m"
systemctl daemon-reload &>>backend_file
echo $?

echo -e "${color}enable backend softwware\e[0m"
systemctl enable backend &>>backend_file
echo $?

echo -e "${color}start backend softwware\e[0m"
systemctl start backend &>>backend_file
echo $?



