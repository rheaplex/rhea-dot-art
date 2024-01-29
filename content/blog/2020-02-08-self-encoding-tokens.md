---
id: 3765
title: 'Self-Encoding Tokens'
date: '2020-02-08T22:18:36+00:00'
author: Rhea Myers
layout: post
mf2_syndication:
    - 'a:0:{}'
categories:
    - Crypto
---

I just wanted to re-emphasize the idea of self-encoding tokens, Ethereum ERC-721 non-fungible tokens that contain their entire representation within the 256 bits of their numeric ID. I mentioned this in “[Tokens Equal Tokens](/2020/01/24/tokens-equal-tokens/)” and it’s an idea I’ve used in the last couple of years in both “[Tokens Equal Text](/tokens-equal-text)” and my story for Art Review.

As we add more (meta)data to a token outside its ID it becomes less self-contained and therefore less secure. That said, tokens with on-chain metadata or with content-addressable metadata links stored on-chain (for example an IPFS ERC-721 tokenURI() ) are still comparatively secure.

In contrast to the certain on-chain knowledge that we have of token IDs any meatspace identifier is much more breakable, whether in the sense of wearing out over time or the sense of being susceptible to copying and thereby to forgery. QR codes are trivial to copy. RFID/NFC tags usually have advertised working lives of around ten years and can be cut or otherwise damaged to stop them operating before that. Those tags without private cryptographic keys are trivial to copy, and even physically tamper-proof ones can be removed and affixed to a different object with enough care.

None of this is to say that blockchains can’t be used to for logistics tracking, just that doing so with physical identifiers for high value unique objects is difficult enough that it begins to require rather than represent an extra level of security.

As both the most secure and in many ways the most creatively challenging form of non-fungible token, self-encoding tokens should be the medium of the most valuable crypto art. That the market does not currently reflect this indicates that it is more interested in other properties of tokens, or that it has not yet recognized how self-encoding tokens can exemplify the value of true digital ownership of art.