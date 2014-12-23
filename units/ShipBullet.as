package beta.units {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	import beta.components.Bullet;
	
	public class ShipBullet extends Bullet
	{
		public function ShipBullet() {
			collisionType = 'friend';
			collidesWith = 'enemy';	
		}
	}
}


