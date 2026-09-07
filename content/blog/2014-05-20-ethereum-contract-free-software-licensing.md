+++
title = "Ethereum Contract Free Software Licensing"
date = 2014-05-20 06:18:11+00:00
path = "/2014/05/20/ethereum-contract-free-software-licensing/"

[taxonomies]
categories = [
    "Free Software",
]
+++

Here's a simple example of a contract that is licensed under the GNU Affero General Public License:

    
    LICENSE = ["Copyright 2014 Rhea Myers", "Licensed GNU AGPL V3+"]
    SOURCE = ["https://github.com/rheaplex/", "artworld-ethereum/"]
    
    // Make sure we have enough gas to run the contact
    if tx.value < tx.basefee * 100:
        // If not, stop
        stop
    
    if msg.data[0] == "license":
       return(LICENSE, 2)
    else if msg.data[0] == "source":
       return(SOURCE, 2)
    else:
        // Return false
        return(0)
    


Assuming that being part of the blockchain doesn't clash with the AGPL. Anyone? :-)
