package
{
	import com.dick.framework.event.EventBus;
	import com.dick.framework.event.GameEvent;
	import com.dick.game.data.GameHumanManager;
	import com.dick.game.resource.EmbedAssets;
	import com.dick.game.view.unit.HumanSprite;
	import com.dick.game.view.unit.MonsterSprite;
	
	import flash.utils.Dictionary;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
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
		private var offsetX:int = 130;
		private var offsetY:int = 160;
		private var sceneHumans:Dictionary = new Dictionary();
		
		public function GameEnterScene()
		{
			// bg
			initBg();
			// addEventListener
			EventBus.addEventListener(GameEvent.GC_ENTER_SCENE_READY, onEnterSceneReady);
			EventBus.addEventListener(GameEvent.GC_SCENE_OBJECT_APPEAR, onNewSceneObjectAppear);
			EventBus.addEventListener(GameEvent.GC_BROADCAST_MOVE, onHumanMove);
			// touch
			this.addEventListener(TouchEvent.TOUCH, onSceneTouched);
		}
		
		private function onHumanMove(params:Array):void
		{
			var move:Move = params[0];
			var humanView:HumanSprite = sceneHumans[move.id.toNumber()];
			if (humanView == null) {
				return;
			}
			humanView.moveTo(move.x, move.y);
		}		
		
		
		private function onNewHumanAppear(appear:SceneObjectAppear):void
		{
			var human:Human = appear.human;
			var humanView:HumanSprite = new HumanSprite(human);
			this.addChild(humanView);
			humanView.idle();
			humanView.x = appear.pos.x;
			humanView.y = appear.pos.y;
			sceneHumans[human.guid.toNumber()] = humanView;
		}
		
		private function onNewSceneObjectAppear(params:Array):void
		{
			
			var appear:SceneObjectAppear = params[0];
			// is myself
			if (this.characterView.data.guid == appear.human.guid) {
				return;
			}
			var isNew:Boolean = GameHumanManager.add(appear.human);
			if (isNew) {
				onNewHumanAppear(appear);
			}
		}
		
		private function onEnterSceneReady(params:Array):void
		{
			var human:Human = params[0];
			characterView = new HumanSprite(human);
			this.addChild(characterView);
			
			characterView.x = offsetX;
			characterView.y = offsetY;
			characterView.idle();
			// add event listener
			characterView.addEventListener(TouchEvent.TOUCH, onHumanTouched);
		}
		
		private function onHumanTouched(event:TouchEvent):void
		{
			// 鼠标释放
			if (event.getTouch(this, TouchPhase.ENDED)) {
				characterView.useSkill();
			}
			
		}
		
		
		private function onSceneTouched(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
			if (touch != null) {
				trace("Toched: x = " + touch.globalX + ", y = " + touch.globalY);
				trace("Player: x = " + characterView.x + ", y = " + characterView.y);
				this.characterView.moveTo(touch.globalX - offsetX, touch.globalY - offsetY);
				this.characterView.sendMoveMessage(touch.globalX - offsetX, touch.globalY - offsetY);
			}
		}
		
		private function initBg():void
		{
			var bgImg:Image = new Image(EmbedAssets.getTexture("Map"));
			this.addChild(bgImg);
		}
	}
}