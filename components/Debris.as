package beta.components {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class Debris extends ThornedObject
	{		
		public function Debris(world) {
			
			super(world);
			mass = 5;		
			killOffScreen = true;
			thorned = false;
			doesExplode = false;
			
			doAfter(100, kill);
			activate();
			
		
		}
		
	}
}


