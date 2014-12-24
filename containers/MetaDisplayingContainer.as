package beta.containers
{
	import flash.display.MovieClip;
	public class MetaDisplayingContainer extends BasicContainer
	{
		import beta.events.DamageEvent;
		import beta.events.HealingEvent;
		import beta.units.Hero;
		import flash.utils.setTimeout;
	
		public function MetaDisplayingContainer() {
			addEventListener('damage', function handleDamage(e:DamageEvent) {
				if (e.damageDealt > 0) {				
					
					var display = new FlashMetaInfoDisplay();
					addChild(display);
					
					display.x = e.origin.x;
					display.y = e.origin.y
					display.display.text = e.damageDealt;
					
					if (e.origin.name === Hero.NAME) {
						display.turnRed();
					};
					
					setTimeout(function() {
						removeChild(display);
					},200);
				}
			});
			
			addEventListener('heal', function (e:HealingEvent) {			
					
					var display = new FlashMetaInfoDisplay();
					addChild(display);
					
					display.x = e.origin.x;
					display.y = e.origin.y;
					display.display.text = e.recoveryAmount;
					
					display.turnWhite();
					
					setTimeout(function() {
						removeChild(display);
					},200);
					
			});
			
		}		
	}
}


