﻿#version 450

//#define Thickness 8.0
uniform float Thickness;

layout (location = 0) in vec3 Pos;
layout (location = 1) in vec4 Clr;
layout (location = 2) in vec2 UV;

layout (location = 0) out vec4 geom_Clr;

uniform mat4 Model;
uniform mat4 View;
uniform mat4 Project;

out gl_PerVertex {
	vec4 gl_Position;
	float gl_PointSize;
	float gl_ClipDistance[];
};

void main() {
	geom_Clr = Clr;

	mat4 MVP = Project * View * Model;
	gl_Position = MVP * vec4(Pos, 1.0);
}