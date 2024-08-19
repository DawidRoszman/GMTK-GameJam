shader_type canvas_item;

void fragment() {
    // Define loop duration
    float loop_duration = 1.5; // Total duration for one complete fade-in and fade-out cycle
    float loop_time = mod(TIME, loop_duration); // Loop the time

    // Calculate UV with a sine wave effect
    vec2 uv = vec2(UV.x - sin(loop_time * 10.0) * 0.1, UV.y);

    // Sample the texture
    COLOR = texture(TEXTURE, uv);

    // Define fade durations
    float fade_in_duration = 1.5;   // Duration for fade-in
    float fade_out_duration = 1.5;  // Duration for fade-out

    // Calculate alpha for fade-in and fade-out
    float alpha;

    if (loop_time < fade_in_duration) {
        // Fade in
        alpha = loop_time / fade_in_duration; // Linear interpolation for fade-in
    } else {
        // Fade out
        alpha = 1.0 - ((loop_time - fade_in_duration) / fade_out_duration);
    }

    // Clamp alpha to stay within [0, 1]
    alpha = clamp(alpha, 0.0, 1.0);

    // Apply the alpha to the color
    COLOR.a *= alpha;

    // Called for every pixel the material is visible on.
}