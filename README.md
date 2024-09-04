# Inception
 This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine. 

# Note about the exec.:

Exec documentation:

	https://ss64.com/bash/exec.html

# Note about ssh

We can connect our host machine's vscode to a vm. --> Cool stuff
If have our vm in the bridge mode we can access it's port through  its ip address in the hostmachine.


# Note about CORS(Cross-Origin Resource Sharing)


**We can use this command to test an endpoint as in the browser, curl for CORS error.**
	curl -i -k -X OPTIONS https://yourdomain.com/your-endpoint

### Small explanation on how I solved my problem


I went to the website that explain how to settle CORS error in NGINX, copied the code, tested it.
Right after I went to the localhost, did not work, the reason on why it did not work was the browser will fail
the request if the domain we are requesting does not have a valid SSL certificate.
We went to the domain and accepted it, making that domain to be considered valid by the browser, thus 
making the CORS request work.


Let's begin here: https://developer.mozilla.org/pt-BR/docs/Web/HTTP/CORS

Let's learn about this


!!! AMAZING !!!
Solution for nginx situation: https://enable-cors.org/


### Why CORS request did not succeed?
https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors/CORSDidNotSucceed?utm_source=devtools&utm_medium=firefox-cors-errors&utm_campaign=default

I scrolled down the page about cors and clicked in the link that says enable cors in the backend.

## Simplest example:

Request from  https://foo.example
```
	GET /resources/public-data/ HTTP/1.1
	Host: bar.other
	User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
	Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
	Accept-Language: en-us,en;q=0.5
	Accept-Encoding: gzip,deflate
	Connection: keep-alive
	Origin: https://foo.example
```
It specifies the origin address of the request.

Response from https://bar.other
```
	GET /resources/public-data/ HTTP/1.1
	Host: bar.other
	User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
	Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
	Accept-Language: en-us,en;q=0.5
	Accept-Encoding: gzip,deflate
	Connection: keep-alive
	Origin: https://foo.example
```
The server answers with the specified accepted origins of request(which is all).

### Pre-flight request

We have the pre-flight request a.k.a(OPTIONS http method) that is used to check what are the allowed request to the server. We also specify the following request and what are the custom headers.


Pre-flight request:
```
	OPTIONS /doc HTTP/1.1
	Host: bar.other
	User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
	Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
	Accept-Language: en-us,en;q=0.5
	Accept-Encoding: gzip,deflate
	Connection: keep-alive
	Origin: https://foo.example
	Access-Control-Request-Method: POST
	Access-Control-Request-Headers: content-type,x-pingother

```


```
	Access-Control-Request-Method: POST
	Access-Control-Request-Headers: content-type,x-pingother
```

These are the header that used to specify the methods and the custom headers.

Response of the pre-flight request:
```
	HTTP/1.1 204 No Content
	Date: Mon, 01 Dec 2008 01:15:39 GMT
	Server: Apache/2
	Access-Control-Allow-Origin: https://foo.example
	Access-Control-Allow-Methods: POST, GET, OPTIONS
	Access-Control-Allow-Headers: X-PINGOTHER, Content-Type
	Access-Control-Max-Age: 86400
	Vary: Accept-Encoding, Origin
	Keep-Alive: timeout=2, max=100
	Connection: Keep-Alive
```


```
	Access-Control-Allow-Origin: https://foo.example
	Access-Control-Allow-Methods: POST, GET, OPTIONS
	Access-Control-Allow-Headers: X-PINGOTHER, Content-Type
	Access-Control-Max-Age: 86400
```

As we can see here it says the allowed origins, allowed methods, allowed headers, and the cache time in which those values will be valid in seconds 86400 (24h).


Once the preflight request is complete, the real request is sent:


Request:
```
POST /doc HTTP/1.1
Host: bar.other
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
X-PINGOTHER: pingpong
Content-Type: text/xml; charset=UTF-8
Referer: https://foo.example/examples/preflightInvocation.html
Content-Length: 55
Origin: https://foo.example
Pragma: no-cache
Cache-Control: no-cache

<person><name>Arun</name></person>
```

Response:
```
HTTP/1.1 200 OK
Date: Mon, 01 Dec 2008 01:15:40 GMT
Server: Apache/2
Access-Control-Allow-Origin: https://foo.example
Vary: Accept-Encoding, Origin
Content-Encoding: gzip
Content-Length: 235
Keep-Alive: timeout=2, max=99
Connection: Keep-Alive
Content-Type: text/plain

[Some XML content]
```




### Important note regarding the CORS error

We only the see the CORS error when in the ```localhost``` not in our actual domain ```asepulve.42.fr``` if we check the error when we  access it through localhost:

	Cross-Origin Request Blocked: The Same Origin Policy disallows reading the remote resource at https://asepulve.42.fr/wp-includes/blocks/navigation/view.min.js?ver=6.6.1. (Reason: CORS request did not succeed). Status code: (null).

It says that it is blocking because we can't access the resource asepulve.42.fr
and when we are in different domain browser triggers the CORS error.

