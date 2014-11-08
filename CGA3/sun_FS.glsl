// Arkadiusz Gabrys qe83mepi
// Agnieszka Zacher by57zeja

#version 120

varying vec4 phase;
varying vec3 vertexNormal;
varying vec3 viewDirection;

void main() {
    vec4 yellow = vec4(1.0, (1.0 - dot(vertexNormal, viewDirection)), 0.0, 0.0);

    vec4 color = vec4(1.0, length(phase), 0.0, 0.0);

    gl_FragColor = color + yellow;
}
