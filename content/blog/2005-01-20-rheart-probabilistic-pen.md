+++
title = "rheart: Probabilistic Pen"
date = 2005-01-20 05:24:00+00:00
path = "/2005/01/20/rheart-probabilistic-pen/"

[taxonomies]
categories = [
    "Projects",
]
+++

A probabilistic pen for draw-something that uncannily resembles my freehand line:  
![](/images/drawing3.png)![](/images/drawing1.png)![](/images/drawing2.png)  
  
The first image is a drawing around a convex hull, the other two are drawings around polylines.  
  
How likely the pen is to turn left or right depends on how far it is from an ideal distance from the form it is drawing around. I've seen some mis-drawing so far (not shown), so the algorithm (or its parameters) needs some fine tuning, but I'm very pleased with how this looks.  
  
[Here's how the deterministic pen draws](/blog/2004/04/04/dropping-a-constraint-on-rheart-ouch).

  


