# bitcoin-docker
Docker image for the bitcoin daemon

# usage

docker run \
  -e USER=user \
  -e PASSWORD=secret \
  -p 8332:8332 \
  -p 8333:8333 \
  -v "/blockchain:/data/" \
  gt675/bitcoind
