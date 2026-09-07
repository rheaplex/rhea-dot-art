+++
title = "Intensive and Extensive Aesthetic Property Token Composition"
date = 2020-09-18 11:44:52+00:00
path = "/2020/09/18/intensive-and-extensive-aesthetic-property-token-composition/"

[taxonomies]
categories = [
    "Aesthetics",
    "Art",
    "Crypto",
]

[extra]
mf2_syndication = [
    "a:0:{}",
]
+++

ERC-721 tokens can be composed into tree structures using ERC-998 tokens. Where those ERC-721 tokens represent images or image elements, that tree structure becomes a rendering tree or two-dimensional scene graph (three-dimensional scene graphs will have to wait for 3D Rare Art standards to solidify). To lay out the elements of the image we must be able to transform them in various ways, changing their position, size, colour and other intensive and extensive aesthetic properties. We can represent these aesthetic properties as ERC-20 tokens with 18 digits of precision as they are continuous quantities.

To apply these properties to an ERC-721 token we can attach them using an ERC-998 composable tokens in an SVG-style tree hierarchy. Each ERC-998 token has one or more quantities of ERC-20 aesthetic property tokens attached, one or more child ERC-998 tokens, and zero or more (usually zero or one) ERC-721 tokens attached. The properties expressed by the ERC-20 tokens attached to each ERC-998 token are applied to any attached ERC-721 token(s) and transitively to the children of any attached ERC-998 tokens.

Where the values we wish to represent should be limited to a given range (e.g. 0.0 .. 1.0 or 0 .. 255), we can either assert if too many tokens are are sent to be attached to ERC-998 tokens (we might also be able to refund them in an additional transaction, but this would affect the gas required – and as per the ERC-20 standard we should not accept fewer tokens than are sent), we can treat higher values as meaning the maximum (e.g. 3.1 is 1.0, and 1337 is 255), or we can scale values relative to the largest quantity.

When the values must be both positive and negative (for example if we are representing co-ordinates around an origin, especially relative co-ordinates in a group hierarchy), we can use a second token to represent negative values (this would be better represented using ERC-1155 tokens but ERC-998 does not support this standard). If both positive and negative tokens are applied their values should be summed. For co-ordinates we can use only positive tokens by treating group origins as their top left rather than their centre and only adding positive offsets to child ERC-998 tokens.

Affine transformation ERC-20 tokens are applied as a transformation matrix to the children of the ERC-998 token they are attached to. This means that children-of-children multiply their parent matrix with their own. There is an implicit graphics state push/pop for each ERC-998 token, so transformations do not affect *sibling* tokens, only child ones.

For colour or alpha (transparency) values, these values are added to the colour values of the image represented by the token. This may not be the expected behaviour. As with co-ordinates, using only positive values can be achieved by carefully structuring the hierarchy of the image so that child ERC-998s only need to add rather than subtract colour values to represent their colour scheme. Alternatively we can treat colour tokens as scale, allowing both increases and decreases of colour to be expressed across the token hierarchy, and source primitive forms to be arbitrarily coloured if they are white. More complex colour interactions and other filter or layer behaviours could be specified by additional tokens.

This gives us the following ERC-20 tokens:

| **X** | x co-ordinate offset values in distance units.   Unbounded. |
|---|---|
| **Y** | y co-ordinate offset values in distance units.   Unbounded. |
| **WIDTH** | width in distance units.   Unbounded. |
| **HEIGHT** | height in distance units.   Unbounded. |
| **ROTATION** | rotation in degrees.   Unbounded, wraps around past 360 as usual. |
| **RED** | red scale.   Unbounded, although values that multiply the source value higher than 1.0 will have no additional effect. |
| **GREEN** | green scale.   Unbounded, although values that multiply the source value higher than 1.0 will have no additional effect. |
| **BLUE** | blue scale.   Unbounded, although values that multiply the source value higher than 1.0 will have no additional effect. |
| **ALPHA** | transparency scale.   Unbounded, although values that multiply the source value higher than 1.0 will have no additional effect. |

**What is to stop the owner of an artwork created in this way from breaking it up, re-arranging it, or adding to it?**

*Nothing at all…*

**Isn’t this an extremely expensive way of assembling art on-chain?**

*It depends on the value of the work that is made using it…*