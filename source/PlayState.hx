package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import openfl.Assets;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {

	public var player:Player;
	public var level:FlxTilemap;

	override public function create():Void {
		FlxG.cameras.bgColor = 0xff131c1b;
		#if !FLX_NO_MOUSE
			FlxG.mouse.hide();
		#end

		player = new Player(2,17);
		add(player);

		super.create();
		level = new FlxTilemap();
		level.loadMap(Assets.getText("data/mapCSV_Group1_Map1.csv"), "images/tiles.png",16,16,0,0,1,1);
		add(level);
	}

	override public function destroy():Void {
		super.destroy();
	}

	override public function update():Void {
		super.update();
		FlxG.collide(player,level);
	}
}