# Create certificates

```
git clone --branch tls-gen-18 https://github.com/michaelklishin/tls-gen.git
cd tls-gen/basic
make
for I in 1 2 3; do N="rabbit$I"; echo $N; make CN=$N gen-server; make CN=$N gen-client; done
```

The `*rabbit*.pem` files become your server and client certs.

# Build image for `rabbit1` host

```
git clone https://github.com/lukebakken/vesc-1027.git
docker build -t rabbitmq-tls .
```

# Run `rabbit1` image

```
docker run --hostname rabbit1 --name rabbit1 -p 15671:15671 -p 15672:15672 -p 25672:25672 rabbitmq-tls
```

# Customize image for other hosts

Edit the `Dockerfile` file, substituting `rabbit1` for other host names.
