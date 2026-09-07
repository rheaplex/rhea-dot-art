/*******************************************************************************
blank_canvas_generator - Library to generate single-colour canvas compositions
Copyright (C) 2012 Rob Myers <rob@robmyers.org>
 
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
// Configuration for ranges of properties of the composition
////////////////////////////////////////////////////////////////////////////////

static final float min_aspect_ratio = 1.0;
// Will be used as the exclusive upper bound of a random value
static final float max_aspect_ratio = 2.0;

static final int taller_than_wide_probability = 3;


////////////////////////////////////////////////////////////////////////////////
// The state of the composition
////////////////////////////////////////////////////////////////////////////////

float compositionWidth;
float compositionHeight;
float compositionXOrigin;
float compositionYOrigin;
color canvasColour;


////////////////////////////////////////////////////////////////////////////////
// Colour generation
////////////////////////////////////////////////////////////////////////////////

// Generate a random Processing color

color gen_colour() {
  return color(random(1.0) * 255, random(1.0) * 255, random(1.0) * 255);
}

////////////////////////////////////////////////////////////////////////////////
// Configuring the composition
////////////////////////////////////////////////////////////////////////////////

void configureComposition() {
  // Start out by generating a composition that is wider than it is tall
  compositionWidth = width;
  float aspect_ratio = random(min_aspect_ratio, max_aspect_ratio);
  compositionHeight = compositionWidth / aspect_ratio;
  // Occasionally use a composition that is taller than it is wide
  if (int(random(0, taller_than_wide_probability)) == 0) {
    float temp = compositionWidth;
    compositionWidth = compositionHeight;
    compositionHeight = temp;
  }
  compositionXOrigin = (width - compositionWidth) / 2.0;
  compositionYOrigin = (height - compositionHeight) / 2.0;
  canvasColour = gen_colour();
}


////////////////////////////////////////////////////////////////////////////////
// Drawing
////////////////////////////////////////////////////////////////////////////////

void drawComposition() {
  // Background
  noStroke();
  fill(canvasColour);
  rectMode(CORNER);
  rect(0, 0, compositionWidth, compositionHeight);
}
