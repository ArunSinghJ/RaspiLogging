#!/bin/bash
# LogScript
timeout 2s ./ExpHmax
#port setting
#led

                while :
                do
                sudo hexdump -v -e '1/1 "%02x\n"' /dev/ttyUSB0 | awk '$1=="ed" {
                getline byte1
                getline byte2
                number = strtonum("0x" substr(byte2,2,1))+2
                "date +%s%3N" |& getline timestamp;
                data = ":: "timestamp" ::ED." byte1"."byte2
                close("date +%s%3N")
                while(number-->0)
                {getline byte; data = data"."byte}
                print data"."
                }' |  tr '[a-z]' '[A-Z]'| grep -v '^.........................00' | tee -a NewLog.log
                done









