echo -e "\e[31 diable  nodejs software \e[0m"
 dnf module disable nodejs -y


 echo -e "\e[31 enable  nodejs software \e[0m"
dnf module enable nodejs:18 -y

echo -e "\e[31 install nodejs software \e[0m"
dnf install nodejs -y


echo -e "\e[31 backend storage \e[0m"
cp backend.service /etc/systemd/system/backend.service
echo $?

echo -e "\e[31 adding user to expense \e[0m"
useradd expense
echo $?

echo -e "\e[creating expense directory \e[0m"
mkdir /app
echo $?

echo -e "\backend file frontend download\e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
echo $?
cd /app
unzip /tmp/backend.zip


cd /app
echo -e "\npm package install \e[0m"
npm install
echo $?

echo -e "\install mysql software \e[0m"
dnf install mysql -y
echo $?
mysql -h <mysql-dev.roshinitallam7.online> -uroot -pExpenseApp@1 < /app/schema/backend.sql


echo -e "\reload backend softwware\e[0m"

systemctl daemon-reload
echo $?
echo -e "\enable backend softwware\e[0m"
systemctl enable backend
echo $?
echo -e "\start backend softwware\e[0m"
systemctl start backend
echo $?



