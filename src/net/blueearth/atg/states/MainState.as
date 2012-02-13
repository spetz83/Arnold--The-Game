package net.blueearth.atg.states
{
	import net.blueearth.atg.characters.Arnie;
	import net.blueearth.atg.characters.Predator;
	
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
		private var _enemies:FlxGroup;
		
		private var _enemyArray:Array = new Array();
		
		public var tileMap:FlxTilemap;
		
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
			
			createEnemies();
			
			_player = new Arnie(100, 0);
			
			add(_player);
			FlxG.camera.setBounds(0,0,800,600,true);
			FlxG.camera.follow(_player,FlxCamera.STYLE_PLATFORMER);
			
			_objects = new FlxGroup();
			_objects.add(_player);

		}
		
		private function createEnemies():void
		{
			_enemies = new FlxGroup();
			
			var enemy1:Predator = new Predator(332, 490, "", 418, 35);
			var enemy2:Predator = new Predator(101, 150, "", 130, 155);
			var enemy3:Predator = new Predator(524, 599, "", 562, 245);
			var enemy4:Predator = new Predator(390, 472, "", 429, 385);
			var enemy5:Predator = new Predator(689, 750, "", 719, 25);
			var enemy6:Predator = new Predator(690, 750, "", 719, 525);
			
			
			_enemyArray.push(enemy1, enemy2, enemy3, enemy4, enemy5, enemy6);
			
			for each(var enemy:Predator in _enemyArray)
			{
				add(enemy);
				
			}
			
			_enemies.add(enemy1);
			_enemies.add(enemy2);
			_enemies.add(enemy3);
			_enemies.add(enemy4);
			_enemies.add(enemy5);
			_enemies.add(enemy6);
		}
		
		private function generateLevel():void
		{
			this.tileMap = new FlxTilemap();
			this.tileMap.loadMap(new LevelData(), Floor, 10, 10, 0, 1);
			_blocks.add(this.tileMap);
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(_blocks, _objects);
			FlxG.collide(_blocks, _enemies);
		}
	}
}