package beta
{
	import flash.display.*;
	import beta.core.*;
	
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
			killOffScreen = false;
			
		}
	}
}


