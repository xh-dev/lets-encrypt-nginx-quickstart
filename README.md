# lets-encrypt-nginx-quickstart
A set of docker based setup script for let's encrypt and nginx reverse proxy
![Certbot]([https://www.plantuml.com/plantuml/svg/ROvDKWCX48NtdA8hArru0HTMhEXIDpa1GZFJLGJAfeavlWCp53Xc0_tJxxtlc4Ipv8jNCra45wDynPiI4ezmGbuw0RFyvCXeGQ2KCeK9d8y_yF3sUNvKsaXaEBoUFjxXZ7n5Fe1EeBFCQzikmaJXLdUrQkCjfYxCMgkoesi9R9FjXwUNmVaP6Byp9bd8kRBXIDjT1fXU5gzAyjV6pDfx35ENRxprBQ9_JAEHP0xT0nnvRCeT-_rRYxlOaRY7Dtb3HrlbQTHtuJXjzEg8mUQB_mK0](https://www.plantuml.com/plantuml/svg/RP6nKiCm343tV8Mk4mpy00DNhZ32qYymZfBephKFMIxzV8HTfoBN9POb--bPsMTnBEKKXeL6X2ab-KgNGKW2mW5PTm9ULvh8Eq6Wd0l56QQGVk3XxVFuE3WlYM7tUlXuXoFo6Na7BeChihHjFn5dYfTQgr5FNzlKWc_ny5UZipPSCzSLdbuC-HaOlmjcKNEkRcXjRnGhiuRAQYR_CNvn8M2S4IOAXj6awrTlTZ6zcufMEq4It5nj0oaSD-mEsxxfxjaHDoRs9TQdZg7xu6W7OY2ceyskFs2FSIody0i0))

[link1](https://letsencrypt.org/getting-started/)

[link2](https://datatracker.ietf.org/doc/html/rfc8555)

# Prerequisite
* Docker with docker compose
* Web Server Already setup proper DNS record

# Steps
## 1. Clone project
Clone this project to the targeted web server. change directory to the project, add execution permission to all `sh` files
```shell
git clone https://github.com/xh-dev/lets-encrypt-nginx-quickstart.git
cd lets-encrypt-nginx-quickstart
chmod +x *.sh
```

## 2. Create a dummy `hello-world-app` for validate the result
```shell
docker run --rm -d -p 8080:8080 --name hello-world-app xethhung/hello-world-web

# validate the if it returns a helloworld message
curl http://localhost:8080

# stop `hello-world-app` by 
# docker stop hello-world-app
```

## 3. Request for certificate
```shell
./first-init.sh {the domain name for the web server} {a not used port for temporary route}
```

## 4. Access the web page through internet
```shell
# validate the if it returns a helloworld message
curl https://{the domain name for the web server}
```

# After that
Deploy your other application and use the nginx configuration to reverse proxy to your application instead of the `hello-world-app`.


