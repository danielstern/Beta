package beta.units {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	import beta.components.Gunship;
	
	public class Hero extends Gunship
	{
		public static var NAME = "hero";
		public function Hero() {
			super();
			
			collisionType = "friend";
			collidesWith = "enemy";
	
			health = 25;
			
			constrainToScreen = true;
			minY = 10;
			minX = 10;
			maxX = 590;
			maxY = 490;
			
			name = NAME;
		
		}
	}
}


