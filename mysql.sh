mysql_file=/temp/mysql.log
color="\e[36m"

echo -e "${color} disable mysql software \e[0m"
dnf module disable mysql -y &>>mysql_file
echo $?

echo -e "${color} copy to mysql repo \e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>mysql_file
echo $?

echo -e "${color} install mysql community server \e[0m"
dnf install mysql-community-server -y &>>mysql_file
echo $?

echo -e "${color} enable mysql \e[0m"
systemctl enable mysqld &>>mysql_file
systemctl start mysqld  &>>mysql_file
echo $?

echo -e "${color} mysql root expense project user \e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>mysql_file
echo $?
