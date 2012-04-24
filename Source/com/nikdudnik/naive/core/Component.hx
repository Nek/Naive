package com.nikdudnik.naive.core;

import nme.display.DisplayObject;

/**
 * ...
 * @author nek
 */
enum Component {
	position(x:Float, y:Float);
	vspeed(x:Float, y:Float);
	sspeed(s:Float);
	renderable(color: Int, r:Float);
	view(s:DisplayObject);
	group(t:Tag);
	hitRadius(r:Float);
	collision(x:Float,y:Float, g:Tag);
	generator(f:Void -> Ent);
	dead;
	mouse(x:Float, y:Float);
	arrowkeys(up:Bool, down:Bool, left: Bool, right: Bool);
}

enum Tag
	{
		 player;
		 ufo;
		 explosion;
	}