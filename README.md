# tor-ssh-docker-recipe
Docker recipe to create a SSH server TOR hidden service.

Instructions on checking this out:
1. Find a desired location ($DOCKER_FILES)
2. Create a folder named chazzofalf in this desired location (${DOCKER_FILES}/chazzofalf
3. Check out the following github projects into this folder
  a. chazzofalf/docker-main
  b. chazzofalf/with-user-docker-recipe
  c. chazzofalf/ubuntu-base-docker-recipe
  d. chazzofalf/tor-ssh-docker-recipe (this one)
4. In all the projects make sure that any submodules are initialized and synchronized.
5. Build the docker image (./build.sh)
6. Create a folder named tor in this location (${DOCKER_FILES}/tor) (let it be known as $TOR_CONFIG_DIR_POINT)
7. Set a path in to container to represent this path ($TOR_CONFIG_DIR)
7. Pick your username ($XDOCKERUSER)
8. Pick a password (Securely retrieve and store it into ${XDOCKERPASSWD})
9. Start the container by using:
  docker run -itd --rm -v ${TOR_CONFIG_DIR_POINT}:/${TOR_CONFIG_DIR} -e TOR_CONFIG_DIR=${TOR_CONFIG_DIR} -e XDOCKERUSER=${XDOCKERUSER} -e XDOCKERPASSWD=${XDOCKERPASSWD} chazzofalf/tor-ssh-docker-recipe

