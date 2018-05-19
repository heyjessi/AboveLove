PImage character;
PImage companion;
var cha;
var comp;
		
void setup() {
	cha = new mainChar(-70, 55, 5, 150, 500);
	comp = new Companion(-70, 55, 5, 650, 500);
}

void draw() {
	background(#CC99FF);
	cha.drawChar();
	cha.moveChar();
	comp.drawComp();
	comp.moveComp();
}

		
void loadSprites() {
	/* @pjs preload= characterString; */
	character = loadImage(characterString);
}

void loadSprites2() {
	/* @pjs preload= compString; */
	companion = loadImage(compString);
}

class mainCharEnd{
	var h;
	var w;
	var xPos;
	var yPos;
	//speed x
	var sx;
	
	mainCharEnd(height, width, xspeed, x, y){
		h = height;
		w = width;
		xPos = x;
		yPos = y;
		sx = xspeed;
	}
	
	void drawCharEnd() {
		image(character, xPos, yPos, w, h);
	}
	
	void moveCharEnd() {
		while (xPos != 345) {
			xPos = xPos + sx;
		}
	}
}

class Companion{
	var h;
	var w;
	var xPos;
	var yPos;
	//speed x
	var sx;
	
	Companion(height, width, xspeed, x, y){
		h = height;
		w = width;
		xPos = x;
		yPos = y;
		sx = xspeed;
	}
	
	void drawComp() {
		image(companion, xPos, yPos, w, h);
	}
		
	void moveComp() {
		while (xPos != 455){
			xPos = xPos - sx;
		}
	}
}