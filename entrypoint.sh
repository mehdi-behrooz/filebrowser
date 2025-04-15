#!/bin/sh

ensure_env_var() {
    if [ -z "$1" ]; then
        echo "Missing requried env variable: $2"
        exit 1
    fi
}


ensure_env_var "$USERNAME" "USERNAME"
ensure_env_var "$PASSWORD" "PASSWORD"

exec 1>/dev/null

/filebrowser config init

/filebrowser users add $USERNAME $PASSWORD --perm.admin

if [ -n "$RECAPTCHA_KEY" ] && [ -n "$RECAPTCHA_SECRET" ]; then

    /filebrowser config set --auth.method=json \
        --recaptcha.key $RECAPTCHA_KEY \
        --recaptcha.secret $RECAPTCHA_SECRET

fi

exec 1>/proc/1/fd/1

/filebrowser config cat

/filebrowser
