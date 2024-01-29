---
title: '"Is Art" On Homestead'
date: 2016-03-28 23:20:28.000000000 -07:00
type: post
layout: post
categories:
- Art
- Crypto
- Ethereum
- Projects
author: Rhea Myers
---
![is1](/images/2016/03/is1.png)

[Ethereum](https://ethereum.org/) has been live for several months now and has progressed to the point where the network has been declared stable.

So I'm deploying my contract artworks to the Ethereum blockchain. First up is "[Is Art](https://github.com/rheaplex/artworld-ethereum/tree/master/dapps/is-art)".

"Is Art" is an Ethereum contract that can be instructed to nominate itself as art (or not). Whoever toggles the contract's state as art sets it unimpeded until the next person sends a transaction to change it. A more rational system should be used - bidding, voting, a prediction market. The Duchampian aesthetic transubstantiation of artistic nomination is long played out. It is an art historical found object, as basic as a contract with a single bit of state. Brough together, the art historical and the contemporarily technological (or their audiences) can mutually animate and interrogate each other.

You can run the user interface locally in a web browser with an Ethereum node such as [geth](https://github.com/ethereum/go-ethereum/wiki/Building-Ethereum). Once geth is running, the user interface can get the contract's state from the blochchain and, if you have [Ether](https://ethereum.org/ether) for gas, modify it. If someone else changes the contract's state, you'll see this updated.

If you want to change the contract's status without using the user interface, you can do so using the contract's address and ABI in [EtherWallet](https://github.com/ethereum/mist/releases).

The address:

    0xa95301a50551dfe16e180dec3fe0044e94d36f8c

The ABI:

    [{"constant":true,"inputs":[],"name":"is\_art","outputs":[{"name":"","ty pe":"bytes6"}],"type":"function"},{"constant":false,"inputs":[],"name":"toggle", "outputs":[],"type":"function"},{"inputs":[],"type":"constructor"},{"anonymous": false,"inputs":[{"indexed":false,"name":"is\_art","type":"bytes6"}],"name":"Statu s","type":"event"}] For instructions on how to do this, see the "Contracts" pane in EtherWallet.
