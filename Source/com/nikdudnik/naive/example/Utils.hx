package com.nikdudnik.naive.example;

import com.nikdudnik.naive.core.Component;
import com.nikdudnik.naive.core.ComponentUtils;
import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Query;
using com.nikdudnik.naive.core.Query;
import com.nikdudnik.naive.core.Engine;

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
				sspeed(100),
                follow(mouse)
			]);
	}
	
	public static function createUFO(s:Engine):Ent {
		return Ent.create([
			position(Math.random()*800, -50),
			renderable(0x00FF00, 10),
			hitRadius(10),
			group(ufo),
            sspeed(100)
		]);
	}

    public static function generateEnemy(s:Engine):Ent {
            var f = Math.random();
            var u = createUFO(s);
            u.set(follow(player));
            s.world.add(u);
            return u;
        }
	
	public static function createAddGenerator(world:FastList<Ent>, f:Void->Ent):Ent {
		return world.create([generator(f)]);
	}

}
