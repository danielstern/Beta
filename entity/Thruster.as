package beta.entity 
{
	import beta.core.TimekeepingObject;
	/**
	 * ...
	 * @author daniel
	 */
	public class Thruster extends TimekeepingObject 
	{
		private var _forcePerIntensity:Number = 5;
		private var _intensity:Number = 0;
		private var _startCycle:Number = -1;
		private var _maxIntensity = 5;
		private var _engaged:Boolean = false;
		private var _timeSinceStartedThrusting:Number = -1;
		private var _currentForce:Number = 0;
		private var _timeToIncreaseIntensity:Number;
		
		public function Thruster(forcePerIntensity:Number, maxIntensity:Number, timeToIncreaseIntensity:Number)
		{
			_forcePerIntensity = forcePerIntensity;
			_maxIntensity = maxIntensity;
			_timeToIncreaseIntensity = timeToIncreaseIntensity;
			
		}
		
		public function engage() {
			_engaged = true;
		}
		
		public function disengage() {
			_engaged = false;
		}
		
		override protected function tick() {
			super.tick();
			
			if (_engaged) {
				if (_startCycle === -1) {
					_startCycle = cycle;
				}
				_timeSinceStartedThrusting = cycle - _startCycle;
				
				if (_timeSinceStartedThrusting % _timeToIncreaseIntensity === 0) {
					if (_intensity < _maxIntensity)	{
						_intensity += 1;
					}
				}
				_currentForce = _forcePerIntensity * _intensity;
			} else {
				_startCycle = -1;
				_intensity = 0;
				_currentForce = 0;
			}			
		}
		
		public function getForce():Number {
			return _currentForce;
		}
		
	}

}