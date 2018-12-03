#!/bin/sh

# start kube proxy
kubectl proxy &

certbot certonly --noninteractive --force-renewal --agree-tos --staging --standalone -d staging.ishankhare.com -m me@ishankhare.com

kubectl create secret tls cert --cert=/etc/letsencrypt/live/staging.ishankhare.com/fullchain.pem \
	--key=/etc/letsencrypt/live/staging.ishankhare.com/privkey.pem

# kill the kubectl process running in background
kill %1
