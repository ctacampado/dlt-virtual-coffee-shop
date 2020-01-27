#!/bin/bash

#create channel-artifacts directory
mkdir channel-artifacts

#generate crypto-materials
cryptogen generate --config=./crypto-config.yaml
#generate genesis block
configtxgen -profile OrdererGenesis -outputBlock ./channel-artifacts/genesis.block

#create channels
export CHANNEL_NAME=channela && configtxgen -profile $CHANNEL_NAME -outputCreateChannelTx ./channel-artifacts/$CHANNEL_NAME.tx -channelID $CHANNEL_NAME

#set anchor peers
export CHANNEL_NAME=channela && configtxgen -profile $CHANNEL_NAME -outputAnchorPeersUpdate ./channel-artifacts/coffeeauditMSPidentitiesanchors.tx -channelID $CHANNEL_NAME -asOrg coffeeauditMSP
export CHANNEL_NAME=channela && configtxgen -profile $CHANNEL_NAME -outputAnchorPeersUpdate ./channel-artifacts/bobscoffeeMSPidentitiesanchors.tx -channelID $CHANNEL_NAME -asOrg bobscoffeeMSP
export CHANNEL_NAME=channela && configtxgen -profile $CHANNEL_NAME -outputAnchorPeersUpdate ./channel-artifacts/charliescoffeeMSPidentitiesanchors.tx -channelID $CHANNEL_NAME -asOrg charliescoffeeMSP
