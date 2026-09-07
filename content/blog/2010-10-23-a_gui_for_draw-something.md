+++
title = "A GUI For draw-something"
date = 2010-10-23 22:31:04+00:00
path = "/2010/10/23/a_gui_for_draw-something/"

[taxonomies]
categories = [
    "Art",
    "Art Computing",
    "Free Software",
    "Generative Art",
    "Projects",
]
+++

I've written a Gtk+ user interface for draw-something to help evaluate its output.  
  
You'll need the git repository for draw something, and cl-gtk2 installed:  
  
sbcl  
(asdf:oos 'asdf:load-op :asdf-install)  
(asdf-install:install :cl-gtk2-gtk)  
(asdf-install:install :cl-gtk2-cairo)  
  
git clone /git/draw-soemthing.git  
  
Then you can run the gtk.lisp script in src:  
  
cd draw-something/src  
sbcl --load gtk.lisp  
  
And once you select "New Drawing" you can view the different stages of its development. Which is very useful. I must add a File menu so people can use this to save images as well.  
  
![draw-something gui 1](/images/2010/10/23/ds1.png)  


  
![draw-something gui 2](/images/2010/10/23/ds2.png)  


  




