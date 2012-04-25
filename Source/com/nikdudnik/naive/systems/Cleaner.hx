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
class Cleaner {
	
	public static  function removeDead(g:Engine) {
		var lst = g.world.exactly(dead);
        for (e in lst) {
            g.world.remove(e);
        }
	}

}
