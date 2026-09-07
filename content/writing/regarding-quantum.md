+++
title = "Regarding Quantum"
date = 2022-02-17
path = "/regarding-quantum/"

[extra]
image = "/third-party-images/quantum.jpg"
+++

![Kevin McCoy's "Quantum"](/third-party-images/quantum.jpg)

Kevin McCoy's original "[Quantum](https://www.sothebys.com/en/buy/auction/2021/natively-digital-a-curated-nft-sale-2/quantum)" (2014), created on the NameCoin blockchain, is generally regarded as the first NFT. This essay concerns Quantum's relationship to the operation of the NameCoin blockchain from a technical viewpoint. We will consider the design documentation and source code of NameCoin included in its software repository, and then the content of the NameCoin transaction that registered Quantum.
  
Source Code and Operation
=========================

The version of the NameCoin source code that we will examine here is the version of January 2015, which is close enough to the era under discussion here -

https://github.com/namecoin/namecoin-legacy.git

NameCoin is the first altcoin, a code fork of the Bitcoin codebase that adds new types of transactions to allow the public registration of data associated with an identifier (or name) in order to act as a kind of blockchain Domain Name System.

A user sends a transaction that registers data associated with a name, and must then remember to send further transactions over time to ensure that they retain ownership of the name. Should they fail to do so, the name expires and anyone else can claim it.

Given the history of Quantum, it is that last part of the NameCoin name lifecycle that concerns us here. So what's in a name?

First we will examine the design documents included with NameCoin's source, and then we shall examine the C++ code that implements that design. We are looking for any documentation of how NameCoin is expected to work, and whether its souce code works as expected given that documentation.

In the sections of code quoted below, `[...]` indicates lines of code that have not been included for concision's sake.

DESIGN.md
---------

```
Key operations are performed by transactions with version 0x9900 - 0x99ff

* name_new(hash(rand, name), value)
* name_firstupdate(name, rand, value)
* name_update(name, value)

The last is a normal bitcoin-like transaction that does not affect the name.

[...]

A transaction can have a name operation associated with it. An operation can reserve (name_new), initialize (name_firstupdate) or update (name_update) a name/value pair.

```

NameCoin represents names and their associated data as key/value pairs that are reserved (`name_new`), initiazed (`name_firstupdate`), and updated (`name_update`).

    * a name expires 36000 blocks from the last operation

Crucially, names _expire_ 36000 blocks after the last transaction sent by their registrant. 36000 blocks, at an average of ten minutes per block, is around two hundred and fifty days.

    * a name_firstupdate must be on a name never seen or that has expired

At the design level, there is no difference between a name that has never been involved in a transaction and one that was previously registered but has since expired.

FAQ.h
-----

```
**Q: How are names represented?**

**A:** Names and values are attached to special coins with a value of 0.01 NC . Updates are performed by creating a transaction with the name's previous coin as input.

[...]

**Q: How do I transfer a name?**

**A:** This is not yet in the code, but you would basically do an update with a recipient's wallet address as the destination
```

NameCoin implements a representation of non-coin assets using transactions with a particular identifier and price, here referred to as 'special coins'. These are similar to the later 'colored coin' system that they inspired on Bitcoin, but with protocol-level support.

To update or transfer the name you must create a transaction with "the name's previous coin" (the relevant output of the previous transaction) as an input to the new transaction.

In order to successfully create such a transaction _you must be able to sign it with the private cryptographic key for the nameCoin address that received the relevant output of the previous transaction_. That is, you must own the special coin that represents the name.


src/namecoin.cpp
----------------

```
bool GetTxOfName(CNameDB& dbName, const vector<unsigned char> &vchName, CTransaction& tx)
{
    //vector<CDiskTxPos> vtxPos;
    vector<NameIndex> vtxPos;
    if (!dbName.ReadName(vchName, vtxPos) || vtxPos.empty())
        return false;
    //CDiskTxPos& txPos = vtxPos.back();
    CNameIndex& txPos = vtxPos.back();
    //int nHeight = GetTxPosHeight(txPos);
    int nHeight = txPos.nHeight;
    if (nHeight + GetExpirationDepth(pindexBest->nHeight) < pindexBest->nHeight)
    {
        string name = stringFromVch(vchName);
        printf("GetTxOfName(%s) : expired", name.c_str());
        return false;
    }

    if (!tx.ReadFromDisk(txPos.txPos))
        return error("GetTxOfName() : could not read tx from disk");
    return true;
}
```

This function is used in code that processes name operations in order to check whether a previous transaction controlling a name exists, and whether or not it has expired.

The design mentioned in the source code documentation is reflected here.

```
Value name_firstupdate(const Array& params, bool fHelp)
{
[...]
        if (GetTxOfName(dbName, vchName, tx))
[...]
```

Registration of names checks to see if an existing, unexpired, transaction exists that controls the name.

```
Value name_update(const Array& params, bool fHelp)
{
[...]
        if (!pwalletMain->mapWallet.count(wtxInHash))
        {
            error("name_update() : this coin is not in your wallet %s",
                    wtxInHash.GetHex().c_str());
            throw runtime_error("this coin is not in your wallet");
        }
```

Updating of names checks to see if we control the coin that we must spend in order to do so.

```
bool
CNamecoinHooks::ConnectInputs (DatabaseSet& dbset,
                               map<uint256, CTxIndex>& mapTestPool,
                               const CTransaction& tx,
                               vector<CTransaction>& vTxPrev,
                               vector<CTxIndex>& vTxindex,
                               CBlockIndex* pindexBlock, CDiskTxPos& txPos,
                               bool fBlock, bool fMiner)
{
[...]
```


Wewill not examine `CNamecoinHooks::ConnectInputs` here due to its length, but it performs similar checks to those we have already seen.

In addition to the checks examined above, remember that we must be able to spend the special coin that represents a name in order to use it in a transaction. If we attempt to spend a special coin that we cannot sign with the private key for its address then the transaction will fail.

From reading `namecoin.cpp` it is therefore clear that NameCoin's source code accurately reflects the design described in the documentation included with the version of its software repository under consideration here.

Quantum's Transactions
======================

Quantum was created (via `initial_update`) in transaction `fa8b9a6ad4d266ffbec4f9a1217e0dbcd657bb1eb3ed49912a2ab1bd3bb48f8d` which was contained in NameCoin block 174923 of at 18:27:34GMT on the second of May 2014:

[https://nmc.tokenview.com/en/tx/fa8b9a6ad4d266ffbec4f9a1217e0dbcd657bb1eb3ed49912a2ab1bd3bb48f8d](https://nmc.tokenview.com/en/tx/fa8b9a6ad4d266ffbec4f9a1217e0dbcd657bb1eb3ed49912a2ab1bd3bb48f8d)

The text of Quantum's value reads:

> I assert title to the file at the URL http://static.mccoyspace.com/gifs/quantum.gif with the creator's public announcement of it's publishing at the URL https://twitter.com/mccoyspace/status/462320426719641600 The file whose SHA256 hash is d41b8540cbacdf1467cdc5d17316dcb672c8b43235fa16cde98e79825b68709a is taken to be the file in question. Title transfers to whoever controls this blockchain entry.

The key term here is "blockchain entry". Not "name". Not "key". _"Blockchain entry"_. The blockchain entry is the transaction output encoding the special coin that represents Quantum, and that coin remains owned and spendable for as long as it is updated by its owner. Once it expires, it ceases to exist.

Quantum was not updated after its original creation. We can see this because the special coin output of transaction `fa8b9a6ad4d266ffbec4f9a1217e0dbcd657bb1eb3ed49912a2ab1bd3bb48f8d` to address `N2nunKeYiYeqDCunDzJ3EQQh1fbAawegPW` is not spent.

Therefore the special coin representing Quantum expired 36000 blocks after its creation, with block 210923 at 10:25:59GMT on the twenty-fourth of December 2014.

Conclusion
==========

Quantum was represented as a transaction output encoding a special coin on the NameCoin blockchain. This special coin was lost when that transaction output expired, meaning that the original owner could no longer update it and that anyone could create a _new_ special coin with the same name. NameCoin does not differentiate between uncreated coins and expired coins, in each case a new special coin is created when a name is registered. But it was the original special coin that was the blockchain entry mentioned in Quantum's text. Therefore the original version of Quantum was lost with the expiry of the last transaction representing that special coin.

Any recreation of the same name and metadata key/value pair on NameCoin will _not_ be the same special coin because it will create a new transaction output unrelated to the previous outputs representing the previous special coin representing that name. It will therefore not be the same blockchain entry referred to by the text of Quantum.

It will therefore will not be Quantum.

I am not a lawyer and none of this essay is legal advice, but I suspect that anyone seeking to recreate Quantum, by whatever means, other than Kevin McCoy or his successors will lack sufficient rights to offer a transfer of title for `quantum.gif`.

In the general case, of course, Kevin McCoy can recreate lost artworks by whatever technical means he wishes.
