+++
title = "WART - Wrapped Art"
date = 2020-02-23 16:05:25+00:00
path = "/2020/02/23/wart-wrapped-art/"

[taxonomies]
categories = [
    "Aesthetics",
    "Art",
    "Crypto",
    "Ethereum",
]
+++

Wrapped Art (WART) applies the ideas behind Wrapped Kitties to rare art tokens, opening up new possibilities for investment and aesthetics.

The Wrapped Kitties Ethereum smart contract takes CryptoKitties ERC-721 non-fungible tokens (NFTs) and gives out its own ERC-20 fungible tokens (WCK) in return, “wrapping” the former in the latter. This makes it easy to buy and sell kitties in bulk, to use kitties in Decentralized Finance (DeFi) applications, or to trade low-valued kitties that one wishes to dispose of for others with more potential value by “unwrapping” the ERC-20 tokens back to (different) ERC-721 CryptoKitty tokens. WCK is credited with giving CryptoKitties a [50% price bump](https://btcmanager.com/wrappedkitties-trading-cryptokitty) in mid-2019.

Wrapping Rare Art ERC-721 NFTs with ERC-20 Wrapped Art WART tokens would allow the same use cases. It would be a way to get (financial) utility from (financially) under-performing art. Or a way of exploring new artists by swapping NFTs via the contract, either randomly or by seeing which other ERC-721 rare art tokens the contract currently has wrapped and redeeming WART for them accordingly.

The Wrapped Art smart contract should allow tokens from more than one Rare Art platform to be wrapped and unwrapped, both to allow the widest range of tokens to be used for liquidity purposes and to give access to the widest range of artists and works. On a technical level this might require the contract to be centralized in order to manage the list of platform contracts it accepts NFT tokens from, but on balance this is better than tying it to (one version of) one platform or a frozen list of contracts that will rapidly become outdated. To decentralize this while robustly incentivizing the curators to act in the best interests of WART we can instead curate the addition and removal of contracts using a Moloch DAO with WART itself as the membership tribute.

WART gives collectors who don’t have a background in fine art but [can follow price charts](https://beta.cent.co/+ln4bju) the ability to shake up their collections. This is both financially and art historically useful, allowing collectors to benefit from access to both financial and aesthetic liquidity as they build their collecting strategy. The blasphemy (for art historians) of art as a fungible asset class and the blasphemy (for financiers) of money as an insufficient sign of value resolve each other here. In doing so they create better signals than the positive feedback loops that would otherwise emerge when purchasing power drives artistic development under the efficient market hypothesis and nothing else.

It might appear that WART turns rare art into pure financial quantity, but in fact WART turns Rare Art into a pure *aesthetic* quantity. The monetary value of the art wrapped by the WART smart contract can be established by the trading price of WART but given what its tokens represent this means that hodling specific quantities of WART has an unavoidably aesthetic significance in addition to (and by virtue of) its financial one. Status games of hodling significant amounts of WART (in the sense both of large and evocative numbers) without unwrapping or using them for any further purpose might emerge in response to this fact. This fundamentally changes the concepts of collection, exhibition and value for art, coming down on the side of the price charts in terms of form but thereby opening that up to new aesthetic content.

Taking these ideas even further we can wrap the *content* of tokens. For example MATH tokens can be wrapped or burnt in return for the bits that represent their numbers as ERC-20 (or ERC-1155) tokens. We can’t break a CryptoKitty up into their genes (that would be cruel) but could we break up the image that a Rare Art token represents into its component colours? What cryptographic proof of the off-chain pixel values could be produced on-chain?

Or we can reverse this process and start by constructing NFT art from other tokens representing discrete aesthetic quantities. COLOR tokens start to do this with their wrapping of MATH tokens, but are monolithic and atomic rather than constructed from discrete elements. [Tokens Equal Text](/tokens-equal-text) is constructed from elements but each contains several words and the colours used are implicit. A more general and powerful NFT art construction system will require a different approach.
