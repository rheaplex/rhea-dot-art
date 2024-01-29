---
title: Artworks And Curation On The Blockchain
date: 2016-01-21 20:48:31.000000000 -08:00
type: post
layout: post
categories:
- Art
- Crypto
author: Rhea Myers
---
Artworks and curation can both take place on or be represented on the blockchain.

Artworks can be stored directly as data on the Bitcoin blockchain or represented by various proxy schemes.

Curation of digital artworks for exhibition online or in the gallery can be organized and effected on the Bitcoin blockchain using these representations.

For both artworks and exhibitions this has the advantages of permanence, transparency, and of engagement with new technological means of organization.

## Storing Artworks On The Blockchain

Storing data on the blockchain has technological and social limits.

Technologically, storing more than a few kilobytes of data on the blockchain will be a slow process as many transactions will have to be sent over the course of several blocks to avoid the Bicoin blockchain's current one megabyte per block limit and to ensure that the transactions are stored in the correct order.

Socially, adding non-Bitcoin-transaction data to the blockchain leads to "blockchain bloat". This is where the Bitcoin blockchain, already over 40 gigabytes in size, grows more quickly than necessary to maintain the security of the Bitcoin currency.

See here for examples of various techniques: *[Hidden surprises in the Bitcoin blockchain and how they are stored](http://www.righto.com/2014/02/ascii-bernanke-wikileaks-photographs.html)*

### Unspendable Addresses

The original way of storing data on the Bitcoin blockchain was to send small amounts of Bitcoin to [addresses that do not represent valid public keys but instead represent 20 byes of arbitrary data](http://www.righto.com/2014/02/ascii-bernanke-wikileaks-photographs.html#ref4). This wastes the sent Bitcoin as there is no valid key that can be used to re-send it. The resulting transaction stores the data in the Bitcoin blockchain.

To send more than 32 bytes of data, the data must be encoded 32 bytes at a time and sent as multiple transactions.

### OP\_RETURN

The Bitcoin script opcode [OP\_RETURN](http://chimera.labs.oreilly.com/books/1234000001802/ch05.html#op_return) can be used to return 40 bytes of data from a Bitcoin transaction. This does not require that any Bitcoin be wasted, and does not require the Bitcoin software to keep track of the transaction in case its value is ever spent in future (it is still stored on the Blockchain).

To send more than 40 bytes of data, the data must be encoded 40 bytes at a time and sent as multiple transactions.

## Representing Artworks On The Blockchain

Storing identifiers for artworks on the blockchain provides a more efficient but in some cases less robust means of referring to objects via the Blockchain.

### ascribe.io

[ascribe.io](https://ascribe.io/) places records of ownership (and Creative Commons Licensing) of digital artworks on the Bitcoin blockchain. The artworks media files are stored by ascribe.io . Its [SPOOL](https://github.com/ascribe/spool) protocol can be used by third parties to identify and transfer ownership of artworks. Other services and technologies are available.

SPOOL supports a "Loan" operator for exhibition rights.

### URL

The URL of the artwork can be represented by one or more unspendable addresses or OP\_RETURN transactions.

### Work Hash

The cryptographic hash (e.g. sha256) of the artwork's digital media file, or of a written description or other means of identifying the work, can be placed on the blockchain as an unspendable address or OP\_RETURN transaction.

### Signature By Valid Address

The public key of a valid Bitcoin address (preferably a vanity address) can be used to create the cryptographic hash of an artwork's digital media file or other identifier. This hash can then be communicated via a transaction or by off-blockchain means.

### Authority Control

If the artist registers their works via traditional means, the full text or hash of the artwork's authority control identifier can be placed on the blockchain.

## Referring To Artworks On The Blockchain

### When The Artwork Is Stored On The Blockchain

When the artwork is stored in unspendable addresses or in OP\_RETURN values, either the first transaction in the series or the sending address (where that address is used only to send the transactions representing the artwork) can be used to refer to the artwork.

### When The Artwork Is Represented On The Blockchain

When the artwork is represented on the blockchain by an invalid Bitcoin address (for example one storing a URL or one representing the hash of the artwork's digital media file), this address can be used to refer to it.

When the artwork is represented by a valid Bitcoin address, this address or transactions (containing values) signed by it can be used to refer to the artwork.

### Crypto Tokens And Coloured Coins

Systems such as [Counterparty](http://counterparty.io/) and [Coloured Coins](http://coloredcoins.org/) add the ability to use Bitcoin's blockchain to store or represent tokens for assets other than the Bitcoin currency.

These tokens can be used to represent artworks, shares in artworks, involvement in a show or other grouping, and just about anything else.

Sending someone a token is functionally equivalent to signing their key in web-of-trust based cryptographic systems, although it does not have the same social significance.

To refer to an artwork with a token, send the token to the artwork's address. Where the artwork's address is not a valid Bitcoin address, this will make the token unrecoverable. Where the artwork's address is a valid Bitcoin address that the artist controls, they will be able to transfer the token to a third party if they wish.

## Curation

### Calls For Submissions

Calls for submissions can be broadcast on the blockchain either as [Counterparty broadcasts](http://counterparty.io/docs/broadcast/) or as urls, messages, or GitHub commit hashes placed on the blockchain using a system like [Cryptograffiti](http://www.cryptograffiti.info/).

### Acceptance And Rejection

Acceptance of the work can be represented via the transfer of Counterparty or Coloured Coin tokens.

Broadcasts via Counterparty or Cryptograffiti from the artwork's or (more likely) artist's valid Bitcoin address can .

### Loan And Exhibition

ascribe.io's SPOOL protocol supports Loan operations.

Broadcasts via Counterparty or Cryptograffiti from the artwork's or (more likely) artist's valid Bitcoin address can contain and confirm loan information.

Loan of artworks can be represented via the transfer of Counterparty or Coloured Coin tokens.

In particular, [Token Controlled Access](https://letstalkbitcoin.com/blog/post/tcv) can be used to restrict or enhance access to works using Counterparty or other tokens.

A similar, non token approach would be for net based artworks to use a Bitcoin address whitelist allowing exhibition machines (in the gallery) or proxies (for online shows) to display them if they can cryptographically sign their requests using the valid Bitcoin key used to accept and pay for the loan.

### Exhibition Fees

Exhibitor fees can be paid in Bitcoin to a valid Bitcoin address, either that of the artwork or, more likely, the address that created the storage or representation of the artwork on the blockchain

### Show Duration

The duration of the show can be expressed in terms of ranges of Bitcoin block numbers or UNIX timestamps.

## Webliography

[ascribe.io](https://ascribe.io/)

[Coloured Coins](http://coloredcoins.org/)

[Counterparty](http://counterparty.io/)

[Counterparty broadcasts](http://counterparty.io/docs/broadcast/)

[Cryptograffiti](http://www.cryptograffiti.info/)

[Hidden surprises in the Bitcoin blockchain and how they are stored](http://www.righto.com/2014/02/ascii-bernanke-wikileaks-photographs.html)

[OP\_RETURN](http://chimera.labs.oreilly.com/books/1234000001802/ch05.html#op_return)

[SPOOL](https://github.com/ascribe/spool)

[Token Controlled Access](https://letstalkbitcoin.com/blog/post/tcv)

[Unspendable Addresses](http://www.righto.com/2014/02/ascii-bernanke-wikileaks-photographs.html#ref4)
