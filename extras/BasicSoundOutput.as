package beta.extras 
{
	import beta.containers.BasicContainer;
	import treefortress.sound.*;
	
		import beta.components.Bullet;
	import beta.core.ControllableObject;
	import beta.core.DestructibleObject;
	import beta.core.ActivatableObject;
	import beta.components.Gun;
	import beta.core.UpgradableObject;
	import beta.extras.BasicSoundOutput;

	import beta.powerups.BasicGunCountPowerup;
	import beta.powerups.BasicHealthPowerup;
	import beta.units.Mine;
	import beta.units.BasicHeroShip;
	import beta.units.Asteroid;
	import beta.units.Hero;
	import beta.units.EnemyGun;
	import beta.units.Enemy;
	import beta.units.EnemyCurvyThrusterShip;
	import beta.units.EnemyBasicThrusterShip;
	import beta.units.EnemyBasicAttackingShip;
	import beta.units.EnemyForkedAttackingShip;
	import beta.powerups.Powerup;
	
	public class BasicSoundOutput 
	{
		protected var soundMap = { };
		
		public function BasicSoundOutput(gameContainer:BasicContainer) 
		{
				//SOUND
			gameContainer.addEventListener('audio', handleSound);
			SoundAS.loadSound('sounds/nes-00-02.mp3', '01');
			SoundAS.loadSound('sounds/nes-06-04.mp3', '02');
			SoundAS.loadSound('sounds/nes-12-06.mp3', '03');
			SoundAS.loadSound('sounds/nes-11-03.mp3', '04');
			SoundAS.loadSound('sounds/nes-13-02.mp3', '05');
			SoundAS.loadSound('sounds/nes-04-08.mp3', '06');
			SoundAS.loadSound('sounds/nes-08-05.mp3', '07');
			SoundAS.loadSound('sounds/nes-07-12.mp3', '08');
			SoundAS.loadSound('sounds/nes-07-10.mp3', '09');
			SoundAS.loadSound('sounds/nes-07-10.mp3', '10');
			SoundAS.loadSound('sounds/nes-04-02.mp3', '11');
			SoundAS.loadSound('sounds/nes-08-01.mp3', '12');
			SoundAS.loadSound('sounds/nes-10-08.mp3', '13');
			SoundAS.loadSound('sounds/nes-01-09.mp3', '14');
			SoundAS.loadSound('sounds/nes-03-02.mp3', '15');
			SoundAS.loadSound('sounds/nes-06-11.mp3', '16');
			SoundAS.loadSound('sounds/nes-04-06.mp3', '17');
			SoundAS.loadSound('sounds/nes-10-02.mp3', '18');
			SoundAS.loadSound('sounds/nes-11-03.mp3', '19');
			
			
			soundMap[Gun.NAME + ":" + Gun.SHOOT] = "03";
			soundMap[EnemyGun.NAME + ":" + Gun.SHOOT] = "05";
			soundMap[Hero.NAME + ":" + DestructibleObject.TAKE_DAMAGE] = "02";
			soundMap[Hero.NAME + ":" + DestructibleObject.DESTROYED] = "10";
			soundMap[Enemy.NAME + ":" + DestructibleObject.TAKE_DAMAGE] = "09";
			soundMap[Enemy.NAME + ":" + DestructibleObject.DESTROYED] = "06";
			soundMap[Mine.NAME + ":" + DestructibleObject.TAKE_DAMAGE] = "04";
			soundMap[Mine.NAME + ":" + DestructibleObject.DESTROYED] = "07";
			soundMap[Asteroid.NAME + ":" + DestructibleObject.TAKE_DAMAGE] = "08";
			soundMap[Asteroid.NAME + ":" + DestructibleObject.DESTROYED] = "01";
			soundMap[Bullet.NAME + ":" + DestructibleObject.DESTROYED] = "11";
			soundMap[Bullet.NAME + ":" + DestructibleObject.TAKE_DAMAGE] = "13";
			soundMap[Powerup.NAME + ":" + DestructibleObject.TAKE_DAMAGE] = "17";
			soundMap[Powerup.NAME + ":" + DestructibleObject.DESTROYED] = "19";
			soundMap[Powerup.NAME + ":" + Powerup.FULFILL] = "18";
			soundMap[Hero.NAME + ":" + UpgradableObject.UPGRADED] = "16";
			
			
			
		}
		
		protected function handleSound(e) {
			if (soundMap[e.origin]) {
				SoundAS.play(soundMap[e.origin], 0.3, 0, 0, false, true);;
			} else {
				trace("No sound supported for:" , e.origin);
			}
		}
		
	}

}