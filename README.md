# File Browser

## How to use

```yml
services:
  filebrowser:
    image: ghcr.io/mehdi-behrooz/filebrowser:latest
    container_name: filebrowser
    volumes:
      - /var/www/downloads:/srv/
    environment:
      - USERNAME=${MY_USERNAME}
      - PASSWORD=${MY_PASSWORD}
      - RECAPTCHA_KEY=${MY_GOOGLE_RECAPTCHA_2_KEY}          # optional
      - RECAPTCHA_SECRET=${MY_GOOGLE_RECAPTCHA_2_SECRET}    # optional
    ports:
      - 8080:8080

```

## Using recaptcha
To register a [reCAPTCHA v2](https://developers.google.com/recaptcha/docs/display),
visit [reCAPTCHA admin console](https://www.google.com/recaptcha/admin/).
