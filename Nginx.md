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
