package ;

import nme.display.Sprite;
using Type;
using Reflect;

import com.nikdudnik.naive.core.Component;
import com.nikdudnik.naive.core.Ent;

import com.nikdudnik.naive.core.Query;

import nme.text.TextField;

import haxe.FastList;

/**
 * ...
 * @author nek
 */
	
class Tests extends Sprite {
	
	public function new () {
		
		super();
		
		var e:Ent = new Ent();
				
		e.set(position(20,20));

		assert(e.has(position), "expected to be true");
		assert(e.has(renderable) == false, "expected to be false");
		
		e.del(position);
		
		assert(e.del(renderable) == false, "expected to be false");
				
		assert(e.has(position) == false, "expected to be false");

		assert(e.get(position) == null, "expected to be null");
				
		e.set(position(20,20));
		
		assert(e.get(position)[0] == 20, "expected to equal 20");
		assert(e.get(position)[1] == 20, "expected to equal 20");
		
		assert(Type.enumEq(group(player), group(player)), "expected to be equal");
		
		assert(e.exactly(position(20,20)), "expected to be true");
		
		e.set(group(ufo));
		
		assert(e.exactly(group(ufo)), "expected to be true");
		assert(e.exactly(group(player)) == false, "expected to be false");

        var l = new FastList<Ent>();

        var c1 = new Ent().set(position(10,10)).set(group(ufo));
        var c2 = new Ent().set(position(20,20)).set(group(ufo));
        var c3 = new Ent().set(group(player));
        l.add(c1);
        l.add(c2);
        l.add(c3);

        assert(Query.exactly(l, position(10,10)).remove(c1) == true, "expected to be true");

        var ufos = Query.exactly(l, group(ufo));
        assert(ufos.remove(c1) == true, "expected to be true");
        assert(ufos.remove(c2) == true, "expected to be true");
        assert(ufos.isEmpty() == true, "expected to be true");

        var pplayer = Query.exactly(l, group(player));
        assert(pplayer.remove(c3) == true, "expected to be true");
        assert(pplayer.isEmpty() == true, "expected to be true");

        var withPosition = Query.query(l, [position]);
        assert(withPosition.remove(c1) == true, "expected to be true");
        assert(withPosition.remove(c2) == true, "expected to be true");
        assert(withPosition.isEmpty() == true, "expected to be true");
}
	
	public static function assert( cond : Bool, errorMessage:String, ?pos : haxe.PosInfos ) {
      if( !cond )
          haxe.Log.trace("Error in "+pos.methodName  +". Result is "+ errorMessage+".",pos);
    }
	
}