shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}
const float DIMMING = 0.01;
const float SCANLINE_BOOST = 1.5;
void fragment() {
	if(mod(FRAGCOORD.y,4.0) <= 2.0)
	{
		COLOR = vec4(COLOR.r*DIMMING,COLOR.g*DIMMING,COLOR.b*DIMMING,COLOR.a*SCANLINE_BOOST);
	}
	else
	{
		//COLOR = vec4(0,255,0,255);
	}
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
