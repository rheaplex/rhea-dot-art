---
title: draw-something 2016
date: 2016-02-12 19:22:14.000000000 -08:00
type: post
layout: post
categories:
- Art Computing
- Generative Art
- Projects
author: Rhea Myers
---
![draw-something drawing February 2016](/images/2016/02/draw-something-feb-2016-300x280.png)

I've updated the [Common Lisp](http://www.gigamonkeys.com/book/) version of [draw-something](/draw-something/) to use modern technologies - [Roswell](https://github.com/roswell/roswell), [QuickLisp](https://www.quicklisp.org/beta/), [ASDF 3](http://fare.tunes.org/files/asdf3/asdf3-2014.html), [cl-cffi-gtk](https://github.com/crategus/cl-cffi-gtk) and the [Plan](https://github.com/fukamachi/prove) testing library. The tests helped flush out bugs, changing my mis-uses of defmethod to defun silenced a lot of compiler warnings and that in turn helped find some more bugs. There's now a bit of technical debt in the form of function and class names, I'll address that later. Like the recent minara update, this is a bitrot update rather than a new feature release.

Running the code to test it reminded me of just how dissatisfied I was with the last version of draw-something. The image at the top of this post is one of the less bad results of running the code. This is an aesthetic / theoretic problem rather than a coding one. I need the same clarity that informed the earlier versions of the program (you can see a JavaScript version of one [running on tumblr](http://draw-something-rebooted.tumblr.com/)) in order to structure the code to output something you'd actually want to look at.
