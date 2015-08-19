package
{
	import com.dick.framework.event.EventBus;
	import com.dick.framework.event.GameEvent;
	import com.dick.game.msg.Human;
	import com.dick.game.msg.Sync;
	import com.dick.game.resource.EmbedAssets;
	import com.dick.game.view.unit.HumanSprite;
	
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
		private var humanView:HumanSprite;
		public function GameEnterScene()
		{
			// bg
			initBg();
			// addEventListener
			EventBus.addEventListener(GameEvent.CG_ENTER_SCENE_READY, onEnterSceneReady);
			EventBus.addEventListener(GameEvent.GC_SYNC, onSync);
		}
		
		private function onSync(params:Array):void
		{
			// TODO Auto Generated method stub
			var sync:Sync = params[0];
			trace("Sync size: " + sync.humans.length);
		}
		
		private function onEnterSceneReady(params:Array):void
		{
			var human:Human = params[0];
			humanView = new HumanSprite(human);
			this.addChild(humanView);
			humanView.idle();
			// add event listener
			humanView.addEventListener(TouchEvent.TOUCH, onTouched);
		}
		
		private function onTouched(event:TouchEvent):void
		{
			// 鼠标释放
			if (event.getTouch(this, TouchPhase.ENDED)) {
				humanView.useSkill();
			}
			
		}
		
		private function initBg():void
		{
			var bgImg:Image = new Image(EmbedAssets.getTexture("Map"));
			this.addChild(bgImg);
		}
	}
}