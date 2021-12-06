#!/bin/bash

#COMMAND="cargo run --release -- --miner ${MINER_ADDRESS} --trial --verbosity 2"
COMMAND="cargo run --release -- --miner aleo186nkjz9xsamz2pew9nc0z9cl57utaawdftvn0fe2fcfsxa3f85xq2xtrwp --trial --verbosity 1"

function exit_node()
{
    echo "Exiting..."
    kill $!
    exit
}

trap exit_node SIGINT

echo "Running miner node..."

while :
do
  echo "Checking for updates..."
  STATUS=$(git pull)

  echo "Running the node..."

  if [ "$STATUS" != "Already up to date." ]; then
    cargo clean
  fi
  $COMMAND & sleep 1800; kill $!

  sleep 2;
done
