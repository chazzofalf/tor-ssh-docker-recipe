FROM chazzofalf/with-user-docker-recipe
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get install -yq ssh
RUN apt-get install -yq tor
ENV DEBIAN_FRONTEND=""
RUN mkdir /etc/docker-user-setup.d/.ssh
COPY secure_authorized_keys.sh /etc/docker-user-setup-scripts.d
COPY setup_ssh.sh /etc/docker-prelogin-foreground.d
COPY start_tor.sh /etc/docker-prelogin-foreground.d
RUN chmod +x /etc/docker-user-setup-scripts.d/secure_authorized_keys.sh
RUN chmod +x /etc/docker-prelogin-foreground.d/setup_ssh.sh
RUN chmod +x /etc/docker-prelogin-foreground.d/start_tor.sh
RUN echo HiddenServiceDir /hidsrv >> /etc/tor/torrc
RUN echo "    "HiddenServicePort 22 localhost:22 >> /etc/tor/torrc
RUN sed -i 's/ListenAddress \*/ListenAddress localhost/' /etc/ssh/sshd_config
RUN mkdir /hidsrv
RUN chown debian-tor /hidsrv
RUN chmod 700 /hidsrv
