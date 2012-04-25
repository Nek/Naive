package com.nikdudnik.naive.systems;

import nme.display.Tilesheet;
import nme.geom.Rectangle;
import nme.display.Sprite;

using com.nikdudnik.naive.core.Query;

import com.nikdudnik.naive.core.Component;

import com.nikdudnik.naive.core.Ent;
import com.nikdudnik.naive.core.Engine;

using Lambda;

import nme.Assets;


/**
 * ...
 * @author nek
 */
class Render {
	
	public static var sheet:Tilesheet;
	
	public static function setupRender(g:Engine):Void {
		sheet = new Tilesheet(Assets.getBitmapData("assets/red_circle.png"));
		sheet.addTileRect(new Rectangle(0, 0, 20, 20), new nme.geom.Point(10,10));
	}

	public static function draw(g:Engine, v:Sprite) {
		var lst = g.world.query([position, renderable]);
		var data:Array<Float> = [];
		lst.iter(function(e:Ent) {
			var epx:Float = e.get(position)[0];
			var epy:Float = e.get(position)[1];
			data.push(epx);
			data.push(epy);
            data.push(0.0);
		});
		if (data.length > 0) {
			v.graphics.clear();
			sheet.drawTiles(v.graphics, data, true);
		};
	}		

}
