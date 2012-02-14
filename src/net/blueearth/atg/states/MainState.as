package net.blueearth.atg.states
{
	import net.blueearth.atg.characters.Arnie;
	import net.blueearth.atg.characters.Bullet;
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
		private var _bullets:FlxGroup;
		
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
			_bullets = new FlxGroup();
			
			generateLevel();
			
			add(_blocks);
			
			createEnemies();
			
			_player = new Arnie(100, 0, _bullets);
			
			add(_player);
			FlxG.camera.setBounds(0,0,800,600,true);
			FlxG.camera.follow(_player,FlxCamera.STYLE_PLATFORMER);
			
			add(_bullets);
			
			_objects = new FlxGroup();
			_objects.add(_player);
			_objects.add(_bullets);

		}
		
		private function createEnemies():void
		{
			_enemies = new FlxGroup();
			
			var enemy1:Predator = new Predator(332, 490, Predator.SoundCpu, 418, 35);
			var enemy2:Predator = new Predator(101, 150, Predator.SoundDoEeet, 130, 155);
			var enemy3:Predator = new Predator(524, 599, Predator.SoundContract, 562, 245);
			var enemy4:Predator = new Predator(390, 472, Predator.SoundUnarmed, 429, 385);
			var enemy5:Predator = new Predator(689, 750, Predator.SoundExpressionOne, 719, 25);
			var enemy6:Predator = new Predator(690, 750, Predator.SoundExpressionTwo, 719, 525);
			
			
			_enemyArray.push(enemy1, enemy2, enemy3, enemy4, enemy5, enemy6);
			
			for each(var enemy:Predator in _enemyArray)
			{
				add(enemy);
				_enemies.add(enemy);
			}
			
			//_objects.add(_enemies);
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
			FlxG.overlap(_bullets, _enemies, overlapped);
			
			if(FlxG.score >= _enemyArray.length)
			{
				FlxG.fade(0xFF0000, 3, onVictory);
			}
			//FlxG.overlap(_bullets, _blocks, overlapped);
		}
		
		private function onVictory():void
		{
			FlxG.switchState(new GameOverState());
		}
		
		private function overlapped(sprite1:FlxSprite, sprite2:FlxSprite):void
		{
			if((sprite1 is Bullet))
			{
				sprite1.kill();
			}
			if((sprite2 is Predator))
			{
				sprite2.hurt(1);
			}
		}
	}
}