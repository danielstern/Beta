package beta.units {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	import beta.components.Gunship;
	import Box2D.Common.Math.b2Vec2;
	
	public class BasicHeroShip extends Hero
	{
		protected var gunCountLevel = 1;
		
		public function BasicHeroShip(world) {
			super(world);
			
			health = 25;
			damage = 0;	
			
			addGun(new b2Vec2(0.5, 0.5));
			addGun(new b2Vec2(0.5, -0.5));		
			
			doesExplode = true;
			explosionParticleCount = 45;
			
			upgradable = true;
			controlledViaOverride = true;
			
			addBoxModelCircleFixture(0.3);
			
		}
	}
}


