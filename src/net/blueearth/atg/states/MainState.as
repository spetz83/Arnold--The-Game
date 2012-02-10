package net.blueearth.atg.states
{
	import net.blueearth.atg.characters.Arnie;
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxTilemap;
	
	public class MainState extends FlxState
	{
		[Embed(source='assets/images/bg.png')]
		private var Bg:Class;
		
		[Embed(source='assets/images/floorTiles.png')]
		private var Floor:Class;
		
		[Embed(source='assets/maps/map1.txt', mimeType="application/octet-stream")]
		private var LevelData:Class;
		
		private var _player:Arnie;
		
		private var _blocks:FlxGroup;
		private var _objects:FlxGroup;
		
		public function MainState()
		{
			super();
		}
		
		override public function create():void
		{
			var bg:FlxSprite = new FlxSprite(0, 0, Bg);
			add(bg);
			
			_blocks = new FlxGroup();
			
			generateLevel();
			
			add(_blocks);
			
			_player = new Arnie(100, 0);
			
			add(_player);
			FlxG.camera.setBounds(0,0,800,600,true);
			FlxG.camera.follow(_player,FlxCamera.STYLE_PLATFORMER);
			
			_objects = new FlxGroup();
			_objects.add(_player);

		}
		
		private function generateLevel():void
		{
			var map:FlxTilemap = new FlxTilemap();
			map.loadMap(new LevelData(), Floor, 10, 10, 0, 1);
			_blocks.add(map);
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(_blocks, _objects);
		}
	}
}