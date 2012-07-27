package net.blueearth.atg.characters
{
	import net.blueearth.atg.states.MainState;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	public class Predator extends FlxSprite
	{		
		[Embed(source='assets/images/predator.png')]
		private var Enemy:Class;
		
		[Embed(source='assets/audio/cpu.mp3')]
		public static const SoundCpu:Class;
		
		[Embed(source='assets/audio/doEeet.mp3')]
		public static const SoundDoEeet:Class;
		
		[Embed(source='assets/audio/expressionsPartOne.mp3')]
		public static const SoundExpressionOne:Class;
		
		[Embed(source='assets/audio/expressionsPartTwo.mp3')]
		public static const SoundExpressionTwo:Class;
		
		[Embed(source='assets/audio/theContract.mp3')]
		public static const SoundContract:Class;
		
		[Embed(source='assets/audio/unarmed.mp3')]
		public static const SoundUnarmed:Class;
		
		private var _minX:Number = 0;
		private var _maxX:Number = 0;
		
		private var _minPoint:FlxPoint;
		private var _maxPoint:FlxPoint;
		
		private var _soundToPlay:Class;
		
		private var _startingX:Number;
		
		private var _mainState:MainState;
		
		public function Predator(minX:Number, maxX:Number, Sound:Class, X:Number=0, Y:Number=0)
		{
			super(X, Y);
			_startingX = X;
			_minX = minX;
			_maxX = maxX;
			
			_soundToPlay = Sound;
			
			_minPoint = new FlxPoint(_minX -2, Y);
			_maxPoint = new FlxPoint(_maxX - 2, Y);
			
			loadGraphic(Enemy, true, true, 40, 60, true);
			width = 30;
			height = 55;
			centerOffsets();
			
			var runSpeed:int = 20;
			
			drag.x = runSpeed*2;
			acceleration.y = 0;
			
			health = 2;
			
			_mainState = FlxG.state as MainState;
			
			addAnimation('idle', [0], 60);
			play('idle');
		}
		
		override public function hurt(Damage:Number):void
		{
			//TODO: Play hit sound
			flicker(0.2);
			super.hurt(Damage);
		}
		
		override public function kill():void
		{
			if(!alive)
			{
				return;
			}
			
			FlxG.play(_soundToPlay);
			
			FlxG.score += 1;
			super.kill();
			flicker(0);
		}
		
		override public function update():void
		{	
			super.update();
			
			if(facing == RIGHT)
			{
				this.x -= 1;
				if(this.x <= _minX)
				{
					facing = LEFT;
				}
			}
			else if(facing == LEFT)
			{
				this.x += 1;
				if(this.x >= _maxX)
				{
					facing = RIGHT;
				}
			}
		}
	}
}