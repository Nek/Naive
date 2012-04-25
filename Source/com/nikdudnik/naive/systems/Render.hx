package com.nikdudnik.naive.systems;

import nme.display.BitmapData;
import nme.display.Tilesheet;
import nme.geom.Rectangle;
import nme.geom.Point;
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

typedef TileRectData = {
    position: Rectangle,
    center: Point
}

class Render {
	
	public static var sheet:Tilesheet;
	
	public static function setupRender(g:Engine, bmd:BitmapData, tiles:Array<TileRectData>):Void {
        sheet = new Tilesheet(bmd);

        for (t in tiles) {
            sheet.addTileRect(t.position, t.center);
        }
	}

	public static function draw(g:Engine, v:Sprite) {
		var lst = g.world.query([position, renderable]);
		var data:Array<Float> = [];
		lst.iter(function(e:Ent) {
			var epx:Float = e.get(position)[0];
			var epy:Float = e.get(position)[1];
			var ndx:Float = e.get(renderable)[0];
			data.push(epx);
			data.push(epy);
            data.push(ndx);
		});
		if (data.length > 0) {
			v.graphics.clear();
			sheet.drawTiles(v.graphics, data, true);
		};
	}		

}
