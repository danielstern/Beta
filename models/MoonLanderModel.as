package beta.models 
{
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	
	import Box2D.Collision.b2AABB;
	import Box2D.Collision.b2Bound;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.Joints.b2Joint;
	import Box2D.Dynamics.Joints.b2LineJoint;
	import Box2D.Dynamics.Joints.b2LineJointDef;
	import Box2D.Dynamics.Joints.b2PrismaticJoint;
	import Box2D.Dynamics.Joints.b2PrismaticJointDef;
	import Box2D.Dynamics.Joints.b2RevoluteJointDef;
	import flash.display.MovieClip;
	import flash.sampler.NewObjectSample;
	import flash.utils.setInterval;
	
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2EdgeShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	/**
	 * ...
	 * @author daniel
	 */
	public class MoonLanderModel 
	{
		private var _world:b2World;
		public var chassis:b2Body;
		
		public function MoonLanderModel(world) 
		{
			_world = world;
			
			var pod:b2Body = getPod();
			var fuelCompartment:b2Body = getFuelCompartment();

			pod.SetPosition(new b2Vec2(0, -5));
			
			var podFuelJointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			podFuelJointDef.Initialize(pod, fuelCompartment, new b2Vec2(0,0), new b2Vec2(0,0.2));
			podFuelJointDef.enableLimit = true;
			//podFuelJointDef.
			podFuelJointDef.lowerTranslation = 3;
			podFuelJointDef.upperTranslation = 3;
			podFuelJointDef.maxMotorForce = 1;
			podFuelJointDef.motorSpeed = 1;
			podFuelJointDef.enableMotor = true;
			podFuelJointDef.localAnchorA = new b2Vec2(0, 3);
			podFuelJointDef.localAnchorB = new b2Vec2(0, -2);
			var podFuelJoint = _world.CreateJoint(podFuelJointDef);
			
			attachLegToChassis(fuelCompartment);
			attachLegToChassis(fuelCompartment, true);
			
			chassis = fuelCompartment;
		}
		
		public function createLightSteelCircularComponent(radius) {
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			var body:b2Body = _world.CreateBody(bodyDef);
			var bodyFixture = getLightSteelCircleFixtureDefinition(radius);
			body.CreateFixture(bodyFixture);
			
			return body;
			
		}
		
		public function createLightSteelRodComponent(length ) {
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			var body:b2Body = _world.CreateBody(bodyDef);
			var bodyFixture = getLightSteelRodFixtureDefinition(length);
			body.CreateFixture(bodyFixture);
			
			return body;
			
		}
		
		public function getPod() {
			var podBody = createLightSteelCircularComponent(3);
			podBody.SetPosition(new b2Vec2(0, 0));
			
			var radar = createLightSteelCircularComponent(0.8);
			radar.SetPosition(new b2Vec2(0, -4));
			var radarPodJointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			
			var antenna = createLightSteelCircularComponent(0.6);
			antenna.SetPosition(new b2Vec2(2, -2));
			var antennaJointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			
						
			var sBand = createLightSteelCircularComponent(0.9);
			sBand.SetPosition(new b2Vec2(-3, -0.5));
			var sBandJointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			
			radarPodJointDef.Initialize(podBody, radar, new b2Vec2(0,0), new b2Vec2(0,0.7));
			radarPodJointDef.collideConnected = false;
			radarPodJointDef.enableLimit = true;
			radarPodJointDef.lowerTranslation = 1;
			radarPodJointDef.upperTranslation = 1;
			radarPodJointDef.maxMotorForce = 1;
			radarPodJointDef.motorSpeed = 10;
			radarPodJointDef.enableMotor = true;;
			radarPodJointDef.localAnchorA = new b2Vec2(0, -1);
			var radarPodJoint = _world.CreateJoint(radarPodJointDef);
			
			antennaJointDef.Initialize(podBody, antenna, new b2Vec2(0,0), new b2Vec2(0.7,0.7));
			antennaJointDef.collideConnected = false;
			antennaJointDef.enableLimit = true;
			antennaJointDef.lowerTranslation = 1;
			antennaJointDef.upperTranslation = 1;
			antennaJointDef.maxMotorForce = 1;
			antennaJointDef.motorSpeed = 10;
			antennaJointDef.enableMotor = true;;
			antennaJointDef.localAnchorA = new b2Vec2(0, -1);
			var antennaJoint = _world.CreateJoint(antennaJointDef);
			
			sBandJointDef.Initialize(podBody, sBand, new b2Vec2(0,0), new b2Vec2(0.7,0));
			sBandJointDef.collideConnected = false;
			sBandJointDef.enableLimit = true;
			sBandJointDef.lowerTranslation = 1;
			sBandJointDef.upperTranslation = 1;
			sBandJointDef.maxMotorForce = 1;
			sBandJointDef.motorSpeed = 10;
			sBandJointDef.enableMotor = true;;
			sBandJointDef.localAnchorA = new b2Vec2(0, -1);
			var sBandJoint = _world.CreateJoint(sBandJointDef);
			//radarPodJoint.SetLimits(1, 1);
			
			return podBody;
		}
		
			
		public function attachLegToChassis(fuelCompartment:b2Body, _mirror = false) {
			var femurLength = 2;
			var tibiaLength = 4;
			var mirror = _mirror ? -1 : 1;
			var innerWingLength = 2;
			var outerWingLength = 2;
			var leftFemur:b2Body = createLightSteelRodComponent(femurLength);		
			leftFemur.SetPosition(new b2Vec2(-1 * mirror, -1));
			var leftInnerWing:b2Body = createLightSteelRodComponent(innerWingLength);
			var leftTibia:b2Body = createLightSteelRodComponent(tibiaLength);
			var leftOuterWing:b2Body = createLightSteelRodComponent(outerWingLength);
			
			var shoulderJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			shoulderJointDef.Initialize(fuelCompartment, leftFemur, new b2Vec2(0, 0));
			shoulderJointDef.localAnchorA = new b2Vec2( -4*mirror, -2);
			shoulderJointDef.localAnchorB = new b2Vec2( femurLength * mirror, 0);
			shoulderJointDef.enableLimit = true;
			shoulderJointDef.upperAngle = -Math.PI / 4 * mirror;
			shoulderJointDef.lowerAngle = -Math.PI / 4 * mirror;
			var shoulderJoint = _world.CreateJoint(shoulderJointDef);
			
			var fuelCompartmentLeftLowerWingJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			fuelCompartmentLeftLowerWingJointDef.Initialize(fuelCompartment, leftInnerWing, new b2Vec2(0, 0));
			fuelCompartmentLeftLowerWingJointDef.localAnchorA = new b2Vec2( -4 * mirror, 2);
			fuelCompartmentLeftLowerWingJointDef.enableLimit = true;
			fuelCompartmentLeftLowerWingJointDef.upperAngle = -Math.PI / 4 * mirror;
			fuelCompartmentLeftLowerWingJointDef.lowerAngle = -Math.PI / 4 * mirror;
			fuelCompartmentLeftLowerWingJointDef.localAnchorB = new b2Vec2( innerWingLength*mirror, 0);
			var fuelCompartmentLeftLowerWingJoint = _world.CreateJoint(fuelCompartmentLeftLowerWingJointDef);
			
			var leftElbowJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			leftElbowJointDef.Initialize(leftFemur, leftTibia, new b2Vec2(0, 0));
			leftElbowJointDef.localAnchorA = new b2Vec2(-femurLength*mirror, 0);
			leftElbowJointDef.localAnchorB = new b2Vec2(tibiaLength * mirror, 0);
			leftElbowJointDef.enableLimit = true;
			leftElbowJointDef.lowerAngle = -Math.PI / 4 * mirror;
			leftElbowJointDef.upperAngle = -Math.PI / 4 * mirror;
			var leftElbowJoint = _world.CreateJoint(leftElbowJointDef);
			
			var leftInnerWingOuterWingJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			leftInnerWingOuterWingJointDef.Initialize(leftInnerWing, leftOuterWing, new b2Vec2(0, 0));
			leftInnerWingOuterWingJointDef.localAnchorA = new b2Vec2( -innerWingLength * mirror, 0);
			leftInnerWingOuterWingJointDef.enableLimit = true;
			leftInnerWingOuterWingJointDef.upperAngle = -Math.PI / 4 * mirror;
			leftInnerWingOuterWingJointDef.lowerAngle = -Math.PI / 4 * mirror;
			leftInnerWingOuterWingJointDef.localAnchorB = new b2Vec2(outerWingLength*mirror, 0);
			var leftInnerWingOuterWingJoint = _world.CreateJoint(leftInnerWingOuterWingJointDef);
			
			var leftTibiaOuterWingJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			leftTibiaOuterWingJointDef.Initialize(leftTibia, leftOuterWing, new b2Vec2(0, 0));
			leftTibiaOuterWingJointDef.localAnchorA = new b2Vec2(-tibiaLength*mirror, 0);
			leftTibiaOuterWingJointDef.localAnchorB = new b2Vec2(-outerWingLength*mirror, 0);
			var leftTibiaOuterWingJoint = _world.CreateJoint(leftTibiaOuterWingJointDef);
			
			
			var leftLowerWingKneeJointDef:b2LineJointDef = new b2LineJointDef();
			leftLowerWingKneeJointDef.Initialize(leftInnerWing, leftFemur, new b2Vec2(-innerWingLength*mirror, 0), new b2Vec2( 0,0));
			leftLowerWingKneeJointDef.localAnchorA = new b2Vec2(-innerWingLength*mirror,0);
			leftLowerWingKneeJointDef.localAnchorB = new b2Vec2(-femurLength*mirror,0);
			var leftLowerWingKneeJoint = _world.CreateJoint(leftLowerWingKneeJointDef);
			
			var footBodyDef:b2BodyDef = new b2BodyDef();
			footBodyDef.type = b2Body.b2_dynamicBody;
			var footBody:b2Body = _world.CreateBody(footBodyDef);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			var polygonShape:b2PolygonShape = new b2PolygonShape();
			polygonShape.SetAsBox(2, 1);
			fixtureDef.shape = polygonShape;
			fixtureDef.restitution = 0.3;
			fixtureDef.friction 1;
			fixtureDef.density = 0.3;
			footBody.CreateFixture(fixtureDef);
			footBody.SetPosition( new b2Vec2(-5*mirror, 5));
			
			var leftTibiaFootJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			leftTibiaFootJointDef.Initialize(leftTibia, footBody, new b2Vec2(0, 0));
			leftTibiaFootJointDef.localAnchorA = new b2Vec2( -tibiaLength * mirror, 0);
			leftTibiaFootJointDef.enableLimit = true;
			leftTibiaFootJointDef.lowerAngle = Math.PI / 2;
			leftTibiaFootJointDef.upperAngle = Math.PI / 2;
			leftTibiaFootJointDef.localAnchorB = new b2Vec2(0, 0);
			var leftTibiaFootJoint = _world.CreateJoint(leftTibiaFootJointDef);
			
			
		
			
		}
		
		
		public function getLightSteelCircleFixtureDefinition(radius:Number) {
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = 0.05;
			fixtureDef.restitution = 0.2;
			fixtureDef.friction = 0.1;
			fixtureDef.filter.categoryBits = 0x0001;
			fixtureDef.filter.maskBits = 0x0010;
			fixtureDef.shape = new b2CircleShape(radius);
			return fixtureDef;	
		}
		
				
		public function getLightSteelRodFixtureDefinition(length:Number) {
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = 0.05;
			fixtureDef.restitution = 0.2;
			fixtureDef.friction = 0.1;
			fixtureDef.filter.categoryBits = 0x0001;
			fixtureDef.filter.maskBits = 0x0010;
			var polygon:b2PolygonShape = new b2PolygonShape();
			polygon.SetAsBox(length, 0.5);
			fixtureDef.shape = polygon;
			return fixtureDef;	
		}
		
		public function getFuelCompartment() {
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.linearDamping = 0;
			
			//bodyDef.position = new b2Vec2(10, 5);
			var body:b2Body = _world.CreateBody(bodyDef);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			var polygonShape:b2PolygonShape = new b2PolygonShape();
			polygonShape.SetAsBox(4, 2);
			fixtureDef.shape = polygonShape;
			fixtureDef.restitution = 0.1;
			fixtureDef.friction 0.2;
			fixtureDef.density = 0.1;
			body.CreateFixture(fixtureDef);
			
			return body;
		}
		
	}

}