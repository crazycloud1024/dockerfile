#!/bin/sh
m_user='test'
m_passwd='test'
m_port='3306'
m_host='127.0.0.1'
m_db='test'

lua_dir=/usr/share/sysbench
log=/tmp/mysql_oltp.log
normal_log=/tmp/normal.log

threds_num='8 48 64 96 160 256 360 480'
types='common read_only write_only read_write'

nm_test() {
    sysbench cpu run &>> $normal_log
    sysbench memory run &>> $normal_log
}

io_test() {
    sysbench fileio --file-test-mode=rndrw --file-total-size=10M \
                    --thread=100 --file-num=100 prepare
    sysbench fileio --file-test-mode=rndrw --file-total-size=10M \
                    --thread=100 --file-num=100 run
    sysbench fileio --file-test-mode=rndrw --file-total-size=10M \
                    --thread=100 --file-num=100 cleanup
}

sb_test() {
    
    rm -rf $log
    echo -e "\n---------------\n:type: $3\n---------------"
    for sb_threds in $threds_num;do
        for ty in $types;do
            action='run'
            printf "  %-10s %s\n" $sb_threds thread $ty mode_type
            if [ "$ty" == "common" ];then
                action="prepare"
            fi
            sysbench oltp_$ty --db-driver=mysql --mysql-db=test \
                              --mysql-user=$4 --mysql-password=$5 \
                              --mysql-port=$3 --mysql-host=$2 \
                              --threads=$sb_threds --events=10000 \
                              $action &>> $log
            echo "====================================" &>> $log 
            if [ $? -ne 0 ];then
                echo -e "\nSysbench error! For more information see $log"
                exit -1
            fi
            result=$(cat $log | egrep  "read:|write:|read/write.*:|total:|total\ time:|approx\..*95.*:" | sed -r -e "s/[0-9]+ \(//g" -e "s/\ per sec\.\)//g" -e "s/m?s$//g"| awk  '{printf("%s ",$NF)}' | sed "s/\ /,/g" | sed "s/,$//g")
 
            sleep 10 
        done
        sysbench oltp_common --db-driver=mysql --mysql-db=test \
                          --mysql-user=$4 --mysql-password=$5 \
                          --mysql-port=$3 --mysql-host=$2 \
                          --threads=$sb_threds --events=10000 \
                          cleanup &>> $log
        echo "====================================" &>> $log 
    done
}


if [ $# -eq 1 ] && [ $1 == "-h" -o $1 == "--help" ];then
    echo -e "\nUsage: $0 test (test_type) (mysql_host) (mysql_port) (mysql_user) (mysql_password)\n"
    echo ----------
    echo -e "test_mode_type"
    echo -e "sbtest: sysbench test for mysql"
    echo -e "nmtest: sysbench test cpu memory"
    echo -e "iotest: sysbench test fileio"
    echo -e "all: sysbench all"
    echo -e "----------"
    exit -1
elif [ "$1" == "sbtest" -a  $# -eq 5 ];then
    sb_test $1 $2 $3 $4 $5
elif [ "$1" == "nmtest" ];then
    nm_test
elif [ "$1" == "iotest" ];then
    io_test
elif [ "$1" == "all" -a  $# -eq 5 ];then
    nm_test
    io_test
    sb_test $1 $2 $3 $4 $5
else
    echo -e "\nUsage: $0 all (test_type) (mysql_host) (mysql_port) (mysql_user) (mysql_password)\n"
    echo -e "sh sysbench_test.sh all 191.168.56.100 3306 root '123456'\n"
fi
