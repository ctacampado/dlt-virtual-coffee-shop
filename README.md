# Coffee Hub
A network of coffee shops and other entities

## Technologies
- Hyperledger Fabric
- Docker & Docker Compose
- Go

## Prerequisites
- Hyperledger Fabric 1.4.4 (tool binaries and docker images)
- Fabric's Go version is 1.12.12 but I am currently using 1.13 in my dev machine
- github.com/hyperledger/fabric-chaincode-go/shim
- github.com/hyperledger/fabric-protos-go/peer

## Fabric Inrastructure
- 3 Orgs
- 1 peer per org
- 1 CA per org
- 1 CouchDB per org
- 1 CLI for 1 org
- Solo Orderer

## How to bring up the network
1. generate cryptographic materials using `generate_crypto.sh`
2. modify docker-compose.yaml to reflect **correct CA .pem and key file names for all CAs**
3. bring up the network using `up.sh`

## How to initialize data
1. go inside the cli using `cli.sh`
2. once inside the cli environment invoke `./script/init.sh`
3. install chaincode by invoking `./script/install.sh`
4. initialize data for bob's coffee by invoking `./script/datainitBob.sh` 
Note: you may initialize Charlie's as well if you want

## How to do a sample transaction
1. to make a successful order to bob's coffee, invoke `./script/invoke_order_bob.sh`
2. to make an unsuccessful order (underpayment), invoke `./script/invoke_order_bob_insufficient.sh`
Note: you may do the same for Charlie's by replacing `_bob` with `_charlie`

## How to query
1. invoke `./script/queryBob.sh` for querying Bob's data
Note: you may do the same for Charlie's by invoking `./scrip/queryCharlie.sh`


## Private Data Collection
In this setup, the following private data collection is in place:
```
[{
        "name": "BobsCoffeeCollection",
        "policy": "OR('coffeeauditMSP.member','bobscoffeeMSP.member')",
        "requiredPeerCount": 0,
        "maxPeerCount": 3,
        "blockToLive": 1000000
    },
    {
        "name": "CharliesCoffeeCollection",
        "policy": "OR('coffeeauditMSP.member','charliescoffeeMSP.member')",
        "requiredPeerCount": 0,
        "maxPeerCount": 3,
        "blockToLive": 1000000
    }
]
```
This means Charlie is unable to see Bob's data. If we want charlie to be able to see Bob's data, we have to include Charlie in Bob's Private Data policy:
```
[{
        "name": "BobsCoffeeCollection",
        "policy": "OR('coffeeauditMSP.member','bobscoffeeMSP.member','charliescoffeeMSP.member')",
        "requiredPeerCount": 0,
        "maxPeerCount": 3,
        "blockToLive": 1000000
    },
    {
        "name": "CharliesCoffeeCollection",
        "policy": "OR('coffeeauditMSP.member','charliescoffeeMSP.member')",
        "requiredPeerCount": 0,
        "maxPeerCount": 3,
        "blockToLive": 1000000
    }
]
```
For this to be reflected in the network, we have to update the chaincode.

## Upgrading the Chaindcode
1. we can upgrade the chaincode by invoking `./script/upgrade.sh`
2. If you want to upgrade again, just change the env variable VER inside `./script/upgrade.sh` by incrementing it:
```
export VER=1.1
```
to
```
export VER=1.2
```
