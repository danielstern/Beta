package beta.components.guns {
	import beta.core.ThornedObject;
	import Box2D.Collision.b2AABB;
	import Box2D.Collision.b2RayCastInput;
	import Box2D.Collision.b2RayCastOutput;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Fixture;
	/**
	 * ...
	 * @author daniel
	 */
	public class SmartGun extends Gun 
	{
		//protected var orientationSmartOffset = orientation;		
		protected var trackTarget = true;
		public function SmartGun(world) 
		{
			super(world);
			cooldownTime = 2000;
		}
		
		override protected function tick() {
			super.tick();	
			//trace("cycle",cycle);
		
			if (cycle % 100 === 0 && trackTarget) {			
				var pos = getGunPosition();
				var rayLength = 50;
				var precision = 100;
				var raysCast = 0;
				var fix:b2Fixture;
				var target = undefined;
				
				while (raysCast++ <= precision) {
					fix = undefined;
					
					var progress = Math.PI * 2 * (raysCast / precision);
					
					var outPointY = Math.cos(progress) * rayLength;
					var outPointX = Math.sin(progress) * rayLength;
					var outPoint = new b2Vec2(outPointX, outPointY);
					
					fix = world.RayCastOne(pos, outPoint);
					
					if (fix) {
						var other:ThornedObject = fix.GetBody().GetUserData().entity;
						if (other.collidesWith === 'enemy') {
							target = other.getBoxModelPosition();
						}
						
					}		
					
				}
				
				if (target) {
					var vector1 = pos;
					var vector2 = target;
					var atan2 = Math.atan2;
					var angle = atan2(vector1.x - vector2.x, vector1.y - vector2.y);
					orientation = angle + Math.PI;
				}
				
				function onRayCastHit(a) {
					trace("ray ray!",a);
				}		
			}
			
		}
		
	}

}