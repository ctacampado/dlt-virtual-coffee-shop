#!/bin/bash
export CHANNEL_NAME=channela
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/digitalcatapult.org/orderers/orderer.digitalcatapult.org/msp/tlscacerts/tlsca.digitalcatapult.org-cert.pem
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/users/Admin@bobscoffee.co/msp
export CORE_PEER_ADDRESS=peer0.bobscoffee.co:7051
export CORE_PEER_LOCALMSPID="bobscoffeeMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/peers/peer0.bobscoffee.co/tls/ca.crt
export OTHER_PEER_ADDRESS=peer0.coffeeaudit.io:7051
export OTHER_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/coffeeaudit.io/peers/peer0.coffeeaudit.io/tls/ca.crt

export ORDER=$(echo -n "{\"ID\":\"12351\",\"Name\":\"Alice\",\"Vendor\":\"BobsCoffees\",\"Product\":{\"Name\":\"Americano\",\"Type\":\"Coffee\"},\"Qty\":1,\"Payment\":2.00}" | base64 | tr -d \\n)
peer chaincode invoke -C channela -n coffeehubcc --peerAddresses $CORE_PEER_ADDRESS --peerAddresses $OTHER_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE --tlsRootCertFiles $OTHER_PEER_TLS_ROOTCERT_FILE -c '{"Args":["processOrder"]}' --transient "{\"order\":\"$ORDER\"}" --tls --cafile $ORDERER_CA