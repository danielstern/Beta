package beta
{
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	
	public class EnemyBullet extends Bullet
	{
		public function EnemyBullet() {
			collisionType = 'enemy';
			collidesWith = 'friend';	
			mass = 0.3;
		}
	}
}


