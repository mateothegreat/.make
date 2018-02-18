

### Try to curl http://$(HOST)
testing/curlhttp:	guard-HOST	; curl -vv http://$(HOST) -u user:pass

### Try to curl https://$(HOST)
testing/curlhttps:	guard-HOST	; curl -vv http://$(HOST) -u user:pass

### Retrieve external IP from api.ipify.org
testing/getip: 					; curl https://api.ipify.org