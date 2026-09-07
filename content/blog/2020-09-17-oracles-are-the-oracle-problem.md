+++
title = "Oracles Are The Oracle Problem"
date = 2020-09-17 15:13:36+00:00
path = "/2020/09/17/oracles-are-the-oracle-problem/"

[taxonomies]
categories = [
    "Crypto",
]
+++

In computer science, an “[oracle](https://en.wikipedia.org/wiki/Oracle_machine)” is a source of truth from outside the system. On a blockchain, this means that oracles provide information that is not part of the transaction protocol. This can be the price of the US dollar, the weather in a particular location, whether a particular celebrity is still alive, or other facts that are not simply protocol-level transfers of coins secured by cryptographic signatures.

The introduction of truth that cannot be enforced at the protocol level or checked entirely by reference to the prior history of the blockchain means that oracles introduce a question of trust. Like the economic trusted third parties that Satoshi Nakamoto sought to exclude from the original Bitcoin protocol – who are better understood as *treacherous* third parties (to channel Richard Stallman’s critique of DRM for a moment) – oracles introduce trusted third parties for *knowledge*. Since demand for the information that oracles provide is ultimately economic, this amounts to the reintroduction of economic trusted third parties.

Various mechanisms can be used to address the risk of trust in oracles. Reputation on- or off-chain, or economic incentives enforced using different rewards and punishments, for individual providers or communities or markets providing information. Each scheme has its failure modes, and each ultimately requires trust in the behaviour of off-chain participants to act in an economically rational manner.

Oracles are unavoidable for a large class of problems but where they can be creatively avoided it is worth exploring alternatives. The use of token trade volumes and prices over time in DeFi applications to establish interest rates is a good example of this. Where on-chain facts cannot be tautologies, if they can be inferred from other on-chain facts this will be more robust than oracles if those facts cannot easily be manipulated. Ideally this means protocol-level facts, or at least facts with robust on-chain incentives for truthfulness.

Given this, “[the oracle problem](https://ethereum.stackexchange.com/questions/57071/what-is-the-oracle-problem-definition-exactly-and-briefly)” is not how best to implement trusted oracles. It is the *existence* of oracles. Let’s continue to find creative ways to extract off-chain information from on-chain truth.