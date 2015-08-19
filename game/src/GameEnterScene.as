package
{
	import com.dick.framework.event.EventBus;
	import com.dick.framework.event.GameEvent;
	import com.dick.game.msg.Human;
	import com.dick.game.resource.EmbedAssets;
	import com.dick.game.view.unit.HumanSprite;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**
	 * The first scene;
	 * 
	 * @author crazyjohn;
	 */
	public class GameEnterScene extends Sprite
	{
		public function GameEnterScene()
		{
			// bg
			initBg();
			// addEventListener
			EventBus.addEventListener(GameEvent.CG_ENTER_SCENE_READY, onEnterSceneReady);
		}
		
		private function onEnterSceneReady(params:Array):void
		{
			var human:Human = params[0];
			var humanView:HumanSprite = new HumanSprite(human);
			this.addChild(humanView);
			humanView.loadResource();
		}
		
		private function initBg():void
		{
			var bgImg:Image = new Image(EmbedAssets.getTexture("Map"));
			this.addChild(bgImg);
		}
	}
}