package com.nikdudnik.naive.systems;

import com.nikdudnik.naive.core.Component;

using com.nikdudnik.naive.core.Query;
import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Engine;
using Lambda;

typedef CollisionData = {
	x:Float,
	y:Float,
	r:Float,
	e:Ent
}

/**
 * ...
 * @author nek
 */
class Collider {
	
	public static  function collide(g:Engine, g1:Tag, g2:Tag) {
		
		var lst = g.world.query([group, position, hitRadius]);

		var ents = lst.exactly(group(g1));
		var obst = lst.exactly(group(g2));
		
		var edata = ents.map(function(e:Ent):CollisionData {
			var x = e.get(position)[0];
			var y = e.get(position)[1];
			var r = e.get(hitRadius)[0];
			return {x:x, y:y, r:r, e:e};
		});
		
		var odata = obst.map(function(e:Ent):CollisionData {
			var x = e.get(position)[0];
			var y = e.get(position)[1];
			var r = e.get(hitRadius)[0];
			return {x:x, y:y, r:r, e:e};
		});

		edata.iter(function(e:CollisionData) {
			odata.iter(function(o:CollisionData) {
				var dx = e.x - o.x;
				var dy = e.y - o.y;
				
				if (Math.abs(dx) < 20 && Math.abs(dy) < 20) {
					var ecr = e.r;
					var ocr = o.r;
				
					var d = Math.sqrt(dx*dx + dy*dy);
					var p = d - (ecr + ocr);				
					if ( p < 0 ) {
						e.e.set(collision(dx*p/d, dy*p/d, g2));
					};
				};
			});
		});
	}		
	
	public static function react(g:Engine) {
		var lst = g.world.query([collision]);
		lst.iter(function(e:Ent) {
			
			var wpx = e.get(position)[0];
			var wpy = e.get(position)[1];
			
			var pvx = e.get(collision)[0];
			var pvy = e.get(collision)[1];
			
			e.set(position(wpx - pvx, wpy - pvy));
			
			e.del(collision);
		});
	}

}
