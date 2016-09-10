// 6160
// sixonesixo.com
// github.com/6160
// ---------------
// source code for the cover of 'knife'

int x = 1;
int y = 1;
int x_iter = 21;
int y_iter = 21;
boolean save_frame=true;

void setup() {
	size(2880,1800);
	frameRate(1);
	background(0);
	stroke(255);
	strokeWeight(2); 
}

void draw_point(int x, int y){
	//use your own drawing function if you want to change
	//the shape drawn on the current point.
	point(x,y);
}

int calculate_offset(int v, int v2){
	int off = ((v+v2)%70); //tweak this to change the pattern behaviour
	return off;
}

void draw(){	
	while (y<height){
		x_iter = 0;
		while(x<width){
			x_iter++;
			int y_value = y_iter;
			if (x_iter == 1) {
				y_value = 0;
			}
			x = x+calculate_offset(x_iter, y_value);
			draw_point(x,y);
    	}  
    	y_iter++;
    	y = y+calculate_offset(y_iter, 0); 
    	x = 1;    
	}

	if (save_frame){
		saveFrame("output.tif");
		save_frame=false;
	}
}