package com.nikdudnik.naive.systems;

import com.nikdudnik.naive.core.Component;
import nme.geom.Rectangle;
using com.nikdudnik.naive.core.Query;

import com.nikdudnik.naive.core.Component;
using Lambda;

import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Engine;

/**
 * ...
 * @author nek
 */
class WorldBounds {
	
	private static var bounds:Rectangle;

	public static function setupWorldBounds(g:Engine, bounds:Rectangle):Void {
		WorldBounds.bounds = bounds;
	}			
	
	public static  function killOutsideBounds(g:Engine) {
		var lst = g.world.query([position, Component.bounds]);
        for (e in lst) {
            var pos = e.get(position);
            var epy:Float = pos[1];
            var epx:Float = pos[0];
            if (epx > bounds.right || epx < bounds.left || epy > bounds.bottom || epy < bounds.top) {
                e.set(dead);
            };
        };
	}

}
