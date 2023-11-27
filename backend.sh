log_file=/temp/expense.log
color="\e[36m"

echo -e "${color} diable  nodejs software \e[0m"
 dnf module disable nodejs -y &>>log_file
 if [ $? -eq 0 ]; then
   echo success
 else
   echo fail
 fi


echo -e "${color} enable  nodejs software \e[0m"
dnf module enable nodejs:18 -y &>>log_file
echo $?

echo -e "${color} install nodejs software \e[0m"
dnf install nodejs -y &>>log_file
echo $?


echo -e "${color} copy backend service file  \e[0m"
cp backend.service /etc/systemd/system/backend.service &>>log_file
echo $?

echo -e "${color} adding user to expense \e[0m"
useradd expense &>>log_file
echo $?

echo -e "${color}creating expense directory \e[0m"
mkdir /app &>>log_file
echo $?

echo -e "${color}backend file frontend download\e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>log_file
cd /app &>>log_file
unzip /tmp/backend.zip &>>log_file
echo $?

echo -e "${color}directory storage app \e[0m"
cd /app &>>log_file
echo $?

echo -e "${color}npm package install \e[0m"
npm install &>>log_file
echo $?

echo -e "${color}install mysql software \e[0m"
dnf install mysql -y &>>log_file
mysql -h <mysql-dev.roshinitallam7.online> -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>log_file
echo $?

echo -e "${color}reload backend softwware\e[0m"
systemctl daemon-reload &>>log_file
echo $?

echo -e "${color}enable backend softwware\e[0m"
systemctl enable backend &>>log_file
echo $?

echo -e "${color}start backend softwware\e[0m"
systemctl start backend &>>log_file
echo $?



