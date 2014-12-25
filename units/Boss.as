package beta.units 
{
	import beta.components.BigGun;
	import beta.components.Gun;
	import Box2D.Common.Math.b2Vec2;
	/**
	 * ...
	 * @author daniel
	 */
	public class Boss extends EnemyBasicShootingShip 
	{
		
		public function Boss(world) 
		{
			super(world);
			thrustForce = 0.05;
			health = 1000;
			
			var gun1:Gun = addGun(new Gun(world), new b2Vec2( -4, 0));
			gun1.bulletsCollideWith = 'friend';
			var gun2:Gun = addGun(new BigGun(world), new b2Vec2( -3.5, -2));
			gun2.bulletsCollideWith = 'friend';
			
		}
		
		override protected function createShipFixtures() {
			addBoxModelCircleFixture(3.5);
		}
		
		override protected function tick() {
			super.tick();
			if (getBoxModelPosition().x < 15) {
				enemyAIThrustLeft = false;
			}
		}
		
	}

}