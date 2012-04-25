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
	renderable(tileIndex:Int);
	view(s:DisplayObject);
	group(t:Tag);
	hitRadius(r:Float);
	collision(x:Float,y:Float, g:Tag);
	generator(f:Void -> Ent);
	dead;
	mouseinput;
	arrowkeys(up:Bool, down:Bool, left: Bool, right: Bool);
    follow(tag:Tag);
    attack(tag:Tag);
    bounds;
}

enum Tag
	{
		 player;
		 ufo;
		 explosion;
		 mouse;
	}