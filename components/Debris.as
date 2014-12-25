package beta.components {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Debris extends ThornedObject
	{		
		public function Debris(world) {
			
			super(world);
			
			thorned = false;
			doesExplode = false;
			
			collidable = false;
			
			addBoxModelCircleFixture(0.05);
			
			doAfter(100, kill);
			activate();
			
		
		}
		
	}
}


