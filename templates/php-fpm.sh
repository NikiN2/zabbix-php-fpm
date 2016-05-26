#!/bin/sh

if [ -z "$1" ];then
        cat <<EOF
___urror___

Kasutamine: skript.sh metric
EOF
        exit 1
fi

export SCRIPT_NAME=/php-fpm_status
export SCRIPT_FILENAME=/php-fpm_status
export QUERY_STRING=
export REQUEST_METHOD=GET
METRIC="$1"



## output metrics
case $METRIC in
        pool)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status"  | grep "^pool:"| cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        process_manager)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^process manager:"| cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        start_time)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^start time:"| sed 's|^start time:\s\+||'
                ;;
        start_since)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^start since:" | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        accepted_conn)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^accepted conn:" | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        listen_queue)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^listen queue:" | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        max_listen_queue)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^max listen queue:" | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        listen_queue_len)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^listen queue len:" | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        idle_processes)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^idle processes:" | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        active_processes)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^active processes:" | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        total_processes)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^total processes:" | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        max_active_processes)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^max active processes:"  | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        max_children_reached)
                /usr/bin/curl --max-time 20 --no-keepalive --silent "http://127.0.0.1:81/status" | grep "^max children reached:"  | cut -d ":" -f 2 | sed 's|^\s\+||'
                ;;
        *)
                echo "Unsupported metric $METRIC"
                exit 1
        ;;
esac

exit 0

