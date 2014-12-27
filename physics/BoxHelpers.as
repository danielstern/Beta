package beta.physics 
{
	import Box2D.Collision.b2Bound;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2Fixture;
	/**
	 * ...
	 * @author daniel
	 */
	public class BoxHelpers 
	{
		
		public function BoxHelpers() 
		{
			
		}
		
		public static function 	getFixturesThatFixtureCanSee(fixture,range, precision = 100) {
			var fixtures = [];
			var position = getFixturePosition(fixture);
			var rayLength = range;
			var precision = precision;
			var raysCast = 0;
			
			while (raysCast++ <= precision) {
				
				var progress = Math.PI * 2 * (raysCast / precision);
				var outPointY = Math.cos(progress) * rayLength;
				var outPointX = Math.sin(progress) * rayLength;
				var outPoint = new b2Vec2(outPointX, outPointY);
				var fixture = world.RayCastOne(pos, outPoint); 
				
				if (fixture) {
					fixtures.push(fixture);
					
				}		
				
			}
			
			return fixtures;
		}
		
		public static function getFixturePosition(fixturePosition) {
			var aabb = new b2AABB();
			var shape = fixture.GetShape();
			var body = fixture.GetBody();
			var transform = body.GetTransform()
			ComputeAABB(aabb, transform);
			return aabb.GetCenter();
		}
		
		public static function getAngleToFacePoint(vantage,point) {
			var vector1 = vantage;
			var vector2 = point;
			var atan2 = Math.atan2;
			var angle = atan2(vector1.x - vector2.x, vector1.y - vector2.y);
			return angle;
		}
		
		public static function getPointAtAngleDistance(angle, distance) {
			var x = Math.sin(angle) * distance;
			var y = Math.cos(angle) * distance;
			return new b2Vec2(x,y);
		}
		
		public static function applyForceTowardsPoint(body:b2Body, force, point:b2Vec2) {
			var orientation = BoxHelpers.getAngleToFacePoint(boxModelBody.GetPosition(), point);
			var point = BoxHelpers.getPointAtAngleDistance(orientation, force);
			boxModelBody.applyForce(point);
		}
	}

}