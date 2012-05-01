package com.nikdudnik.naive.systems;

import com.nikdudnik.naive.core.Component;
import nme.geom.Rectangle;
using com.nikdudnik.naive.core.Query;

import com.nikdudnik.naive.core.Component;
using Lambda;

import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.GameLoop;

/**
 * ...
 * @author nek
 */
class WorldBounds {
	
	private static var bounds:Rectangle;

	public static function setup(bounds:Rectangle):World->Void {
		WorldBounds.bounds = bounds;
        return killOutsideBounds;
	}			
	
	private static  function killOutsideBounds(world:World) {
		var lst = world.query([position, Component.bounds]);
        for (e in lst) {
            var pos = e.get(position);
            var epy:Float = pos[1];
            var epx:Float = pos[0];
            if (epx > bounds.right || epx < bounds.left || epy > bounds.bottom || epy < bounds.top) {
                e.set(dead);
                e.del(position);
                e.del(renderable);
            };
        };
	}

}
