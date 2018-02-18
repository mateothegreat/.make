

### Try to curl http & https from $(HOST)
testing/curl: testing/curlhttp testing/curlhttps

### Try to curl http://$(HOST)
testing/curlhttp:	guard-HOST	; @echo -n "TESTING http://$(HOST): "; if [ "$(shell curl -o -I -L -s -w "%{http_code}\n" https://$(HOST) -u user:pass)" = "200" ]; then echo OK; else echo ERROR; fi 

### Try to curl https://$(HOST)
testing/curlhttps:	guard-HOST	; @echo -n "TESTING https://$(HOST): "; if [ "$(shell curl -o -I -L -s -w "%{http_code}\n" https://$(HOST) -u user:pass)" = "200" ]; then echo OK; else echo ERROR; fi 

### Retrieve external IP from api.ipify.org
testing/getip: 					; curl https://api.ipify.org