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
			
			var placeholder:FlxText = new FlxText(FlxG.width*0.5 - 100, 10, 200, "MainState");
			placeholder.setFormat(null, 13, 0x000000, "center");
			add(placeholder);
			
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
			
			
			/*var b:FlxTileblock;
			var r:int = 200;
			
			b = new FlxTileblock(0, 0, 800, 10);
			b.loadTiles(Floor);
			_blocks.add(b);
			
			b = new FlxTileblock(0, 10, 20, 600-10);
			b.loadTiles(Floor);
			_blocks.add(b);
			
			b = new FlxTileblock(800-10, 10, 10, 600-10);
			b.loadTiles(Floor);
			_blocks.add(b);
			
			b = new FlxTileblock(10, 600-10, 800-10, 10);
			b.loadTiles(Floor);
			_blocks.add(b);
			
			
			buildRoom(r*0,r*0);
			buildRoom(r*1,r*0);
			buildRoom(r*2,r*0);
			buildRoom(r*3,r*0);
			buildRoom(r*0,r*1);
			buildRoom(r*1,r*1);
			buildRoom(r*2,r*1);
			buildRoom(r*3,r*1);
			buildRoom(r*0,r*2);
			buildRoom(r*1,r*2);
			buildRoom(r*2,r*2);
			buildRoom(r*3,r*2);
			buildRoom(r*0,r*3);
			buildRoom(r*1,r*3);
			buildRoom(r*2,r*3);
			buildRoom(r*3,r*3);*/
		}
		
		protected function buildRoom(RX:uint,RY:uint,Spawners:Boolean=false):void
		{
	
			//then place a bunch of blocks
			var numBlocks:uint = 3+FlxG.random()*4;
			numBlocks++;
			var maxW:uint = 20;
			var minW:uint = 2;
			var maxH:uint = 18;
			var minH:uint = 1;
			var bx:uint;
			var by:uint;
			var bw:uint;
			var bh:uint;
			var check:Boolean;
			for(var i:uint = 0; i < numBlocks; i++)
			{
				do
				{
					//keep generating different specs if they overlap the spawner
					bw = minW + FlxG.random()*(maxW-minW);
					bh = minH + FlxG.random()*(maxH-minH);
					//bx = -1 + FlxG.random()*(rw+1-bw);
					//by = -1 + FlxG.random()*(rw+1-bh);
					if(Spawners)
						//check = ((sx>bx+bw) || (sx+3<bx) || (sy>by+bh) || (sy+3<by));
						trace("SPAWNERS!!!!");
					else
						check = true;
				} while(!check);
				
				var b:FlxTileblock;
				b = new FlxTileblock(RX+bx*8,RY+by*8,bw*8,bh*8);
				b.loadTiles(Floor);
				_blocks.add(b);
			}
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(_blocks, _objects);
		}
	}
}