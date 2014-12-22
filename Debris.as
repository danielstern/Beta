package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Debris extends ThornedObject
	{		
		public function Debris() {
			super();
			mass = 5;		
			collidable = false;
			killOffScreen = true;
			collidesWith = 'none';
			collisionType = 0;
			thorned = false;
			doesExplode = false;
			
			doAfter(100, kill);
		}
		
	}
}


