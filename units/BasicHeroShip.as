package beta.units {
	import beta.components.Gun;
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
			
				orientation = Math.PI / 2;
			
			var gun1:Gun = addGun(new b2Vec2(0.5, 0.5));	
			gun1.bulletsCollideWith = 'enemy';
			
			var gun2:Gun = addGun(new b2Vec2(0.5, -0.5));	
			gun2.bulletsCollideWith = 'enemy';
			
			// too f'in sweet
			//var gun3:Gun = addGun(new b2Vec2(0.25, 1));	
			//gun3.bulletsCollideWith = 'enemy';
			//
			//var gun4:Gun = addGun(new b2Vec2(0.25, -1));	
			//gun4.bulletsCollideWith = 'enemy';
			//
			doesExplode = true;
		
			explosionParticleCount = 45;
			
			upgradable = true;
			controlledViaOverride = true;
			
			addBoxModelCircleFixture(0.3);
			
		}
	}
}


