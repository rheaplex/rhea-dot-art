+++
title = "rheart"
date = 2004-01-01
path = "/rheart/"

[extra]
image = "/art-images/drawinga.png"
mediums = [
    "Common Lisp",
]
wp_id = 6681
+++

**Installation And Use**

You will need a Lisp compiler (I use SBCL and OpenMCL) and some ability with the command line. Get the current source from SourceForge CVS or the most recent release from SourceForge downloads. CVS is better.

To run draw-something:

```
cd rheart/draw-something
sbcl
(load "load.lisp")
(run)
```

## **Project News**

![](/images/2012/07/drawingb.png)

2007-10-04 draw-something has a new pen parameters system to vary drawing styles within the same drawing.

2006-09-19 A blog post about draw-something at [Crystalpunk](http://socialfiction.org/index.php?n=904).

2007-08-04 rheart is now GPL 3 licenced. draw-something-carbon has been removed as a result of licence incompatibility and bitrot.

2007-03-06 The colour-cells algorithm has now been merged into draw-something along with a new composition system.

2006-12-26 The colour-cells program implements Harold Cohen’s new colouring system from AARON, as described in his talk for CAS.

2006-03-23 draw-something presented at Cybersalon’s [Creative Software](http://www.cybersalon.org/creative_software/index.html) event.

2006-01-10 A blog post about draw-something at [Lemonodor](http://lemonodor.com/archives/001327.html), a mostly Lisp weblog.

2006-01-02 Flash version of draw-something online.
Source available at SourceForge as draw-something-flash or included in the main rheart 0.3 release.

2005-10-19 draw-something shown at [dorkbot london 33](http://www.dorkbot.org/dorkbotlondon/20051019.html)

2005-08-10 Source for version 0.2 of rheart now available from Sourceforge.
MacOS X Carbon version of draw-something also now available from SourceForge.

2005-07-27 draw-something exhibited in my show [HOWTO](/2005/08/02/howto-images/) at Gallery o3one in Belgrade.

2005-05-14 MacOS X Carbon version of draw-something added.

2005-04-02 Stochastic pen and random colour added.

_2005-01-17_ More readable and modular code is now in CVS ready for the next round of development.
