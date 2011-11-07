#! /bin/bash
user=gofigure;
password=gofigure;
database=gofiguredatabase;
file=EVL_61_70.sql;

cd /home/nr52/gitroot/manualBU;

/usr/bin/mysqldump -u $user -p$password --skip-extended-insert $database > $file;

/usr/bin/git commit -am "Updating DB backup";
