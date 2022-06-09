int rows;
int cols;
int squareSize = 10;
boolean[][] alive;

boolean simulating;

color backgroundColor = color(0, 0, 0);


void setup() {
  size(800, 800);
  background(backgroundColor);
  rows = height / squareSize;
  cols = width / squareSize;
  alive = new boolean[rows][cols];
  simulating = false;
  frameRate(10);
}

void draw() {
  if (simulating) {
    updateCells();
  }

  background(backgroundColor);
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (alive[r][c]) {
        fill(255, 0, 0);
        rect(r*squareSize, c*squareSize, squareSize, squareSize);
      }
    }
  }
}

void updateCells() {
  boolean[][] temp = new boolean[rows][cols];
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      int count = countNeighbors(row, col);
      if (alive[row][col]) {
        if (count < 2 || count > 3) {
          temp[row][col] = false;
        } else {
          temp[row][col] = true;
        }
      } else {
        if (count == 3) {
          temp[row][col] = true;
        }
      }
    }
  }
  alive = temp;
}

int countNeighbors(int row, int col) {
  int count = 0;
  for (int r = -1; r <= 1; r++) {
    for (int c = -1; c <= 1; c++) {
      if (inBounds(row + r, col + c) && (r != 0 || c != 0)) {
        if (alive[row+r][col+c]) {
          count++;
        }
      }
    }
  }
  return count;
}

boolean inBounds(int row, int col) {
  return (row >= 0) && (row < rows) && (col >= 0) && (col < cols);
}

void keyPressed() {
  if (key == 'n') {
    updateCells();
  } else if (key == 'c') {
    alive = new boolean[rows][cols];
  } else if (key >= '1' && key <= '9') {
    frameRate(5*(int)(key - '0'));
  } else if (key == 'r') {
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        alive[row][col] = random(10) > 7 ? true : false;
      }
    }
  } else {
    simulating = !simulating;
  }
}

void mousePressed() {
  alive[(int)mouseX/squareSize][(int)mouseY/squareSize] = !alive[(int)mouseX/squareSize][(int)mouseY/squareSize];
}
