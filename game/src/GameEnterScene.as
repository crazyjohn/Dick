package
{
	import com.dick.framework.event.EventBus;
	import com.dick.framework.event.GameEvent;
	import com.dick.game.data.GameHumanManager;
	import com.dick.game.msg.Human;
	import com.dick.game.msg.Sync;
	import com.dick.game.resource.EmbedAssets;
	import com.dick.game.view.unit.HumanSprite;
	import com.dick.game.view.unit.MonsterSprite;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * The first scene;
	 * 
	 * @author crazyjohn;
	 */
	public class GameEnterScene extends Sprite
	{
		private var characterView:HumanSprite;
		
		public function GameEnterScene()
		{
			// bg
			initBg();
			// addEventListener
			EventBus.addEventListener(GameEvent.GC_ENTER_SCENE_READY, onEnterSceneReady);
			EventBus.addEventListener(GameEvent.GC_SYNC, onSync);
			EventBus.addEventListener(GameEvent.GC_APPEAR_NEW_HUMAN, onNewHumanAppear);
			
		}
		
		private function onNewHumanAppear(params:Array):void
		{
			var human:Human = params[0];
			var humanView:MonsterSprite = new MonsterSprite(human);
			this.addChild(humanView);
			humanView.idle();
			var x:int = Math.random() * 300 + this.characterView.x;
			var y:int = Math.random() * 300 + this.characterView.y;
			trace("New human appear: " + human.name + ", x: " + x + ", y: " + y);
			humanView.x = x;
			humanView.y = y;
		}
		
		private function onSync(params:Array):void
		{
			// TODO Auto Generated method stub
			var sync:Sync = params[0];
			trace("Sync size: " + sync.humans.length);
			GameHumanManager.addAll(sync.humans);
		}
		
		private function onEnterSceneReady(params:Array):void
		{
			var human:Human = params[0];
			characterView = new HumanSprite(human);
			this.addChild(characterView);
			characterView.idle();
			// add event listener
			characterView.addEventListener(TouchEvent.TOUCH, onTouched);
		}
		
		private function onTouched(event:TouchEvent):void
		{
			// 鼠标释放
			if (event.getTouch(this, TouchPhase.ENDED)) {
				characterView.useSkill();
			}
			
		}
		
		private function initBg():void
		{
			var bgImg:Image = new Image(EmbedAssets.getTexture("Map"));
			this.addChild(bgImg);
		}
	}
}