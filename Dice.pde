void setup() {
	size(500, 600);
  frameRate(5);
}

void draw() {
  background(200);
  ArrayList<Die> dice = new ArrayList<Die>();
  int dice_per = 10;
  int margin = 5;
  float size = width / dice_per - margin * (dice_per + 1.0) / dice_per;
  for (int y = 0; y < dice_per; y++) {
    for (int x = 0; x < dice_per; x ++) {
      dice.add(new Die(x * size + (x + 1) * margin, y * size + (y + 1) * margin, size));
    }
  }
  int sum = 0;
  int max = (int) Math.pow(dice_per, 2) * 6;
	for (Die die : dice) {
    die.show();
    sum += die.val;
  }
  fill(100);
  rect(5, 505, 490 * sum / max, 50, 5);
  textAlign(CENTER);
  fill(0);
  text("Sum: " + Integer.toString(sum), 5 + 490 * sum / max / 2, 505 + 25);
}

void mouseClicked() {
  redraw();
}

class Die {	
  int val;
  float x, y, size;
	Die(float x, float y, float size) {
		this.x = x;
    this.y = y;
    this.size = size;
    val = roll();
	}
	int roll() {
		return (int) (Math.random() * 6) + 1;
	}
	void show() {
    fillRandom();
    noStroke();
		rect(x, y, size, size, size / 4.0);
    switch(val) {
      case 1:
        fillRandom();
        ellipse(this.x + this.size / 2, this.y + this.size / 2, this.size / 5, this.size / 5);
        break;
      case 2:
        fillRandom();
        ellipse(this.x + this.size / 5, this.y + this.size / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size * 4 / 5, this.size / 5, this.size / 5);
        break;
      case 3:
        fillRandom();
        ellipse(this.x + this.size / 5, this.y + this.size / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size / 2, this.y + this.size / 2, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size * 4 / 5, this.size / 5, this.size / 5);
        break;
      case 4:
        fillRandom();
        ellipse(this.x + this.size / 5, this.y + this.size / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size * 4 / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size / 5, this.y + this.size * 4 / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size / 5, this.size / 5, this.size / 5);
        break;
      case 5:
        fillRandom();
        ellipse(this.x + this.size / 5, this.y + this.size / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size * 4 / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size / 5, this.y + this.size * 4 / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size / 2, this.y + this.size / 2, this.size / 5, this.size / 5);
        break;
      case 6:
        fillRandom();
        ellipse(this.x + this.size / 5, this.y + this.size / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size * 4 / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size / 5, this.y + this.size * 4 / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size / 5, this.size / 5, this.size / 5);
        ellipse(this.x + this.size * 4 / 5, this.y + this.size / 2, this.size / 5, this.size / 5);
        ellipse(this.x + this.size / 5, this.y + this.size / 2, this.size / 5, this.size / 5);
        break;
	  }
  }
  void fillRandom() {
    fill((int) random(0, 256), (int) random(0, 256), (int) random(0, 256));
  }
}
