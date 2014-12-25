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
		
		protected var gun1:Gun;
		protected var gun2:Gun;
		protected var gun3:Gun;
		
		public function BasicHeroShip(world) {
			super(world);
			
			health = 25;
			damage = 100;	
			
			orientation = Math.PI / 2;
			
			gun1 = addGun(new b2Vec2(0.5, 0));	
			gun1.bulletsCollideWith = 'enemy';
			
			gun2 = addGun(new b2Vec2(0.5, 0.5));	
			gun2.bulletsCollideWith = 'enemy';
			
			gun3 = addGun(new b2Vec2(0.5, -0.5));	
			gun3.bulletsCollideWith = 'enemy';
			
			
			
			doesExplode = true;
		
			explosionParticleCount = 10;
			
			upgradable = true;
			controlledViaOverride = true;
			
			addBoxModelCircleFixture(0.3);
			
		}
		
		override protected function gunsStartFiring() {
			switch (gunCountLevel + upgradeGunCountLevel) {
				case 1:
					gun1.startFiring();
					break;
				case 2:
					gun2.startFiring();
					gun3.startFiring();
					break;
				default:
					super.gunsStartFiring();
			}
		}
	}
}


