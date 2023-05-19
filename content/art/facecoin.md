---
title: "Facecoin"
image: "/images/facecoin-at-furtherfield.jpg"
type: "page"
layout: "artwork"
date: "2014-01-18"
---

![A proof-of-work block represented as a monochrome bitmap](/images/facecoin-cash.png)

***Facecoin Cash, 2020, HTML5 and JavaScript***

Facecoin Cash is a new higher-resolution, lower pixel bit-depth advancement on the original Facecoin.

Facecoin is one of my most popular projects. It's a good introduction to some of the technical and ideological ideas behind Bitcoin and other cryptocurrencies.

This new and improved version produces larger, more defined images with clearer "face" identification. It has the same block size though.

See it in action here:

https://show.rhea.art/facecoin/index.html

---

![Two grids of grey squares representing block header hashes, with red boxes outlining 'faces' within each](/images/facecoin-at-furtherfield.jpg)


**Facecoin, 2014, HTML5 and JavaScript**

Part of the Coins project.

Cryptocurrencies such as Bitcoin use a "proof of work" system to prevent abuse.

Artworks are proofs of aesthetic work.

Facecoin uses machine pareidolia as its proof of work. This is implemented by applying CCV's JavaScript face detection algorithm to SHA-256 digests represented as greyscale pixel maps. An industrial-strength version would use OpenCV. Due to the limitations of face detection as implemented by these libraries, the digest pixel map is upscaled and blurred to produce images of the size and kind that they can find faces in.

The difficulty can be varied by altering the size and blur of the pixmap. Or by only allowing particular detected face bounds rectangles to be used a set number of times.
