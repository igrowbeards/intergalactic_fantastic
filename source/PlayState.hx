package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup;
import openfl.Assets;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {

	public var player:Player;
	public var level:FlxTilemap;
	public var transporters:FlxGroup;
	public var transporter1:Transporter;
	public var transporter2:Transporter;
	public var transporter3:Transporter;
	public var transporter4:Transporter;
	public var transporter5:Transporter;
	public var transporter6:Transporter;

	override public function create():Void {
		FlxG.cameras.bgColor = 0xff131c1b;
		#if !FLX_NO_MOUSE
			FlxG.mouse.hide();
		#end

		transporters = new FlxGroup();
		transporter1 = new Transporter(9,10);
		transporter2 = new Transporter(22,2);
		transporter3 = new Transporter(4,25);
		transporter4 = new Transporter(34,37);
		transporter5 = new Transporter(19,27);
		transporter6 = new Transporter(9,35);
		transporter1.target = transporter2;
		transporter2.target = transporter1;
		transporter3.target = transporter4;
		transporter4.target = transporter3;
		transporter5.target = transporter6;
		transporter6.target = transporter5;
		transporters.add(transporter1);
		transporters.add(transporter2);
		transporters.add(transporter3);
		transporters.add(transporter4);
		transporters.add(transporter5);
		transporters.add(transporter6);
		add(transporters);

		player = new Player(18,37);
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
		FlxG.overlap(player,transporters,transport);
	}

	private function transport(p:FlxSprite,t:FlxSprite) {
		var trans = cast(t,Transporter);
		var transTarg = cast(trans.target,Transporter);
		trans.deactivate();
		transTarg.deactivate();
		p.x = transTarg.x;
		p.y = transTarg.y + 16;
	}

}