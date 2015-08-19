package com.dick.game.view.unit
{
	import com.dick.game.constants.HumanActionType;
	import com.dick.game.msg.Human;
	import com.dick.game.resource.EmbedAssets;
	
	import feathers.controls.Label;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	public class MonsterSprite extends Sprite
	{
		private var idleAnim:MovieClip = new MovieClip(EmbedAssets.getMonsterTextureAtlas().getTextures("daiji"), 18);
		private var nameLbl:Label = new Label();
		private var data:Human;
		public function MonsterSprite(data:Human)
		{
			this.data = data;
		}
		
		
		public function idle():void {
			// nameLbl
			nameLbl.text = data.name;
			// load human resource
			Starling.juggler.add(idleAnim);
			idleAnim.x = (stage.width - idleAnim.width) / 2;
			idleAnim.y = (stage.height - idleAnim.height) / 2;
			this.addChild(idleAnim);
			nameLbl.x = idleAnim.x + 80;
			nameLbl.y = idleAnim.y + 80;
			this.addChild(nameLbl);
		}
		
		
		public function move():void
		{
			Starling.juggler.tween(this, 2.0, {
				transition: Transitions.EASE_IN_OUT,
				delay: 20, // -> tween.delay = 20
				x: 50 // -> tween.animate("x", 50)
			})
			
		}
	}
}