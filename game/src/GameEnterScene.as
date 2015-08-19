package
{
	import com.dick.framework.event.EventBus;
	import com.dick.framework.event.GameEvent;
	import com.dick.game.resource.EmbedAssets;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
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
			// load human resource
			var humanAnim:MovieClip = new MovieClip(EmbedAssets.getHumanTextureAtlas().getTextures("daiji"), 18);
			Starling.juggler.add(humanAnim);
			this.addChild(humanAnim);
		}
		
		private function initBg():void
		{
			var bgImg:Image = new Image(EmbedAssets.getTexture("Map"));
			this.addChild(bgImg);
		}
	}
}