shader_type canvas_item;
uniform float scale: hint_range(0.1,10);

void fragment() {
	vec2 distortedUV = UV;
	distortedUV.x += distortedUV.y * 0.2;
	vec4 pixelColor = texture(TEXTURE, UV * scale);
	COLOR = pixelColor;
}


void vertex() {
	// Called for every vertex the material is visible on.
}


//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
