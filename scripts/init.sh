#!/bin/bash

export CHANNEL_NAME=channela
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/digitalcatapult.org/orderers/orderer.digitalcatapult.org/msp/tlscacerts/tlsca.digitalcatapult.org-cert.pem

#create channel block
peer channel create -o orderer.digitalcatapult.org:7050 -c $CHANNEL_NAME -f ./channel-artifacts/$CHANNEL_NAME.tx --tls --cafile $ORDERER_CA

#join peers to channel
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/coffeeaudit.io/users/Admin@coffeeaudit.io/msp CORE_PEER_ADDRESS=peer0.coffeeaudit.io:7051 CORE_PEER_LOCALMSPID="coffeeauditMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/coffeeaudit.io/peers/peer0.coffeeaudit.io/tls/ca.crt peer channel join -b $CHANNEL_NAME.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/users/Admin@bobscoffee.co/msp CORE_PEER_ADDRESS=peer0.bobscoffee.co:7051 CORE_PEER_LOCALMSPID="bobscoffeeMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/peers/peer0.bobscoffee.co/tls/ca.crt peer channel join -b $CHANNEL_NAME.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/charliescoffee.co/users/Admin@charliescoffee.co/msp CORE_PEER_ADDRESS=peer0.charliescoffee.co:7051 CORE_PEER_LOCALMSPID="charliescoffeeMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/charliescoffee.co/peers/peer0.charliescoffee.co/tls/ca.crt peer channel join -b $CHANNEL_NAME.block

#try to update peer
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/coffeeaudit.io/users/Admin@coffeeaudit.io/msp CORE_PEER_ADDRESS=peer0.coffeeaudit.io:7051 CORE_PEER_LOCALMSPID="coffeeauditMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/coffeeaudit.io/peers/peer0.coffeeaudit.io/tls/ca.crt peer channel update -o orderer.digitalcatapult.org:7050 -c $CHANNEL_NAME -f ./channel-artifacts/coffeeauditMSPidentitiesanchors.tx --tls --cafile $ORDERER_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/users/Admin@bobscoffee.co/msp CORE_PEER_ADDRESS=peer0.bobscoffee.co:7051 CORE_PEER_LOCALMSPID="bobscoffeeMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/peers/peer0.bobscoffee.co/tls/ca.crt peer channel update -o orderer.digitalcatapult.org:7050 -c $CHANNEL_NAME -f ./channel-artifacts/bobscoffeeMSPidentitiesanchors.tx --tls --cafile $ORDERER_CA
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/charliescoffee.co/users/Admin@charliescoffee.co/msp CORE_PEER_ADDRESS=peer0.charliescoffee.co:7051 CORE_PEER_LOCALMSPID="charliescoffeeMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/charliescoffee.co/peers/peer0.charliescoffee.co/tls/ca.crt peer channel update -o orderer.digitalcatapult.org:7050 -c $CHANNEL_NAME -f ./channel-artifacts/charliescoffeeMSPidentitiesanchors.tx --tls --cafile $ORDERER_CA