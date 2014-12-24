package beta.units {
	import flash.display.*;
	import flash.events.Event;
	import beta.core.*;
	import beta.components.Bullet;
	
	public class ShipBullet extends Bullet
	{
		public function ShipBullet(world) {
			collisionType = 'friend';
			collidesWith = 'enemy';	
			super(world);
		}
		
		override protected function tick() {
			super.tick();
			//trace(parent.width, this.x);
		}
	}
}


