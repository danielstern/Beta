package beta.units.enemies {
	import beta.components.guns.BigGun;
	import beta.components.guns.Gun;
	import beta.components.guns.SmartGun;
	import Box2D.Common.Math.b2Vec2;
	/**
	 * ...
	 * @author daniel
	 */
	public class Boss extends EnemyBasicShootingShip 
	{
		public static var NAME = "boss";
		
		public function Boss(world) 
		{
			super(world);
			thrustForce = 0.05;
			health = 500;
			
			var gun1:Gun = addGun(new SmartGun(world), new b2Vec2( -4, 0));
			gun1.bulletsCollideWith = 'friend';
			var gun2:Gun = addGun(new BigGun(world), new b2Vec2( -3.5, -2));
			gun2.bulletsCollideWith = 'friend';
			
			name = NAME;
			
		}
		
		override protected function createShipFixtures() {
			addBoxModelCircleFixture(1.5, new b2Vec2(0, -1));
			addBoxModelCircleFixture(2.5,new b2Vec2(0,1.5));
		}
		
		protected function spawnMinion() {
			var minion:Enemy = new EnemyRandomThrusterShip(world);
			minion.setBoxModelPosition(getBoxModelPosition());
			minion.activate();
		}
		
		override protected function tick() {
			super.tick();
			if (getBoxModelPosition().x < 15) {
				enemyAIThrustLeft = false;
			}
			
			if (cycle % 4500 === 0) {
				spawnMinion();
			}
		}
		
	}

}