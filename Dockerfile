FROM certbot/certbot
COPY ./script.sh /script.sh
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.6.3/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin
ENTRYPOINT /script.sh
