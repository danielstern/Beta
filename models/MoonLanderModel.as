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
		public var joints = [];
		
		public function MoonLanderModel(world) 
		{
			_world = world;
			
			//var pod:b2Body = getPod();
			var fuelCompartment:b2Body = getFuelCompartment();

			
			attachPodToChassis(fuelCompartment);			
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
		
		public function attachPodToChassis(fuelCompartment) {
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
			
			joints.push(radarPodJoint);
			
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
			
			joints.push(antennaJoint);
			
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
			
			joints.push(sBandJoint);
			
			
			podBody.SetPosition(new b2Vec2(0, -5));
			
			var podFuelJointDef:b2PrismaticJointDef = new b2PrismaticJointDef();
			podFuelJointDef.Initialize(podBody, fuelCompartment, new b2Vec2(0,0), new b2Vec2(0,0.2));
			podFuelJointDef.enableLimit = true;
			podFuelJointDef.lowerTranslation = 3;
			podFuelJointDef.upperTranslation = 3;
			podFuelJointDef.maxMotorForce = 1;
			podFuelJointDef.motorSpeed = 1;
			podFuelJointDef.enableMotor = true;
			podFuelJointDef.localAnchorA = new b2Vec2(0, 3);
			podFuelJointDef.localAnchorB = new b2Vec2(0, -2);
			var podFuelJoint = _world.CreateJoint(podFuelJointDef);
			joints.push(podFuelJoint);
			
		}
		
		public function bindAtFixedRotation(bodyA, bodyB, localAnchorA, localAnchorB, rotationLower = 0,rotationUpper = 0) {
			var revoluteJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			revoluteJointDef.Initialize(bodyA, bodyB, getZeroVector());
			revoluteJointDef.localAnchorA = localAnchorA;
			revoluteJointDef.localAnchorB = localAnchorB;
			revoluteJointDef.enableLimit = true;
			revoluteJointDef.upperAngle = rotationLower;
			revoluteJointDef.lowerAngle = rotationUpper;
			var revoluteJoint = _world.CreateJoint(revoluteJointDef);
			
			return revoluteJoint;
		}
		
		public function getZeroVector() {
			return new b2Vec2(0, 0);
		}
			
		public function attachLegToChassis(fuelCompartment:b2Body, _mirror = false) {
			var mirror:Number = _mirror ? -1 : 1;
			var ZERO = 0;
			var FORTY_FIVE_DEGREES = -Math.PI / 4 * mirror;
			var SIXTY_SEVEN_DEGREES = -Math.PI / 3 * mirror;
			var NINETY_DEGREES = -Math.PI / 2 * mirror;
			
			var chassisWidth:Number = 4;
			var chassisHeight:Number = 2;
			
			
			var femurLength:Number = 1;
			var tibiaLength:Number = 3;
			var wingLength = 1.5;
			
			
			
			
			var femur:b2Body = createLightSteelRodComponent(femurLength);		
			var wing:b2Body = createLightSteelRodComponent(wingLength);
			var tibia:b2Body = createLightSteelRodComponent(tibiaLength);
			var foot:b2Body = getLandingPad();
						
		
			var shoulderJoint = bindAtFixedRotation(fuelCompartment, femur, new b2Vec2( -chassisWidth * mirror, -chassisHeight), new b2Vec2( femurLength * mirror, ZERO));
			var bodyWingJoint = bindAtFixedRotation(fuelCompartment, wing, new b2Vec2( -chassisWidth * mirror, chassisHeight), new b2Vec2( wingLength * mirror, ZERO), FORTY_FIVE_DEGREES , FORTY_FIVE_DEGREES );
			var elbowJoint = bindAtFixedRotation(femur, tibia, new b2Vec2( -femurLength * mirror, ZERO), new b2Vec2(tibiaLength * mirror, ZERO), NINETY_DEGREES, NINETY_DEGREES);
			var ankleJoint = bindAtFixedRotation(tibia, wing, new b2Vec2( -tibiaLength * mirror, ZERO), new b2Vec2( -wingLength * mirror, ZERO), -FORTY_FIVE_DEGREES , -FORTY_FIVE_DEGREES );
			var heelJoint = bindAtFixedRotation(tibia, foot, new b2Vec2( -tibiaLength * mirror, ZERO), getZeroVector(), NINETY_DEGREES,NINETY_DEGREES);
		
			
		}
		
		public function getLandingPad():b2Body {
			var footBodyDef:b2BodyDef = new b2BodyDef();
			footBodyDef.type = b2Body.b2_dynamicBody;
			var footBody:b2Body = _world.CreateBody(footBodyDef);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			var polygonShape:b2PolygonShape = new b2PolygonShape();
			polygonShape.SetAsBox(1.5, 0.5);
			fixtureDef.shape = polygonShape;
			fixtureDef.restitution = 0.3;
			fixtureDef.friction 1;
			fixtureDef.density = 0.3;
			footBody.CreateFixture(fixtureDef);
			
			return footBody;
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