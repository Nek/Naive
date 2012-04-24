package com.nikdudnik.naive.example;

import nme.display.Sprite;
using Type;
using Reflect;

import Component;

import nme.text.TextField;

/**
 * ...
 * @author nek
 */
	
class Tests extends Sprite {
	
	public function new () {
		
		super();		
		
		var e:Ent = new Ent();
				
		e.set(position(20,20));
		e.set(controllable);
		
		assert(e.has(controllable), "expected to be true");
		assert(e.has(position), "expected to be true");
		assert(e.has(renderable) == false, "expected to be false");
		
		e.del(position);
		
		assert(e.del(renderable) == false, "expected to be false");
				
		assert(e.has(position) == false, "expected to be false");
		
		e.del(controllable);
		
		assert(e.has(controllable) == false, "expected to be false");
		
		assert(e.get(position) == null, "expected to be null");
				
		e.set(position(20,20));
		
		assert(e.get(position)[0] == 20, "expected to equal 20");
		assert(e.get(position)[1] == 20, "expected to equal 20");
		
		assert(Type.enumEq(group(player), group(player)), "expected to be equal");
		
		assert(e.exactly(position(20,20)), "expected to be true");
		
		e.set(group(ufo));
		
		assert(e.exactly(group(ufo)), "expected to be true");
		assert(e.exactly(group(player)) == false, "expected to be false");		
	}
	
	public static function assert( cond : Bool, errorMessage:String, ?pos : haxe.PosInfos ) {
      if( !cond )
          haxe.Log.trace("Error in "+pos.methodName  +". Result is "+ errorMessage+".",pos);
    }
	
}