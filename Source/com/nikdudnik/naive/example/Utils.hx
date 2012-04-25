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
				renderable(0),
				hitRadius(8),
				group(player),
				sspeed(350),
                follow(mouse)
			]);
	}

    public static function createAddDebris(world:FastList<Ent>):Ent {
    		return world.create( [
    				renderable(2),
                    bounds
    			]);
    	}
	
	public static function createAddUFO(s:Engine):Ent {
        var e = Ent.create([
        // -100 400
        			position(Math.random()*500 - 100 , -50),
        			renderable(1),
        			hitRadius(8),
        			group(ufo),
                    sspeed(300),
                    attack(player),
                    bounds
        		]);
		s.world.add(e);
        return e;
	}
	
	public static function createAddGenerator(world:FastList<Ent>, f:Void->Ent):Ent {
		return world.create([generator(f)]);
	}

}
