package com.dick.game.view.unit
{
	import com.dick.game.msg.Human;
	import com.dick.game.resource.EmbedAssets;
	
	import feathers.controls.Label;
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	public class HumanSprite extends Sprite
	{
		private var data:Human;
		public function HumanSprite(data:Human)
		{
			this.data = data;
		}
		
		public function loadResource():void {
			// nameLbl
			var nameLbl:Label = new Label();
			nameLbl.text = data.name;
			// load human resource
			var humanAnim:MovieClip = new MovieClip(EmbedAssets.getHumanTextureAtlas().getTextures("daiji"), 18);
			Starling.juggler.add(humanAnim);
			humanAnim.x = (stage.width - humanAnim.width) / 2;
			humanAnim.y = (stage.height - humanAnim.height) / 2;
			this.addChild(humanAnim);
			nameLbl.x = humanAnim.x + 80;
			nameLbl.y = humanAnim.y + 80;
			this.addChild(nameLbl);
		}
	}
}