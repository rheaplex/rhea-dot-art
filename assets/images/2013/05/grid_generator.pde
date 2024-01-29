/*******************************************************************************
grid_generator - Library to generate grid compositions
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

// The range of numbers of cells in a row or column

static final int min_num = 2;
static final int max_num = 18;

static final float min_aspect_ratio = 1.0;
// Will be used as the exclusive upper bound of a random value
static final float max_aspect_ratio = 3.0;

static final int taller_than_wide_probability = 3;


////////////////////////////////////////////////////////////////////////////////
// The state of the composition
////////////////////////////////////////////////////////////////////////////////

int numRows;
int numColumns;
float cellWidth;
float cellHeight;
float compositionWidth;
float compositionHeight;
float compositionXOrigin;
float compositionYOrigin;
color[] rectColours;
boolean rotateComposition;


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
  numRows = int(random(min_num, max_num + 1));
  float grid_aspect_ratio = random(min_aspect_ratio, max_aspect_ratio);
  numColumns = min(int(numRows * grid_aspect_ratio), max_num);
  cellWidth = width / numColumns;
  compositionWidth = cellWidth * numColumns;
  float cell_aspect_ratio = random(min_aspect_ratio, max_aspect_ratio);
  compositionHeight = width / cell_aspect_ratio;
  cellHeight = compositionHeight / numRows;
  compositionXOrigin = (width - compositionWidth) / 2.0;
  compositionYOrigin = (height - compositionHeight) / 2.0;
  if(rotateComposition) {
    int temp = numColumns;
    numColumns = numRows;
    numRows = temp;
    float tmp = cellWidth;
    cellWidth = cellHeight;
    cellHeight = tmp;
    tmp = compositionWidth;
    compositionWidth = compositionHeight;
    compositionHeight = tmp;
    tmp = compositionXOrigin;
    compositionXOrigin = compositionYOrigin;
    compositionYOrigin = tmp;
  }
  // Making the colour list is a bit involved
  // This is to make sure it works in js
  // Make a list of colours
  int numColours = int(random(2, numRows * numColumns));
  color colours[] = gen_colours(numColours);
  // Copy the list of colours repeated for the number of cells to colour
  rectColours = new color[numRows * numColumns];
  for(int i = 0; i < numRows * numColumns; i++) {
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
  rotateComposition = (int(random(0, taller_than_wide_probability)) == 0);
}


////////////////////////////////////////////////////////////////////////////////
// Drawing
////////////////////////////////////////////////////////////////////////////////

// Draw a cell of the given size and colour

void draw_cell(float x, float y, float cell_width, float cell_height,
               color colour) {
  fill(colour);
  rect(floor(x), floor(y), ceil(cell_width), ceil(cell_height));
}

// Reproducibly draw a grid of coloured cells from the provided data

void draw_cells(float width, float height, int x_count, int y_count, 
float cell_width, float cell_height, color[] cell_colours) {
  int colour_index = 0;
  for (int y = 0; y < y_count; y++) {
    for (int x = 0; x < x_count; x++) {
      color colour = cell_colours[colour_index];
      float xPos = (x * cell_width) + (0.5 * cell_width);
      float yPos = (y * cell_height) + (0.5 * cell_height);
      draw_cell(xPos, yPos, cell_width, cell_height, colour);
      colour_index = (colour_index + 1) % cell_colours.length;
    }
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
  draw_cells(compositionWidth, compositionHeight, numColumns, numRows,
             cellWidth, cellHeight, rectColours);
}

