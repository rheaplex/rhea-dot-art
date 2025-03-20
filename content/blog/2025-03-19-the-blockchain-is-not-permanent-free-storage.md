---
title: "The Blockchain is not Permanent Free Storage"
author: ["Rhea Myers"]
date: 2025-03-19
lastmod: 2025-03-19
draft: false
---

In the Bitcoin Whitepaper, Satoshi Nakamoto describes a timestamp server, not a storage network. That timestamp server exists only to establish the order of transactions within Bitcoin's system of electronic money. Nakamoto goes as far as to suggest that:

> Once the latest transaction in a coin is buried under enough blocks, the spent transactions before it can be discarded to save disk space.
> --- Reclaiming Disk Space, The Bitcoin Whitepaper, Satoshi Nakamoto.

Transactions designed to store data that are not transfers of Bitcoin were historically regarded as spam. Anyone using Bitcoin for its intended purpose is doing so to use a form of electronic money, and any given unit of that electronic money might eventually be sent to any individual who uses the network.

Spam defects from this, bloating the blockchain (and in Bitcoin's case, the live transaction set) with data that may never be useful to anyone other than the person who created it. This imposes a cost on other users without a proportionate benefit to them. Each spam transaction may be only a few bytes, but they add up over time and some are much larger.

"Blockchain" and "Distributed Ledger Technology" extract the surplus value of the affordances of Nakamoto's design. They vary the design parameters, emphasising one part of that design over others. NameCoin and other blockchains that were designed explicitly as data stores, including Ethereum, do so with wonderful creativity.

Bitcoin is an economic solution (proof-of-work mining) to a computer science problem (establishing temporal order in the absence of a central authority) of a political programme (cypherpunk crypto-anarchy). Cryptocurrency is not something bolted on to the blockchain - it is what secures it. Nakamoto does not mention "blockchain" in the Whitepaper, although he does cite the technology's originators.

What he spends some time on is establishing that an economically rational actor is better incentivised to build the Bitcoin blockchain honestly than to attack it:

> We consider the scenario of an attacker trying to generate an alternate chain faster than the honest
> chain. Even if this is accomplished, it does not throw the system open to arbitrary changes, such
> as creating value out of thin air or taking money that never belonged to the attacker.
> --- Calculations, ibid.

Cryptoeconomic incentives secure open blockchains. If they are unbalanced for any given class of actor in the system, this will dicincentivise them and reduce the security of that blockchain. And for a blockchain, security is existence.

The informal formula I use is that if it costs more for you to download a blockchain than the assets you hold on it are worth, it is not economically rational to do so. The more assets that aren't yours, and the heavier they are in terms of storage, the quicker this equation turns negative.

You might pay a(n untrusted) third party to provide storage and access, and this is a possibility that Nakamoto mentioned in his emails. But even this may not be worthwhile if the service fees over time outweigh the total value of your assets onchain.

This shows another failure mode for blockchain-as-storage. Services, platforms, and chains, can all fall out of favour, prove to be uneconomical or otherwise unviable, or be legislated against. Chain death, chain splits, chain attacks, and the whims of popularity can all reduce the security, the being, of a chain. Reduce it low enough and it will cease to exist.

Low transaction fees and low storage fees are understandably popular and much promoted features of new chains. They encourage adoption and use in the short term but if they are unrealistically low rather than reflecting improved efficiency they build up a debt that someone will have to pay once the party is over.

What should you store onchain? Enough to identify the existence, ownership, and value of something. This is an ID, an account reference, and at most a hash (for an individual token's metadata) or a Merkle tree root (for an entire asset's data). Every word of information you store after the first two should be accounted for as if the price of storage is shortly going to skyrocket.

Ethereum and other chains are working with rather than against this logic with "stateless" contracts that store only the Merkle tree root of a contract's state onchain. Everything else must be stored offchain by its users. This addresses the issue of spam by removing the very affordance that made it possible and desirable (for spammers) in the first place. If you can't store as much as you like onchain cheaply, there's no incentive to do so. But entire industries have been based on doing so, not least NFTs.

There is no scenario in which the Blockchain is permanent free storage.

When designing blockchain systems, keep as much information offchain _but anchored onchain_ as possible and regard doing so as a key design objective. When using blockchain systems, back up your keys, the block hashes you need to establish the validity of your transactions (this will include transactions sent by others before them that affect their environment), and any transactions you need in order to reconstitute your assets onchain.

If it is not cost effective to do this, you will need to change some things.

Facing this reality, which has been the case since the start, _increases_ the reach of blockchain proof. It ends offchain/onchain as an ontological split, and destroys onchainness as a fetish. Treating the blockchain as the root of assertion and commitment, neccessarily incomplete in itself but still unfalsifiable and stretching out rhizomatically in all directions, anchors reality against the political order that would destroy it.
