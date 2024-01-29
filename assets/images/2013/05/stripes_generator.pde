/*******************************************************************************
stripes_generator - Library to generate stripe compositions
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

// The range of numbers of stripes

static final int min_num = 2;
static final int max_num = 42;

static final float min_aspect_ratio = 1.0;
// Will be used as the exclusive upper bound of a random value
static final float max_aspect_ratio = 3.0;

// 1/n probabilties where n is...
static final int taller_than_wide_probability = 3;
static final int shuffle_colour_probability = 2;


////////////////////////////////////////////////////////////////////////////////
// The state of the composition
////////////////////////////////////////////////////////////////////////////////

int numStripes;
float compositionWidth;
float compositionHeight;
float compositionXOrigin;
float compositionYOrigin;
color[] rectColours;
boolean rotateComposition;
boolean horizontalStripes;


////////////////////////////////////////////////////////////////////////////////
// Colour generation
////////////////////////////////////////////////////////////////////////////////

// Generate a random Processing color

color gen_colour() {
  return color(random(1.0) * 255, random(1.0) * 255, random(1.0) * 255);
}

// Generate an array of random Processing colors
// This can be stored and re-used when the image must be re-painted

color[] gen_colours(int count) {
  color[] colours = new color[count];
  for (int i = 0; i < count; i++) {
    colours[i] = gen_colour();
  }
  return colours;
}


////////////////////////////////////////////////////////////////////////////////
// Configuring the composition
////////////////////////////////////////////////////////////////////////////////

void configureComposition() {
  numStripes = int(random(min_num, max_num + 1));
  compositionWidth = width;
  float composition_aspect_ratio = random(min_aspect_ratio, max_aspect_ratio);
  compositionHeight = compositionWidth / composition_aspect_ratio;
  compositionXOrigin = (width - compositionWidth) / 2.0;
  compositionYOrigin = (height - compositionHeight) / 2.0;
  if(rotateComposition) {
    float tmp = compositionWidth;
    compositionWidth = compositionHeight;
    compositionHeight = tmp;
    tmp = compositionXOrigin;
    compositionXOrigin = compositionYOrigin;
    compositionYOrigin = tmp;
  }
  // Making the colour list is a bit involved
  // This is to make sure it works in js
  // Make a list of colours
  int numColours = int(random(2, numStripes));
  color colours[] = gen_colours(numColours);
  // Copy the list of colours repeated for the number of cells to colour
  rectColours = new color[numStripes];
  for(int i = 0; i < numStripes; i++) {
    rectColours[i] = colours[i % colours.length];
  }
  // Sometimes, shuffle the colours
  boolean shuffleColours = random(1.0) < 0.5;
  if(shuffleColours) {
    // Knuth shuffle
    for(int i = rectColours.length - 1; i > 0; i--) {
      // int cast for js version!
      int j = int(random(0, i + 1));
      color tmp = rectColours[i];
      rectColours[i] = rectColours[j];
      rectColours[j] = tmp;
    }
  }
  rotateComposition = int(random(0, taller_than_wide_probability)) == 0;
  horizontalStripes = random(0, shuffle_colour_probability) < 1.0;
}


////////////////////////////////////////////////////////////////////////////////
// Drawing
////////////////////////////////////////////////////////////////////////////////

// Draw a stripe of the given size and colour

void draw_stripe(float x, float y, float stripe_width, float stripe_height,
                 color colour) {
  fill(colour);
  rect(floor(x), floor(y), ceil(stripe_width), ceil(stripe_height));
}

// Reproducibly draw the stripes from the provided data

void draw_stripes_horizontal(float width, float height, int stripe_count,
                             color[] stripe_colours) {
  float stripe_height = height / stripe_count;
  float xPos = width / 2.0;
  int colour_index = 0;
  for(int i = 0; i < stripe_count; i++) {
    color colour = stripe_colours[colour_index];
    float yPos = (i * stripe_height) + (0.5 * stripe_height);
    draw_stripe(xPos, yPos, width, stripe_height, colour);
    colour_index = (colour_index + 1) % stripe_colours.length;
  }
}

void draw_stripes_vertical(float width, float height, int stripe_count,
                           color[] stripe_colours) {
  float stripe_width = width / stripe_count;
  float yPos = height / 2.0;
  int colour_index = 0;
  for(int i = 0; i < stripe_count; i++) {
    color colour = stripe_colours[colour_index];
    float xPos = (i * stripe_width) + (0.5 * stripe_width);
    draw_stripe(xPos, yPos, stripe_width, height, colour);
    colour_index = (colour_index + 1) % stripe_colours.length;
  }
}

void draw_stripes(float width, float height, int stripe_count,
                  boolean horizontal, color[] stripe_colours) {
  if(horizontal) {
    draw_stripes_horizontal(width, height, stripe_count, stripe_colours);
  } else {
    draw_stripes_vertical(width, height, stripe_count, stripe_colours);
  }
}

void drawComposition() {
  // Background
  noStroke();
  fill(#ffffff);
  rectMode(CORNER);
  rect(0, 0, compositionWidth, compositionHeight);
  // Cells
  rectMode(CENTER);
  noStroke();
  draw_stripes(compositionWidth, compositionHeight, numStripes,
               horizontalStripes, rectColours);
}

