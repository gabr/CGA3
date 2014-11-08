#version 120

uniform float Time;

varying float phase;
varying vec3 vertexNormal;

float rand(vec2 n)
{
  return 0.5 + 0.5 * fract(sin(dot(n.xy, vec2(12.9898, 78.233)))* 43758.5453) * 100;
}

void main()
{
    phase = rand(gl_Normal.xy);
    vertexNormal = gl_Normal * sin(Time + rand(gl_Normal.xy));

    vec4 shift = vec4(vertexNormal.x, vertexNormal.y, vertexNormal.z, 0.0);
    gl_Position = gl_ModelViewProjectionMatrix * (gl_Vertex + shift);

    gl_FrontColor = vec4(0.0, 1.0, 0.0, 0.0);
    
}
