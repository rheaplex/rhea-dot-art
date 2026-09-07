+++
title = "Importing Tate Collection Data Into MongoDB"
date = 2013-11-05 00:53:51+00:00
path = "/2013/11/05/importing-tate-collection-data-into-mongodb/"

[taxonomies]
categories = [
    "Art History",
    "Art Open Data",
    "Free Culture",
]
+++

You have to feed records into Mongo one per line. Like this:

    
    
    find artists -name *.json -exec perl -p -e 's/\n/ /' '{}' \; -exec echo \; | mongoimport --db tate --collection artists
    find artworks -name *.json -exec perl -p -e 's/\n/ /' '{}' \; -exec echo \; | mongoimport --db tate --collection artworks
    
