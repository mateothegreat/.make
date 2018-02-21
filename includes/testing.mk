
### Try to curl http & https from $(HOST)
testing-curl: testing/curlhttp testing/curlhttps

### Try to curl http://$(HOST)
testing/curlhttp:	guard-HOST	; @echo -n "${BLUE}Testing HTTP Response Code for${GREEN} http://$(HOST):${RESET} "; if [ "$(shell curl -o -I -L -s -w "%{http_code}\n" https://$(HOST) -u user:pass)" = "200" ]; then echo "${YELLOW}OK${RESET}"; else echo "${YELLOW}ERROR, non 200 reponse code${RESET}"; fi 

### Try to curl https://$(HOST)
testing/curlhttps:	guard-HOST	; @echo -n "${BLUE}Testing HTTP Response Code for${GREEN} https://$(HOST):${RESET} "; if [ "$(shell curl -o -I -L -s -w "%{http_code}\n" https://$(HOST) -u user:pass)" = "200" ]; then echo "${YELLOW}OK${RESET}"; else echo "${YELLOW}ERROR, non 200 reponse code${RESET}"; fi 

### Retrieve external IP from api.ipify.org
testing/getip: 					; curl https://api.ipify.org && echo