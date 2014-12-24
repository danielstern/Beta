package beta.units {
	
	import beta.components.Bullet;

	public class EnemyBullet extends Bullet
	{
		public function EnemyBullet() {
			collisionType = 'enemy';
			collidesWith = 'friend';	
			mass = 0.3;
			damage = 5;
		}
	}
}


