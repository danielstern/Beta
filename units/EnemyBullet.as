package beta.units {
	
	import beta.components.Bullet;

	public class EnemyBullet extends Bullet
	{
		public function EnemyBullet(world) {
			collisionType = 'enemy';
			collidesWith = 'friend';	
			mass = 5;
			damage = 5;
			
			super(world);
		}
	}
}


