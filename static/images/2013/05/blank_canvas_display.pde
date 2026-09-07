/*******************************************************************************
blank_canvas_display - Display blank canvases in a web page
Copyright (C) 2012 Rhea Myers <rhea@myers.studio>
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*******************************************************************************/


////////////////////////////////////////////////////////////////////////////////
// Configuration for the graphical environment
////////////////////////////////////////////////////////////////////////////////

// The size and background colour of our area of the page
// Ideally we'd get these from the <canvas> tag
static final color wallColour = color(#f9f9f9);
static final int wallSize = 500;


////////////////////////////////////////////////////////////////////////////////
// Lifecycle and interaction
////////////////////////////////////////////////////////////////////////////////

void setup() {
    size(wallSize, wallSize);
    configureComposition();
    noLoop();
}

void draw () {
    background(wallColour);
    // Draw the composition
    translate(compositionXOrigin, compositionYOrigin);
    drawComposition();
    // Frame it
    noFill();
    stroke(#dddddd);
    // I seem to be having problems with rect()???
    //rect(0, 0, compositionWidth, compositionHeight);
    line(0, 0, compositionWidth, 0);
    line(0, 0, 0, compositionHeight);
    line(compositionWidth, compositionHeight, compositionWidth, 0);
    line(compositionWidth, compositionHeight, 0, compositionHeight);
}

void mouseClicked() {
    configureComposition();
    redraw();
}
