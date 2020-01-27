#!/bin/bash

export CHANNEL_NAME=channela
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/digitalcatapult.org/orderers/orderer.digitalcatapult.org/msp/tlscacerts/tlsca.digitalcatapult.org-cert.pem

go get github.com/hyperledger/fabric-chaincode-go/shim
go get github.com/hyperledger/fabric-protos-go/peer

#install chaincode to peers
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/coffeeaudit.io/users/Admin@coffeeaudit.io/msp CORE_PEER_ADDRESS=peer0.coffeeaudit.io:7051 CORE_PEER_LOCALMSPID="coffeeauditMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/coffeeaudit.io/peers/peer0.coffeeaudit.io/tls/ca.crt peer chaincode install -n coffeehubcc -v 1.0 -p chaincode/coffeehubcc
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/users/Admin@bobscoffee.co/msp CORE_PEER_ADDRESS=peer0.bobscoffee.co:7051 CORE_PEER_LOCALMSPID="bobscoffeeMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/peers/peer0.bobscoffee.co/tls/ca.crt peer chaincode install -n coffeehubcc -v 1.0 -p chaincode/coffeehubcc
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/charliescoffee.co/users/Admin@charliescoffee.co/msp CORE_PEER_ADDRESS=peer0.charliescoffee.co:7051 CORE_PEER_LOCALMSPID="charliescoffeeMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/charliescoffee.co/peers/peer0.charliescoffee.co/tls/ca.crt peer chaincode install -n coffeehubcc -v 1.0 -p chaincode/coffeehubcc

#instantiate chaincode
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/users/Admin@bobscoffee.co/msp CORE_PEER_ADDRESS=peer0.bobscoffee.co:7051 CORE_PEER_LOCALMSPID="bobscoffeeMSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/peers/peer0.bobscoffee.co/tls/ca.crt peer chaincode instantiate -o orderer.digitalcatapult.org:7050 --tls --cafile $ORDERER_CA -n coffeehubcc -v 1.0 -C $CHANNEL_NAME -c '{"Args":[""]}' -P "OutOf (2, 'coffeeauditMSP.peer', 'bobscoffeeMSP.peer', 'charliescoffeeMSP.peer')" --collections-config /opt/gopath/src/chaincode/coffeehubcc/collections_config.json