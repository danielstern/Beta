package beta.units {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	import beta.components.Gunship;
	
	public class BasicHeroShip extends Hero
	{
		protected var gunCountLevel = 1;
		var gun1;
		var gun2;
		var gun3;
		var gun4;
		var gun5;
		var gun6;
		var gun7;
		
		public function BasicHeroShip(world) {
			super(world);
			
			health = 25;
			damage = 0;		
			
			doesExplode = true;
			explosionParticleCount = 45;
			
			upgradable = true;
			controlledViaOverride = true;
			
			addBoxModelCircleFixture(0.3);
			
		}
	}
}


