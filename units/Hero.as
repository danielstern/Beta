package beta.units {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	import beta.components.ships.Gunship;
	
	public class Hero extends Gunship
	{
		public static var NAME = "hero";
		public function Hero(world) {
			super(world);
			
			collisionType = "friend";
			collidesWith = "enemy";
	
			constrainToScreenY = true;			
			constrainToScreenX = true;			
			name = NAME;
		
		}
	}
}


