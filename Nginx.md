# NGINX notes

## TLS
	TLS (Transport Layer Security)

## SSL
	SSL (Secure Sockets Layer)

# NOTE: How to config the domain name

	Just add an extra line for the ip 127.0.0.1, it'll work as an alias.

	sudo vim /etc/hosts


## Generated from Chat-gpt:

How They Work Together

    Handshake Process: When a client (like a web browser) connects to a server using SSL/TLS, they undergo a handshake process where they:
        Exchange Certificates: The server sends its certificate to the client.
        Verify Certificates: The client verifies the server’s certificate using the CA’s public key.
        Establish Keys: They use asymmetric encryption (public/private keys) to securely exchange a symmetric key for encrypting the rest of the session’s data.

    Session Encryption: Once the handshake is complete and a symmetric key is established, this key is used to encrypt and decrypt the data exchanged between the client and server, ensuring privacy and data integrity.


### Note: openssl req -> creates the certificate and the key

The following link has the documentation of the flags:
	https://docs.openssl.org/master/man1/openssl-req/
	https://linux.die.net/man/1/req

### Note: The order in nginx file matter

Nginx reads the files from top to bottom and directives that are first shown gets executed first.
This property matters for location.

### Note: Location strucuture

Link -> http://nginx.org/en/docs/http/ngx_http_core_module.html#location

The strucuture of a ```location``` block is:
	location [modifier] [URI] {
	    ...
	}


Here, [modifier] is optional and can change how NGINX processes the request, and [URI] specifies the pattern to match against the incoming request URI.

    Choose the Modifier: Depending on your needs, you may use one of several modifiers:
        =: Exact match.
        ~: Case-sensitive regular expression match.
        ~*: Case-insensitive regular expression match.
        ^~: Longest non-regex match.

	However, the concept of the "longest non-regex match" with the ^~ modifier is slightly nuanced. The ^~ modifier itself does not define a length; rather, it specifies a type of match (prefix) with priority over regex matches. The actual length of the match is determined by the longest prefix that matches the request URI among all locations defined with the ^~ modifier. If multiple locations with the ^~ modifier could potentially match the.

	Nginx uses specific order to determine which ```location``` block to execute based on their specifity. Thus ```location /images/``` doesn't get executed and ```location /images/photo.png``` gets executed given the uri /images/photo.png.


