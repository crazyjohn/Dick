package com.dick.game.view.unit
{
	import com.dick.game.resource.EmbedAssets;
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	/**
	 * The monster sprite;
	 * 
	 * @autor crazyjohn;
	 */
	public class MonsterSprite extends Sprite
	{
		private var idleAnim:MovieClip = new MovieClip(EmbedAssets.getMonsterTextureAtlas().getTextures("daiji"), 18);
		// private var nameLbl:Label = new Label();
		private var data:Human;
		public function MonsterSprite(data:Human)
		{
			this.data = data;
		}
		
		
		public function idle():void {
			// nameLbl
			//nameLbl.text = data.name;
			// load human resource
			Starling.juggler.add(idleAnim);
			// flip the object
			this.scaleX = -1;
			this.addChild(idleAnim);
			//nameLbl.x = idleAnim.x + 80;
			//nameLbl.y = idleAnim.y + 80;
			//this.addChild(nameLbl);
		}
		
		
	}
}