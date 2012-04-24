package com.nikdudnik.naive.systems;
import com.nikdudnik.naive.core.Component;
import com.nikdudnik.naive.core.Query;
using com.nikdudnik.naive.core.Query;
import haxe.FastList;


import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Engine;

/**
 * ...
 * @author nek
 */
class Generator {
	
//	private static var count:Int = 0;
	
	public static function generate(g:Engine) {
//		count += 1;
//		if (count % 1 != 0) return;
		var ents = g.world.query([Component.generator]);
        for (e in ents) {
            var gen:Void->Ent = e.get(generator)[0];
            var e:Ent = gen();
            g.world.add(e);
        }
	}	

}
