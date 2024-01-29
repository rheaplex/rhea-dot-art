---
title: '"Hot Cold" on Homestead'
date: 2016-04-19 21:29:34.000000000 -07:00
type: post
layout: post
categories:
- Art
- Crypto
- Ethereum
- Projects
author: Rhea Myers
---
![cold-hot-live](/images/2016/04/cold-hot-live.png)

Here's "[Hot Cold](https://github.com/rheaplex/artworld-ethereum/tree/master/dapps/hot-cold)" live on the Ethereum "Homestead" network.

"Hot Cold" calls back to Art & Language's 1960s Conceptual Art involving abstract aesthetic properties. It looks (and is implemented to be) twice as complex as "[Is Art](/2016/03/28/is-art-on-homestead/)", but it's still really only one bit of information.

You can run [the user interface](https://github.com/rheaplex/artworld-ethereum/tree/master/dapps/is-art) locally in a web browser with an Ethereum node such as [geth](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum). Once geth is running, the user interface can get the contract’s state from the blochchain and, if you have [Ether](https://ethereum.org/ether) for gas, modify it. If someone else changes the contract’s state, you’ll see this updated.

If you want to change the contract’s status without using the user interface, you can do so using the contract’s address and ABI in [EtherWallet](https://github.com/ethereum/mist/releases).

The address:

    0x53cd5d6bebff1eef892c191875e4d963875f50d7

The ABI:

    [{"constant":true,"inputs":[],"name":"cold","outputs":[{"name":"","type ":"bytes4"}],"type":"function"},{"constant":false,"inputs":[],"name":"swap","out puts":[],"type":"function"},{"constant":true,"inputs":[],"name":"hot","outputs": [{"name":"","type":"bytes4"}],"type":"function"},{"inputs":[],"type":"constructo r"},{"anonymous":false,"inputs":[{"indexed":false,"name":"hot","type":"bytes4"}, {"indexed":false,"name":"cold","type":"bytes4"}],"name":"Swap","type":"event"}] 
