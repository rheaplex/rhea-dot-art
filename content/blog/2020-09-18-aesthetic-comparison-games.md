---
id: 3764
title: 'Aesthetic Comparison Games'
date: '2020-09-18T12:10:00+00:00'
author: Rhea Myers
layout: post
mf2_syndication:
    - 'a:0:{}'
categories:
    - Aesthetics
    - Crypto
---

Using ideas from design theory, provable computation, and calculus we can construct games of aesthetic comparison with arbitrary precision. These games can be represented in a form that allows them to be resolved using blockchain smart contracts via reference to materials submitted to set up the game, by reference to on-chain precedent, or as a last resort by appeal to a third party oracle.

## Game Setup

To construct the game, two parties must agree on two images, on the properties of the elements of those images under consideration, the relationship between them that is under consideration, and the degree of that relationship.

▲ = ▲ ?

The properties must be represented electronically and atomically, for example as RGB colours, as extremely small pixmaps, or as simplified bezier curves. The hashes of these values are then arranged as the leaves of a merkle tree for each image, in lexicographic value. A third three is then constructed by the first party of the hashes of tuples of pairs of leaves from each of the first two trees, the name of the relationships that is held to be true between them, a stated tolerance for deviation from simple mathematical equality in that relationship, and the weight of these properties as evidence in the aesthetic assertion being made accorded to that relationship (this must sum to 1.0 for all leaves). A threshold for property significance is declared (e.g. 0.001), this may be updated in later rounds of the game with mutual agreement or by appeal.

These trees are then combined with the root of two further trees – the precedent tree and the adjudicator address tree – to produce the merkle root of the game setup. It is vitally important that both parties agree on the representation of each image contained in the tree and on the tolerances and weights accorded to elements from them. It is trivial to make green into red with a high enough tolerance for colour difference, for example. Tools to automate preflight tests for game trees will be important.

For a multi-stage merkle tree acceptance phase, use rounds of committing/revealing proposed trees with increasing stakes. Accepting a tree returns the stakes. There may be a time or round limit for this phase, or no hard limits on agreement only exit rules.

Compulsory/voluntary comparison games may require different agreement, comparison and appeal phases to avoid griefing. Or a single well-understood workflow with well-understood and clearly described failure modes in each contect may be easier to reason about and therefore ultimately more reliable.

## Game Rounds

Once the game root has been registered, the comparison proceeds in rounds of assertions made with reference to the content of the subtrees that the root anchors.

If the comparison can be made automatically (e.g. #FF0000 == #FF0000), this proof can be offered onchain. An uncontested assertion of this form wins.

Example comparison relations and properties include: =, ≠, ≈, ≉, ⊂, ⊄, ⊃, ⊅, &lt;, &gt;, geometric affine transform, colour difference, freeform textual statement.

Beware of image content when comparing. Steganographic information may mislead automated comparison.

Where statements can be phrased equivalently, the one that would place the lowest value on the left branch should be used.

Unrealistic trees, e.g.

```
<pre style="border: none;">  ▲
 / \
◯   ▧
```

can be rejected by submitting a contradictory precedent or an appeal if evaluation is binding, can be replaced with a more accurate proposal in a multi-stage MAST acceptance opening phase for a comparison game, or simply not entered in to if an evaluation is not binding.

If comparisons can be reduced to precedents, cite them. This means that if a comparison has been resolved in a previously successfully completed comparison, submit the merkle path of that proof and the merkle path of the properties that it matches in the properties tree instead of starting an appeal. An uncontested assertion of this form wins.

If either party wishes to reject an assertion they can provide the merkle path to a contradictory assertion.

## Appeals

If the content of the game tree root is exhausted by assertions without a simple winner emerging, either player may attempt to establish a new prededent by assembling a pair of merkle paths from the property trees of the attacker and the defender, staking a pre-agreed amount of value that will be forfeited if they lose the appeal, and sending the appeal to a third party tribunal implemented using prediction markets, an ombudsman oracle DAO, or some other means.

The outcome of the appeal becomes available as a precedent for future games.

## Game Outcome

Ultimately a winner will emerge, in which case they can exercise the right granted to them by a pre-game commitment to update a DAO’s state or receive an amount of cryptocurency or some other action that a proof of resolution can enable. Or both parties can co-operate to declare a winner or a draw before that, either returning any stakes, burning any commitments, or co-operating to exercise the commitment that the winner would have been able to exploit.