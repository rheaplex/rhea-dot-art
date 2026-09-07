+++
title = "Proof of Work Bitmap"
date = 2019-07-20 09:00:51+00:00
path = "/2019/07/20/proof-of-work-bitmap/"

[taxonomies]
categories = [
    "Art",
    "Crypto",
    "Projects",
]

[extra]
mf2_syndication = [
    "a:0:{}",
]
+++

“Proof of Work Bitmap” (2019) shows a 16×16 pixel monochrome bitmap that lives on the Ethereum blockchain.

![](/images/2019/07/powb2-1024x576.png)

Clicking on that bitmap shows an editor.

![](/images/2019/07/powb3-1024x576.png)

Submitting any changes made using the editor starts a (simple) proof-of-work calculation.

![](/images/2019/07/powb4-1024x576.png)

When that calculation is complete the results can be sent along with the bitmap to update it on the blockchain. Doing so costs some “gas” Ether to pay Ethereum for the transactions.

You can see it (in an Ethereum-enabled browser) here:

[https://show.rhea.art/artworld-ethereum/dapps/proof-of-work-bitmap/app/](https://show.rhea.art/artworld-ethereum/dapps/proof-of-work-bitmap/app/index.html)

The source code for the series is here:

<https://github.com/rheaplex/artworld-ethereum/>

And the project page is here:

[/proof-of-work-bitmap](/proof-of-work-bitmap)

Proof of Work Bitmap is the latest in a series of pieces that pair aesthetic properties with methods of economic allocation or social governance. In computer art and digital culture a monochrome bitmap is the simplest representation of a discrete image. In blockchain-based systems a “proof of work” is a time-consuming computational puzzle that is impossible to cheat on but simple to check the result of. The result of solving that puzzle in Bitcoin, Ethereum, and Proof of Work Bitmap, is a 256-bit number with a specific number of zeros at the end. This is the same size as a 16×16 bitmap and as a memory cell in Ethereum. There’s a resonance here, as there is in each piece in the series.

On a technical basis this is the first piece in the series made with the Web3.js 1.0, Bulma CSS, and raw JavaScript DOM access rather than Truffle-Contract, Bootstrap and JQuery. It’s a much more lightweight approach, which is good for maintainability.

The next and final pieces in this series are “Hacked Line Properties”, “Staking Ratio”, and “Pay Previous Path”.