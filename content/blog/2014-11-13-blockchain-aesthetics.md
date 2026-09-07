+++
title = "Blockchain Aesthetics"
date = 2014-11-13 03:08:47+00:00
path = "/2014/11/13/blockchain-aesthetics/"

[taxonomies]
categories = [
    "Aesthetics",
    "Art Computing",
    "Generative Art",
    "Projects",
]
+++

[![squares](/images/2014/11/squares.png)](https://show.rhea.art/blockchain-aesthetics/bitcoin-html5/transactions-squares.html)

These images are examples of real-time generative patterns visualising Bitcoin transactions. I wrote them in html5 using blockchain.info's WebSockets API to get notifications of the hash value of each new transaction. 

You can click on each image to open a new window actually running that visualization.

Above, each row is a transaction with each byte of 32-byte hash rendered as a square of colour from a 256-colour palette.

[![words](/images/2014/11/words.png)](https://show.rhea.art/blockchain-aesthetics/bitcoin-html5/transactions-words.html)

Above, each sentence is a transaction rendered in a standard list of words.

[![bitmaps](/images/2014/11/bitmaps.png)](https://show.rhea.art/blockchain-aesthetics/bitcoin-html5/transactions-bitmaps.html)

Above, each bitmap is the 32-byte hash for each transaction hash rendered as a 16x16 1-bit bitmap (original Macintosh-style, 1 is black).

[![transactions-spots](/images/2014/11/transactions-spots-1024x499.png)](https://show.rhea.art/blockchain-aesthetics/bitcoin-html5/transactions-spots.html)

Above, each row is a transaction with each byte of 32-byte hash rendered as a spot of colour from a 256-colour palette.

[![drawings](/images/2014/11/drawings.png)](https://show.rhea.art/blockchain-aesthetics/bitcoin-html5/transactions-drawings.html)

Above, each transaction is rendered as a drawing of lines connecting x,y co-ordinate pairs taken from the low and high 4 bits in each 8-bit byte in the 32-byte transaction hash. Each transaction is joined to the next as part of the same continuous drawing.

[![faces](/images/2014/11/faces.png)](https://show.rhea.art/blockchain-aesthetics/bitcoin-html5/transactions-faces.html)

Above, each bitmap is rendered as before and then blurred. A face recognition algorithm is used to find any collections of pixels that accidentally resemble faces, and these are outlined in red. This is machine pareidolia.

As well as clicking on the images to run each visualisation, you can view a list of them here (including both the block and transaction-based visualisations - the former run much slower):

[https://show.rhea.art/blockchain-aesthetics/bitcoin-html5/](https://show.rhea.art/blockchain-aesthetics/bitcoin-html5/)

You can get the code here:

[https://github.com/rheaplex/blockchain-aesthetics/](https://github.com/rheaplex/blockchain-aesthetics/)

[https://github.com/rheaplex/blockchain-aesthetics/](https://github.com/rheaplex/blockchain-aesthetics/)
