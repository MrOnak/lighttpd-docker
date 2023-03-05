# certificates

## self-signed

If you're using the server only internally for testing / development, then
self-signed certificates are sufficient. The below command will generate
a self-signed cert and combine it with the private key in a single file:

```
openssl req -new -x509 -keyout example.com.pem -out example.com.pem -days 365 -nodes
```

If you want to split the cert and the key into two files:

```
openssl req -new -x509 -keyout example.com.key -out vh2.example.com.crt -days 365 -nodes
```

## Let's Encrypt

stay tuned

