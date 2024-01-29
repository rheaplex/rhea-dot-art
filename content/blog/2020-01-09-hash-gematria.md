---
id: 3735
title: 'Hash Gematria'
date: '2020-01-09T11:59:08+00:00'
author: Rhea Myers
layout: post
mf2_syndication:
    - 'a:0:{}'
categories:
    - Crypto
    - Hyperstition
    - Philosophy
---

Gematria in Hebrew uses a SIGINT attack on God’s fully homomorphic encryption of the book of nature to extract meaning. A non-Hebrew gematria is a glimpse not back into the mind of God but forward through the fall of the tower of Babel into a scrambled linguistic world of contingency. It is a generator of Deleuzean “dark precursors” to connections between concepts, just as rhymes are. These connections are useful irritants, spurs to the generation of actual structure that would otherwise not occur, anchors for beliefs. Both kinds of gematria are exercises in exploiting the surplus value of code. The former is revelation, the latter is construction. Yet each resembles the other as much as is possible in their respective universes.

Interpreting letters as numbers recapitulates the history of mathematical notation. This is a defensible choice based on its maximal simplicity and its historical embedding. Cryptographic hashing lacks both this simplicity (for a human being to calculate the value of a word numerically takes seconds, for them to calculate a cryptographic hash by hand would [take around 15 minutes](https://www.righto.com/2014/09/mining-bitcoin-with-pencil-and-paper.html)) and this history (cryptographic hashes date back only to the 1970s).

It does however compress a history of ever increasing uniqueness and thereby security (in the senses of both secrecy and stability) of identity. It is part of the present moment of the history of technocapital/techonomics rather than a form of nostalgia for the past of accounting and its gentrified forms (or “mathematics”). As the number of cryptographic hashes calculated by the Bitcoin network alone approaches 120,000,000,000,000,000,000 per second at the start of 2020, the process of hashing reinforces its reality and its effects in the world through sheer volume of repetition.

Cryptographic hash collisions (where hashing two different pieces of data generate the same hash value identifier or “name”) are vanishingly unlikely by design. The evolution of cryptographic hashing algorithms has been the evolution of ever more effective ways of scattering bits into cryptographic space to destroy their significance while retaining their identity. But the 64-character hexadecimal (base-16) strings used to encode 256-bit hash values are difficult for human beings to read and compare, so software systems that use them pervasively such as “git” or “Docker” truncate them by displaying or reading just the first few characters (the “prefix”) in order to make them more readable.

These shorter values do collide as more and more hashes are used to refer to more and more things in the world (this is the “Birthday Problem”) and so longer prefixes have been used over time. It takes two hexadecimal characters to encode one eight-bit byte of data. The first byte of the hash value is 2 hexadecimal characters, the first two are four characters, the first four are eight characters etc. We can represent hash prefixes in more exotic bases: Proquint, BIP-49, Urbit @p, Base 56, Bech32 or even decimal. But these are not the hash values that are displayed pervasively within the culture of computing.

Non-cryptographic hashes will collide far more frequently but they are not embedded in the same way within that culture or in the culture of technocapital and its imaginaries of resistance (crypto-anarchy, cryptocurrency) as cryptographic hashing algorithms are. We therefore mean *cryptographic* hashes when we refer to hashes here.

Replacing letter-value summing and decimal reduction with cryptographic hash prefix collision generation gives us **hash gematria**. This is a hype-cycle peak-shift maximally historically contingent and embedded extractor of surplus value of code. This surplus value will itself be maximally historically contingent and embedded dark precursors. As a strategy this is inflected by the pop cultural strains of Chaos Magick but has far greater qualities of repetition and embeddedness and is more abstract and therefore more dynamic than a specific cultural expression.

If this seems unconvincing, what would a stronger candidate be?

What for?

To get the first four characters of a cryptographic hash of a piece of text using the Unix command line, enter something like the following:

`echo -n "egress" | sha256sum | cut -c -4`