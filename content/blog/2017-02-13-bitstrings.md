+++
title = "Bitstrings"
date = 2017-02-13 17:19:24-08:00
path = "/2017/02/13/bitstrings/"

[taxonomies]
categories = [
    "Crypto",
    "Philosophy",
]
+++

A "[bit](https://en.wikipedia.org/wiki/Bit)" is a basic unit of [information entropy](https://en.wikipedia.org/wiki/Entropy_(information_theory)). It's [binary](https://en.wikipedia.org/wiki/Binary_code), either on or off, present or absent, one or zero.

A "[string](https://en.wikipedia.org/wiki/String_(computer_science))" in computer programming is a sequence of items of a particular length. They may be fixed or variable length. Eight, sixteen, thirty-two and sixty-four bit numbers are fixed length. A text string is variable length.

A [byte](https://en.wikipedia.org/wiki/Byte) is a series of eight bits that's used as a standard representation for typographic characters, colour values and many other things. Up until IBM's OS/360 project in the late 1960s there was no real standard for this - computers might be decimal, or alphabetic, or have "words" of sizes from four to twenty-four bits. Some Soviet computers of the same period used [ternary logic](https://en.wikipedia.org/wiki/Ternary_computer) rather than binary. Alan Turing used a logarithmic measure of information entropy called a "[ban](https://en.wikipedia.org/wiki/Hartley_(unit))". So be wary of naturalising the bit and the eight-bit byte, but when you see bits grouped together in strings of lengths that divide neatly into eight, recognise that this is related to the reality of how most modern computer sytems divide up their memory.)

[Bitstrings](https://en.wikipedia.org/wiki/Bit_array) can be used to represent the presence or absence of properties. A fixed-length bitstring is a bitfield, but we're going to stick with the more general name. Integer numbers [represented in binary](https://en.wikipedia.org/wiki/Binary_number) use bits to represent the presence or absence of quantities of increasing sizes within the number. 0110 is six in a four bit "nibble". UNIX filesystems represent the [permissions](https://en.wikipedia.org/wiki/File_system_permissions#Traditional_Unix_permissions) that the owner and other users of a file have to access and manipulate it as a sequence of bits.

Such bitfields can be found throughout computing. The satirical proposal for an "[evil bit](https://www.ietf.org/rfc/rfc3514.txt)" to be set on Internet messages that have evil intent, shows both the prevalence of bitstrings and their users awareness of the limitations of binary thinking and computational representation.

As with their use to represent integer numbers using binary, bits can represent doubling or halving of quantities. It takes 33 bits of entropy to [uniquely identify an individual](https://www.gwern.net/Death%20Note%20Anonymity) among seven billion on Earth. [Cryptographic hashes](https://en.wikipedia.org/wiki/Cryptographic_hash_function), which produce compact unique "names" for any input file of any length, often output 128, 160 or 256 bit values. Each bit doubles the possible size, quantity, or uniqueness of the thing it represents. It also doubles the size of the space in which it can hide.

Contemporary [cryptographic encoding](https://en.wikipedia.org/wiki/Public-key_cryptography) and [signing systems](https://en.wikipedia.org/wiki/Digital_signature) use keys several thousand bits in length. They would take a conventional computer an infeasable amount of time to break. This property is used in Bitcoin mining to create [cryptographic puzzles](https://en.bitcoin.it/wiki/Proof_of_work) that require capital outlay to solve.

A proposal for "[vectored signatures](http://www.loper-os.org/?p=1545)" for the "V" version control system uses features of these different strings of bits. It represents assertions about an individual's relationship to and opinion of a piece of code using a bitstring. It asserts the identity of that individual using cryptographic signatures. This combination is a generalization of cryptographic "[keysigning](https://en.wikipedia.org/wiki/Keysigning)" as recognition of identity, and the fact that [Bitcoin transactions](https://en.bitcoin.it/wiki/Transaction) involve cryptographic signatures of communications between individuals about single-dimensional (monetary) quantities.

The [bitstring representation](http://www.logicalgeometry.org/bitstrings.htm) of logical operators developed by the [Logical Geometry project](http://www.logicalgeometry.org/) provides a compact and information-rich notation for various logics. Each bit represents a fact about an operator such as "true in all possible worlds", and relates to geometric and trellis representations of the same operators. [Bitwise operations](https://en.wikipedia.org/wiki/Bitwise_operation) on these representations are meaningful - for example bitwise NOT on *p* (1100) gives *¬p* (0011).

The combination of logically manipulable bitstring representations (as with Logical Geometry) asserted through cryptographic signatures (as with vectored signatures) seems like a possibly fruitful area of investigation.
