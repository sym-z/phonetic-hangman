shader_type canvas_item;
const float speed = 0.2;
const float dimming = 0.55;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR.r *= abs(sin(TIME*speed));
	COLOR.g *= abs(cos(TIME*speed));
	COLOR.b *= abs(sin(TIME*0.8 * speed));
	COLOR.rgb *= dimming;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
