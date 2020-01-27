#!/bin/bash
export CHANNEL_NAME=channela
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/digitalcatapult.org/orderers/orderer.digitalcatapult.org/msp/tlscacerts/tlsca.digitalcatapult.org-cert.pem
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/charliescoffee.co/users/Admin@charliescoffee.co/msp
export CORE_PEER_ADDRESS=peer0.charliescoffee.co:7051
export ORDERER_ADDRESS=orderer.digitalcatapult.org:7050
export CORE_PEER_LOCALMSPID="charliescoffeeMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/charliescoffee.co/peers/peer0.charliescoffee.co/tls/ca.crt
export OTHER_PEER_ADDRESS=peer0.coffeeaudit.io:7051
export OTHER_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/coffeeaudit.io/peers/peer0.coffeeaudit.io/tls/ca.crt

export PRODUCT=$(echo -n "{\"name\":\"Americano\",\"type\":\"Coffee\",\"price\":2.50}" | base64 | tr -d \\n)
peer chaincode invoke -o $ORDERER_ADDRESS -C channela -n coffeehubcc --peerAddresses $CORE_PEER_ADDRESS --peerAddresses $OTHER_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $OTHER_PEER_TLS_ROOTCERT_FILE -c '{"Args":["initProduct"]}' --transient "{\"product\":\"$PRODUCT\"}" --tls --cafile $ORDERER_CA

export PRODUCT=$(echo -n "{\"name\":\"Latte\",\"type\":\"Coffee,\",\"price\":2.50}" | base64 | tr -d \\n)
peer chaincode invoke -o $ORDERER_ADDRESS -C channela -n coffeehubcc --peerAddresses $CORE_PEER_ADDRESS --peerAddresses $OTHER_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $OTHER_PEER_TLS_ROOTCERT_FILE -c '{"Args":["initProduct"]}' --transient "{\"product\":\"$PRODUCT\"}" --tls --cafile $ORDERER_CA

#export PRODUCT=$(echo -n "{\"name\":\"Chai\",\"type\":\"Tea,\",\"price\":3.50}" | base64 | tr -d \\n)
#peer chaincode invoke -o $ORDERER_ADDRESS -C channela -n coffeehubcc --peerAddresses $CORE_PEER_ADDRESS --peerAddresses $OTHER_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $OTHER_PEER_TLS_ROOTCERT_FILE -c '{"Args":["initProduct"]}' --transient "{\"product\":\"$PRODUCT\"}" --tls --cafile $ORDERER_CA