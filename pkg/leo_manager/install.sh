#!/usr/bin/bash

USER=leofs
GROUP=$USER
COMPONENT=leo_manager
DIR=/opt/local/$COMPONENT

case $2 in
    PRE-INSTALL)
        if grep "^$GROUP:" /etc/group > /dev/null 2>&1
        then
            echo "Group already exists, skipping creation."
        else
            echo Creating $GROUP group ...
            groupadd $GROUP
        fi
        if id $USER > /dev/null 2>&1
        then
            echo "User already exists, skipping creation."
        else
            echo Creating $USER user ...
            useradd -g $GROUP -d /data/leofs -s /bin/false $USER
        fi
        echo Creating directories ...
        mkdir -p /data/leofs
        chown -R $USER:$GROUP /data/leofs
        mkdir -p /data/$COMPONENT/db/mnesia
        mkdir -p /data/$COMPONENT/db/work
        mkdir -p /data/$COMPONENT/db/snmp
        mkdir -p /data/$COMPONENT/etc
        mkdir -p /data/$COMPONENT/log/sasl
        chown -R $USER:$GROUP /data/$COMPONENT
        if [ -d /tmp/$COMPONENT ]
        then
            chown -R $USER:$GROUP /tmp/$COMPONENT/
        fi
        ;;
    POST-INSTALL)
        if svcs svc:/network/$COMPONENT:default > /dev/null 2>&1
        then
            echo Service already existings ...
        else
            echo Importing service ...
            svccfg import $DIR/share/$COMPONENT.xml
        fi
        echo Trying to guess configuration ...
        IP=`ifconfig net0 | grep inet | awk -e '{print $2}'`
        TARGET=/data/$COMPONENT/etc/leo_manager.conf
        if [ ! -f $TARGET ]
        then
            cp $DIR/etc/leo_manager.conf.example $TARGET
            sed --in-place -e "s/127.0.0.1/${IP}/g" $TARGET
        fi
        ;;
esac
