#! /bin/bash
user=gofigure;
password=gofigure;
database=gofiguredatabase;
file=EVL_0_40.mysql;

cd /home/GITROOT/PAPER/ManualEditingBackup;

/usr/bin/mysqldump -u $user -p$password --skip-extended-insert $database > $file;

/usr/bin/git commit -am "Updating DB backup";
