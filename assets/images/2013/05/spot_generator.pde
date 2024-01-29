/*******************************************************************************
spot_generator - Library to generate spot compositions
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

// The range of numbers of spots in a row or column

static final int min_num = 2;
static final int max_num = 32;

static final float min_aspect_ratio = 1.0;
// Will be used as the exclusive upper bound of a random value
static final float max_aspect_ratio = 3.0;

static final int taller_than_wide_probability = 3;


////////////////////////////////////////////////////////////////////////////////
// The state of the composition
////////////////////////////////////////////////////////////////////////////////

int numRows;
int numColumns;
float cellSize;
float spotSize;
float compositionWidth;
float compositionHeight;
float compositionXOrigin;
float compositionYOrigin;
color[] spotColours;


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
  // Start out by generating a composition that is wider than it is tall
  numRows = int(random(min_num, max_num + 1));
  float aspect_ratio = random(min_aspect_ratio, max_aspect_ratio);
  numColumns = min(int(numRows * aspect_ratio), max_num);
  cellSize = width / numColumns;
  spotSize = cellSize / 2.0;
  // Occasionally use a composition that is taller than it is wide
  if (int(random(0, taller_than_wide_probability)) == 0) {
    int temp = numRows;
    numRows = numColumns;
    numColumns = temp;
  }
  compositionWidth = cellSize * numColumns;
  compositionHeight = cellSize * numRows;
  compositionXOrigin = (width - compositionWidth) / 2.0;
  compositionYOrigin = (height - compositionHeight) / 2.0;
  spotColours = gen_colours(numColumns * numRows);
}


////////////////////////////////////////////////////////////////////////////////
// Drawing
////////////////////////////////////////////////////////////////////////////////

// Draw a spot of the given size and colour

void draw_spot(float x, float y, float size, color colour) {
  fill(colour);
  ellipse(x, y, size, size);
}

// Reproducibly draw a grid of coloured spots from the provided data

void draw_spots(float width, float height, int x_count, int y_count, 
float cell_size, float spot_size, color[] spot_colours) {
  int colour_index = 0;
  for (int y = 0; y < y_count; y++) {
    for (int x = 0; x < x_count; x++) {
      color colour = spot_colours[colour_index];
      float xPos = (x * cell_size) + (0.5 * cell_size);
      float yPos = (y * cell_size) + (0.5 * cell_size);
      draw_spot(xPos, yPos, spot_size, colour);
      colour_index = colour_index + 1;
    }
  }
}

void drawComposition() {
  // Background
  noStroke();
  fill(#ffffff);
  rectMode(CORNER);
  rect(0, 0, compositionWidth, compositionHeight);
  // Spots
  ellipseMode(CENTER);
  noStroke();
  draw_spots(compositionWidth, compositionHeight, 
  numColumns, numRows, cellSize, spotSize, spotColours);
}
