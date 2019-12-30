# coturn-docker
Dockerized coTurn service configured to work for Nextcloud

(https://help.nextcloud.com/t/howto-setup-nextcloud-talk-with-turn-server/30794)

create a secret:
openssl rand -hex 32

| Variable | Default | Description |
| -------- | ------- | ----------- |
| REALM | stun.mydomain.tld | your domain/host name |
| SECRET | $(openssl rand -hex 32) | a secret key to use with Nextcloud Talk |

### Running (image is not yet built as of 30 dec 2019)
`docker run -d --name coturn -e SECRET=AsuperSecretKey999 -e REALM=stun.yourdomain.tld -p 3478:3478/udp -p 3478:3478/tcp neomediatech/coturn`
