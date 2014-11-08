// Arkadiusz Gabrys qe83mepi
// Agnieszka Zacher by57zeja

#version 120

uniform float Time;
uniform vec3 cameraPos;

varying vec4 phase;
varying vec3 vertexNormal;
varying vec3 viewDirection;

float rand(vec2 n)
{
    return 0.5 + 0.5 * fract(sin(dot(n.xy, vec2(12.9898, 78.233)))* 43758.5453) * 100;
}

void main()
{
    vertexNormal = normalize(gl_Normal);
    viewDirection = normalize(cameraPos - gl_Vertex.xyz);

    vec3 shiftTmp = gl_Normal * sin(rand(gl_Normal.xy) + Time);
    phase = abs(vec4(shiftTmp.x, shiftTmp.y, shiftTmp.z, 0.0));

    gl_Position = gl_ModelViewProjectionMatrix * (gl_Vertex + phase);
}
