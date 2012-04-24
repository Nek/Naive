package com.nikdudnik.naive.systems;

using com.nikdudnik.naive.core.Query;

import com.nikdudnik.naive.core.Component;
using Lambda;

import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Engine;

/**
 * ...
 * @author nek
 */
class PositionLimiter {
	
	private static var bound:Float;

	public static function setupPositionLimiter(g:Engine, bound:Float):Void {
		PositionLimiter.bound = bound;
	}			
	
	public static  function remove(g:Engine) {
		var lst = g.world.query([position]);
		lst.iter(function(e:Ent) {
			var epy:Float = e.get(position)[1];
			if (epy > bound) {
                g.world.remove(e);
            }
		});
	}

}
