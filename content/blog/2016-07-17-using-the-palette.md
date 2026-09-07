+++
title = "Using The Palette"
date = 2016-07-17 15:55:37-07:00
path = "/2016/07/17/using-the-palette/"

[taxonomies]
categories = [
    "Aesthetics",
    "Ethereum",
    "Projects",
]
+++

![palette-chooser](/images/2016/07/palette-chooser.png)

The "[Democratic Palette](/2016/07/11/democratic-palette/)" contract provides 12 colours to use. What happens if griefers set the palette to 12 colours that are almost exactly the same? What happens if you need colours with more or less contrast or hue difference? What if you need more or fewer colours? The only guarantee about them is that they will all be different by at least one point.

To fetch the current palette:

```
  var withPalette = function (callback) {
  var democratic_palette = Democratic_palette.deployed();
  var requests = [];
  for (var i = 0; i &lt; 12; i++) { requests.push(democratic_palette.palette(i) .then(function(colour) { return {index: i, colour: colour}; }); } Promise.all(requests).then(colours =&gt; {
      var palette = [];
      colours.foreach(function(colour) {
        palette[colour.index] = colour.colour;
      });
      callback(palette);
    });
  }
};
```

We can then get from one to twelve colours simply by truncating the array, e.g.:

```var my_3_colours = palette.slice(0, 3);```

Or we can get the bluest colour using a simple comparison:

```var bluest_colour = palette.sort(function(a, b){
  return a.blue - b.blue;
})[0];
```

Or we can take the average of the colours, which will probably represent the triumph of statistics over aesthetics.

More complex orderings and comparisons can be achieved using a colour library that allows us to work in HSV space. In particular we can use a version of the algorithm that Harold Cohen used for one version of his program AARON's colouring system ([see figure 15 here](http://www.aaronshome.com/aaron/publications/colouringwithoutseeing.pdf)), effectively ordering the colours in the palette by brightness then distributing them evenly across a brightness range sufficient to ensure that each is distinct from its neighbours.

What about more colours, or more structured relationships between colours where we are concerned that those relationships may not be present in the colours voted for within the palette? In the first case we can interpolate between existing colours, producing colours in-between those in the palette. Or in both cases we can use colour theory to produce related colours: complements, split-complements, tints and tones, etc. There are libraries to do this in Javascript, for example [color-scheme-js](https://github.com/c0bra/color-scheme-js) will produce entire colour schemes from individual colours.

"Democratic Palette" is intended to provide the equivalent of an aesthetic or colour symbology backed by Blockchain democracy rather than any other ideology or iconography, so it is intended to be easy and significant to us it as-is. But it's also possible to maintain a direct relationship to the palette while using colours that are not themselves present within it.
