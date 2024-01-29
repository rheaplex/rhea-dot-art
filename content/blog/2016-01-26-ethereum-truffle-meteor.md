---
title: 'Ethereum: Truffle + Meteor'
date: 2016-01-26 22:04:48.000000000 -08:00
type: post
layout: post
categories:
- Ethereum
- Projects
author: Rhea Myers
---
Meteor is the recommended development framework for Ethereum dApps. Truffle is Consensys' development  system for Ethereum dApps. We cannot currently add a Meteor build phase to Truffle, but we can integrate them easily enough with a script.

Install Meteor, Truffle and testrpc:

```curl https://install.meteor.com/ | sh
sudo npm install -g truffle
sudo npm install -g ethereumjs-testrpc```

Then create a file called truffle-meteor-build, in ~/bin or somewhere else easily accessible and paste the following into it:

```#!/bin/bash

# By Rhea Myers <rhea@myers.studio>
# CC0 2016
# To the extent possible under law, the person who associated CC0 with this
# work has waived all copyright and related or neighboring rights to this work.

# We copy the .meteor/ dir from app/ into the specified environment's build/ dir
# then call meteor-build-client in there, building into a meteor/ directory
# next to build/ .

if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]
then
    echo "Usage: truffle-meteor-build [environment]"
    echo "       Copies the .meteor directory from app into the truffle build,"
    echo "       then calls meteor-build-client."
    echo "ARGS:  [environment] - The truffle environment to use (default developmpment)."
    echo "       Make sure you have npm install -g meteor-build-client"
    echo "       and meteor init in the truffle app/ directory."
fi

environment="${1:-development}"
base_dir="$(pwd)"

if [ ! -f "${base_dir}/truffle.json" ]
then
    echo "Please call from within the top level of a Truffle project."
    exit 1
fi

app_dir="${base_dir}/app"
dot_metoer_dir="${app_dir}/.meteor"
environment_dir="${base_dir}/environments/${environment}"
truffle_build_dir="${environment_dir}/build"
meteor_build_dir="${environment_dir}/meteor"

if [ ! -d "${environment_dir}" ]
then
    echo "Cannot find directory for environment ${environment}."
    exit 1
fi

pushd "${base_dir}" > /dev/null
echo "Truffle: building ${environment} in ${truffle_build_dir}"
truffle build "${environment}"
cp -r "${app_dir}/.meteor" "${truffle_build_dir}"
pushd "${truffle_build_dir}" > /dev/null
echo "Meteor: building client in ${meteor_build_dir}"
meteor-build-client "${meteor_build_dir}" -p ''
popd > /dev/null
popd > /dev/null```

And make it executable:

    chmod +x truffle-meteor build

In one shell window start testrpc:

    testrpc

In another shell window create the Truffle/Meteor project:

```mkdir truffle-meteor
truffle init
cd truffle-meteor
cd app
rm -rf *
meteor create .
meteor add ethereum:elements
```

This will create files called app.html, app.js, and app.css . You can rename them to whatever you like. Open truffle-meteor/truffle.json in a text editor and make sure the filenames match those in app/, that the Javascript file has the requisite post-processing commands to add Truffle and the Contract code and that there are no post-process commands for the HTML files.

The results should look similar to this:

```{
  "build": {
    "is-art.html": {
      "files": [
        "is-art.html"
      ],
      "post-process": []
    },
    "is-art.js": {
      "files": [
      "is-art.js"
      ],
      "post-process": [
        "bootstrap",
        "frontend-dependencies"
      ]
    },
    "app.css": [
      "is-art.css"
    ],
    "images/": "images/"
  },
  "deploy": [
    "IsArt"
  ],
  "rpc": {
    "host": "localhost",
    "port": 8545
  }
}```

Edit the contract, HTML, CSS and JavaScript as needed.

Deploy the contract:

    truffle deploy</pre>

Then build the meteor project:

    truffle-meteor-build

You can now open the Meteor client in a web browser:

    chromium environments/development/meteor/index.html

As you continue to develop the project you can reload the Meteor client in the web browser to see your changes. Make sure you keep testrpc running - if you stop and restart it you'll need to deploy the contracts again.
