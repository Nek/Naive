package com.nikdudnik.naive.systems;

using com.nikdudnik.naive.core.Query;

import com.nikdudnik.naive.core.Component;
using Lambda;

import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.GameLoop;

/**
 * ...
 * @author nek
 */
class Cleaner {
	
	public static  function removeDead(world:World) {
		var lst = world.exactly(dead);
        for (e in lst) {
            world.remove(e);
        }
	}

}
