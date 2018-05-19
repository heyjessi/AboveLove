		PImage kelp;
		PImage sand;
		PImage fish;
		PImage evil;
		PImage bkg;
		PImage bgs;
		PImage character;
		PImage img2;		
		
		
		void loadSprites(){
		/* @pjs preload="kelp2.png"; */
		kelp = loadImage("kelp2.png");
		
		/* @pjs preload="sand.png"; */
		sand = loadImage("sand.png");
		
		/* @pjs preload="fish.png"; */
		fish = loadImage("fish.png");
		
		/* @pjs preload="evil.png"; */
		evil = loadImage("evil.png");
		
		/* @pjs preload="bg.png"; */
		bkg = loadImage("bg.png");
		
		/* @pjs preload="background.png"; */
		bgs = loadImage("background.png");
		
		/* @pjs preload= characterString; */
		character = loadImage(characterString);
		
		/* @pjs preload= characterAnimate; */
		img2 = loadImage(characterAnimate);
		}
		
		
		var m;
		var f;
		var luna;
		var c;
		var e;
		var e2;
		var e3;
		
		
		//Scroller(color, s stands for speed, y stands for y position, width, height)
		void setup(){
			//Enemy(h, w, s, x, y)
			//mainChar(height, width, xspeed, yspeed, x, y, color)
			size(800,594);
			//Moon(w, h, s, x, y){
			luna = new Moon(80, 70, 0.8, 800, 30);
			//Scroller(s, y, width, height)
			m = new Scroller(1, 700, 800, 110);
			//Ground(s, y, width, height)
			f = new Ground(1.5, 600, 500, 175);
			c = new mainChar(-70, 50, 5, 10, 150, 500);
			//Enemy(h, w, s, x, y)
			e = new Enemy(-70, 50, 3.5, 800, 500);
			e2 = new Enemy(-70, 50, 2, 800, 500);
			e3 = new Enemy(-70, 50, 4.5, 800, 500);
			font = loadFont("Helvetica");
		
			
		}

		void draw(){ 
			background(bgs);		
			luna.drawMoon();
			luna.moveMoon();
			m.drawScroller();
			m.moveScroller();
			f.drawGround();
			f.moveGround();
			c.jumpChar();
			e.drawEnemy();
			e.moveEnemy();
			e2.drawEnemy();
			e2.moveEnemy();
			e3.drawEnemy();
			e3.moveEnemy();
			fill(0);
			textFont(font, 30);
  			text("score: " + score, 15, 50);
  			text("lives: " + lives, 15, 80);
			
			if(c.yPos +c.h < e.yPos || c.yPos + c.h <e2.yPos){
                if(c.xPos + c.w > e.xPos - 1 && c.xPos +c.w < e.xPos + 2 || c.xPos + c.w > e2.xPos - 1 && c.xPos +c.w < e2.xPos + 2 ){
                    lives= lives - 1;
                }
            }
            
            if(c.yPos +c.h < e3.yPos){
            	if(c.xPos + c.w > e3.xPos - 1 && c.xPos +c.w < e3.xPos + 2){
                	lives= lives - 1;
                }
            }
            
            if(c.yPos < e.yPos || c.yPos < e2.yPos){
                if(c.xPos + c.w > e.xPos - 1 && c.xPos +c.w < e.xPos + 2 || c.xPos + c.w > e2.xPos - 1 && c.xPos +c.w < e2.xPos + 2 ){
                    score = score + 1;
                    lives = lives+1;
            
                }
            }
            if(c.yPos < e3.yPos){
            	if(c.xPos + c.w > e3.xPos - 1 && c.xPos +c.w < e3.xPos + 2){
                	score = score + 1;
                    lives = lives+1;
                }
            }
            
            if(lives < 0){
                text("GAME OVER", 400, 300);
                text("Your score is: " + score, 400, 350);
            
            }
			
		}
	
		class Building{
			var height;
			var width;
			var speed;
			//var r;
			//var g;
			//var b;
			var xPos;
			var yPos;

			
			Building(h, w, s, x, y){
				height = h;
				width = w;
				speed = s;
				/*r = color[0];
				g = color[1];
				b = color[2];*/
				xPos = x;
				yPos = y;
			}
			
			void drawBuilding(){
				//noStroke();
				//fill(r, g, b);
				//rect(xPos, yPos, width, height);
				image(kelp, xPos, yPos, width, height);
			}
			
			void moveBuilding(){
				xPos = xPos - speed;
			}
		}
		
		class Footer{
			var height;
			var width;
			var speed;
			//var r;
			//var g;
			//var b;
			var xPos;
			var yPos;

			
			Footer(h, w, s, x, y){
				height = h;
				width = w;
				speed = s;
				/*r = color[0];
				g = color[1];
				b = color[2];*/
				xPos = x;
				yPos = y;
			}
			
			void drawFooter(){
				//noStroke();
				//fill(r, g, b);
				//rect(xPos, yPos, width, height);
				image(sand, xPos, yPos, width, height);
			}
			
			void moveFooter(){
				xPos = xPos - speed;
			}
		}
		
		class Scroller{
			var r;
			var g;
			var b;
			var speed;
			//y position of the buildings in the screen
			var yPos; 
			//list of the different buildings
			var buildings = []; 
			// farthest x value
			var farthest_x = 0; 
			//we is the total width
			var we; 
			//he is the total height
			var he; 
			//w preset value width
			var w; 
			//h preset value height
			var h; 
			
			
			Scroller(s, y, width, height){
				/*r = color[0];
				g = color[1];
				b = color[2];*/
				speed = s; 
				yPos = y;
				w = width;
				h = height;
				
				
				while(farthest_x < 800){
					we = ((Math.random()*300)+w);
					he = ((Math.random()*350)+h);
					//Building(h, w, s, x, y)
					buildings.push(new Building(he, we, speed, farthest_x, (565-he)));
					farthest_x = farthest_x + (we/2);
				}
			}
			
			void drawScroller(){
				for(var i =0;i<buildings.length();i++){
					buildings[i].drawBuilding();
				}
			}	
			
			void moveScroller(){
				for(var i=0;i<buildings.length;i++){
					buildings[i].moveBuilding();
				}
				
				if (farthest_x > 800){
					we = ((Math.random()*100)+w);
					he = ((Math.random()*300)+h);
					buildings.push(new Building(he, we, speed, farthest_x, (600-he)));
					farthest_x = farthest_x + (we/2);
				}
			}
		}
		
		class mainChar{
			var h;
			var w;
			var xPos;
			var yPos;
			//speed x and speed y
			var sx;
			var sy;
			var jumpHeight;
			var jumpState;
			var accel;
			var counter=0;
			
			mainChar(height, width, xspeed, yspeed, x, y){
				h= height;
				w = width;
				xPos = x;
				yPos = y;
				sx = xspeed;
				sy = yspeed;
				jumpHeight = 100;
				jumpState = 0;
				accel = 0.15;
			}
			
			
	
			
				void jumpChar() {
					imageMode(CORNER);
					if (counter%4==1||counter%4==0){
						image(character,xPos,yPos,w,h);
					}
					else{
						image(img2,xPos,yPos,w,h);
					}
					
					//executes if key is pressed
					if (keyPressed == true){
						if(yPos == 500){
							sy = 5;
							//moves block left
							if (key == 'a'){
								console.log('left');
								counter++;
								xPos = xPos - sx;
							}	
							
							//moves block right
							else if (key == 'd'){
								console.log('right');
								counter++;
								xPos = xPos + sx;	
							}
							
							//moves block jump
								if (key == 'w'){
									console.log('jump');
									yPos = yPos -sy;
									sy = sy - accel;	
								}	
							}
						else if(yPos < 500){ 
							yPos = yPos -sy;
							sy = sy - accel;
							
							if (key == 'a'){
								console.log('left');
								counter++;
								xPos = xPos - (sx);
							}	
							
							//moves block right
							else if (key == 'd'){
								console.log('right');
								counter++;
								xPos = xPos + (sx);	
							}
							
						
						}
						
					}
					
					else if( keyPressed == false && yPos < 500){
						yPos = yPos -sy;
						sy = sy - accel;
					}
					if(yPos > 500){
						yPos = 500;
					}
					
					
					if( xPos <0 || xPos >765){
						 
						if(xPos<0){
							xPos = 0;
						}
						
						else if (xPos >765) {
						 	xPos = 765;
						} 
					}
				}
			}
			
			
			
		class Enemy{
			//var r;
			//var g;
			//var b;
			var height;
			var width;
			var speed;
			var xPos;
			var yPos;

			
			Enemy(h, w, s, x, y){
				height = h;
				width = w;
				speed = s;
				xPos = x;
				yPos = y;
			}
			
			void drawEnemy(){
				//noStroke();
				//fill(r, g, b);
				image(evil, xPos, yPos, width, height);
			}
			
			void moveEnemy(){
				xPos = xPos - speed;
				if (xPos < -20){
					xPos = 825;
				}
			}
		}
			
		
		class Ground{
			//var r;
			//var g;
			//var b;
			var speed;
			//y position of the buildings in the screen
			var yPos; 
			//list of the different buildings
			var footer = []; 
			// farthest x value
			var farthest_x = 0;	
			//w preset value width
			var w; 
			//h preset value height
			var h; 

			
			Ground(s, y, width, height){
				/*r = color[0];
				g = color[1];
				b = color[2];*/
				speed = s; 
				yPos = y;
				w = width;
				h = height;
				
				
				while(farthest_x < 800){
				
					footer.push(new Footer(h, w, speed, farthest_x, 600-h));
					farthest_x = farthest_x + w;
				}
			}
			
			void drawGround(){
				for(var i =0;i<footer.length();i++){
					footer[i].drawFooter();
				}
			}	
			
			void moveGround(){
				for(var i=0;i<footer.length;i++){
					footer[i].moveFooter();
				}
				
				 farthest_x = farthest_x - speed;
				
				if (farthest_x < 800){
						footer.push(new Footer(h, w, speed, farthest_x , (600-h)));
						farthest_x += w;
				}
			}
		}
		
		
		
		
		class Moon{
			var width;
			var height;
			var speed;
			var xPos;
			var yPos;
			
			Moon(w, h, s, x, y){
				width = w;
				height = h;
				speed = s;
				xPos = x;
				yPos = y;
			}
			
			void drawMoon(){
				//noStroke();
				//fill(r, g, b);
				//ellipse(xPos, yPos, width, height);
				image(fish, xPos, yPos, width, height);
			}
			
			void moveMoon(){
				xPos = xPos - speed;
					if (xPos < -50){
						xPos = 850
					}
			}
		}