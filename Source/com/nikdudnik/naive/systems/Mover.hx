package com.nikdudnik.naive.systems;

import com.nikdudnik.naive.core.Component;

using com.nikdudnik.naive.core.Query;
using Lambda;

import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Engine;

/**
 * ...
 * @author nek
 */
class Mover {
	
	public static  function move(g:Engine) {
	
		var lst = g.world.query([vspeed, position]);
	
		lst.iter(function(e:Ent) {
			var px = e.get(position)[0];
			var py = e.get(position)[1];
			var sx = e.get(vspeed)[0];
			var sy = e.get(vspeed)[1];
			e.del(position);
			e.set(position(px+sx*g.elapsed, py+sy*g.elapsed));
		});
	}	

}
