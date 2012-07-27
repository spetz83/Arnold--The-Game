package net.blueearth.atg.characters
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class Bullet extends FlxSprite
	{
		[Embed(source="/assets/images/bullet.png")]
		private var ImgBullet:Class;
		
		[Embed(source="/assets/images/blood.png")]
		private var ImgBlood:Class;
		
		private var _blood:FlxEmitter;
		
		public var speed:Number;
		
		public function Bullet()
		{
			super();
			
			loadGraphic(ImgBullet, true, true);
			
			width = 17;
			height = 6;
			offset.x = 2;
			offset.y = 2;
			centerOffsets();
			
			addAnimation('normal', [0]);
			
			speed = 360;
		}
		
		override public function kill():void
		{
			if(!alive)
			{
				return;
			}
			velocity.x = 0;
			velocity.y = 0;
			if(onScreen())
			{
				//TODO: Will Play the impact sound
			}
			alive = false;
			solid = false;
			//TODO: Play an exploding animation?
			super.kill();
		}
		
		public function shoot(location:FlxPoint, direction:uint):void
		{
			//TODO: Play shoot sound
			super.reset(location.x-width/2, location.y-height/2);
			solid = true;
			facing = direction;
			if(direction == LEFT)
			{
				velocity.x = -speed;	
			}
			else
			{
				velocity.x = speed;
			}
		}
		
		override public function update():void
		{
			if(!alive)
			{
				if(finished)
					exists = false;
			}
			else if(touching)
			{
				kill();
			}
		}
	}
}