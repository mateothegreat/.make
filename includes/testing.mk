

### Try to curl http://$(HOST)
testing/curlhttp:	guard-HOST	; curl -vv http://$(HOST)

### Try to curl https://$(HOST)
testing/curlhttps:	guard-HOST	; curl -vv http://$(HOST)

### Retrieve external IP from api.ipify.org
testing/getip: 					; curl https://api.ipify.org