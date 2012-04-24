package com.nikdudnik.naive.core;

import com.nikdudnik.naive.core.Component;
import com.nikdudnik.naive.core.Query;
using com.nikdudnik.naive.core.Query;

import haxe.FastList;

import nme.display.Sprite;


/**
 * ...
 * @author nek
 */
class Utils {
	
	public static function createAddPlayer(world:FastList<Ent>):Ent {
		return world.create( [
				position(50, 50), 
				renderable(0xFF0000, 10), 
				hitRadius(10),
				group(player),
				arrowkeys(false,false,false,false),
				sspeed(100)
			]);
	}
	
	public static function createUFO(s:Engine):Ent {
		return ComponentUtils.create([
			position(Math.random()*800, -50),
			renderable(0x00FF00, 10),
			hitRadius(10),
			group(ufo),
			vspeed(Math.random()*40-20, 100)
		]);
	}	
	
	public static function createAddGenerator(world:FastList<Ent>, f:Void->Ent):Ent {
		return world.create([generator(f)]);
	}

}
