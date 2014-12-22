package beta
{
	import flash.display.*;
	import flash.events.Event;
	
	public class Asteroid extends ThornedObject
	{
		public function Asteroid() {
			super();
			
			collisionType = 'enemy';
			collidesWith = 'friend';
			
			health = 10;
			damage = 4;
			mass = 40;
			
			applyForceX(-1000);
			stabilizersOff();
			killOffScreen = false;
			
		}
	}
}


