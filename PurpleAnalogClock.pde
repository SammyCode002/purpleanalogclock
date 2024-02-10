// Setup function runs once at the start of the sketch
void setup() {
  size(400, 400); // Set the size of the window to 400x400 pixels
  noStroke(); // Disable drawing outlines for shapes
}

// Draw function runs in a loop after setup
void draw() {
  background(255); // Set the background color to white
  translate(width/2, height/2); // Move the origin to the center of the window
  
  // Drawing the clock face
  fill(200); // Set the fill color for shapes (grey for the clock face)
  ellipse(0, 0, 300, 300); // Draw the clock face as a circle centered at the new origin
  
  // Function call to draw the clock numbers
  drawClockNumbers();
  
  // Retrieving the current time
  int hours = hour(); // Get the current hour
  int minutes = minute(); // Get the current minute
  int seconds = second(); // Get the current second
  
  // Adjusting hours to a 12-hour format instead of 24-hour
  hours = hours % 12;
  
  // Drawing the clock hands
  drawHand(100, map(hours % 12, 0, 12, 0, TWO_PI), 8); // Draw the hour hand
  drawHand(140, map(minutes, 0, 60, 0, TWO_PI), 6); // Draw the minute hand
  drawHand(140, map(seconds, 0, 60, 0, TWO_PI), 2, color(204, 153, 255)); // Draw the second hand in pastel purple
  
  // Drawing the center point of the clock
  fill(0); // Set the fill color to black
  ellipse(0, 0, 10, 10); // Draw a small circle at the center
}

// Function to draw a clock hand
void drawHand(float length, float angle, float weight) {
  pushMatrix(); // Save the current drawing state
  rotate(angle); // Rotate the drawing coordinate system by 'angle'
  stroke(0); // Set the line color to black
  strokeWeight(weight); // Set the thickness of the line
  line(0, 0, length, 0); // Draw the line for the hand
  popMatrix(); // Restore the previous drawing state
}

// Overloaded function to draw a clock hand with a specified color
void drawHand(float length, float angle, float weight, color handColor) {
  pushMatrix(); // Save the current drawing state
  rotate(angle); // Rotate the drawing coordinate system by 'angle'
  stroke(handColor); // Set the line color to the specified color
  strokeWeight(weight); // Set the thickness of the line
  line(0, 0, length, 0); // Draw the line for the hand
  popMatrix(); // Restore the previous drawing state
}

// Function to draw the clock numbers
void drawClockNumbers() {
  textAlign(CENTER, CENTER); // Align text to the center both horizontally and vertically
  float radius = 130; // Distance from the center to draw the numbers
  textSize(16); // Set the size of the text
  
  // Loop to draw numbers 1 through 12 around the clock
  for (int num = 1; num <= 12; num++) {
    float angle = radians(30 * num - 90); // Calculate the angle for each number
    float x = cos(angle) * radius; // Calculate the x position
    float y = sin(angle) * radius; // Calculate the y position
    
    fill(0); // Set the text color to black
    text(num, x, y); // Draw the number at the calculated position
  }
}
