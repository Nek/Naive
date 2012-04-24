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
class Generator {
	
	private static var count:Int = 0;
	
	public static function generate(g:Engine) {
		count += 1;
		if (count % 2 != 0) return;
		var ents = g.world.query([generator]);
		ents.iter(function(e:Ent) {
			var gen:Void->Ent = e.get(generator)[0];
			var e:Ent = gen();
			g.world.add(e);
		});
	}	

}
