package
{
	import starling.display.Image;
	import starling.display.Sprite;
	import com.dick.game.resource.EmbedAssets;
	
	public class GameEnterScene extends Sprite
	{
		public function GameEnterScene()
		{
			// bg
			initBg();
		}
		
		private function initBg():void
		{
			var bgImg:Image = new Image(EmbedAssets.getTexture("Map"));
			this.addChild(bgImg);
		}
	}
}