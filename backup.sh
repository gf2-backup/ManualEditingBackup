#! /bin/bash
user=gofigure;
password=gofigure;
database=gofiguredatabase;
file=EVL_40_60.mysql;

cd /home/ajg23/GITROOT/PAPER/ManualEditingBackup;

/usr/bin/mysqldump -u $user -p$password --skip-extended-insert $database > $file;

/usr/bin/git commit -am "Updating DB backup";
