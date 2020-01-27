#!/bin/bash
export CHANNEL_NAME=channela
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/digitalcatapult.org/orderers/orderer.digitalcatapult.org/msp/tlscacerts/tlsca.digitalcatapult.org-cert.pem
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/users/Admin@bobscoffee.co/msp
export CORE_PEER_ADDRESS=peer0.bobscoffee.co:7051
export CORE_PEER_LOCALMSPID="bobscoffeeMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bobscoffee.co/peers/peer0.bobscoffee.co/tls/ca.crt

echo "==================================================================="
echo "getProducts"
echo "==================================================================="
peer chaincode query -C channela -n coffeehubcc -c '{"Args":["getProducts"]}'
echo "==================================================================="
echo "getCharliesProducts"
echo "==================================================================="
peer chaincode query -C channela -n coffeehubcc -c '{"Args":["getCharliesProducts"]}'
echo "==================================================================="
echo "getBobsProducts"
echo "==================================================================="
peer chaincode query -C channela -n coffeehubcc -c '{"Args":["getBobsProducts"]}'
echo "==================================================================="
echo "getTotalSales"
echo "==================================================================="
peer chaincode query -C channela -n coffeehubcc -c '{"Args":["getTotalSales"]}'
echo "==================================================================="
echo "getBobsTotalSales"
echo "==================================================================="
peer chaincode query -C channela -n coffeehubcc -c '{"Args":["getBobsTotalSales"]}'
echo "==================================================================="
echo "getCharliesTotalSales"
echo "==================================================================="
peer chaincode query -C channela -n coffeehubcc -c '{"Args":["getCharliesTotalSales"]}'
echo "==================================================================="
echo "getOKOrders"
echo "==================================================================="
peer chaincode query -C channela -n coffeehubcc -c '{"Args":["getOKOrders"]}'
echo "==================================================================="
echo "getNOKOrders"
echo "==================================================================="
peer chaincode query -C channela -n coffeehubcc -c '{"Args":["getNOKOrders"]}'