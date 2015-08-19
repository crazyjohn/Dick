package com.dick.game.view.unit
{
	import com.dick.game.constants.HumanActionType;
	import com.dick.game.msg.Human;
	import com.dick.game.msg.MessageType;
	import com.dick.game.resource.EmbedAssets;
	import com.dick.game.service.TCPService;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import feathers.controls.Label;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class HumanSprite extends Sprite
	{
		private var idleAnim:MovieClip = new MovieClip(EmbedAssets.getHumanTextureAtlas(HumanActionType.IDLE).getTextures("daiji"), 18);
		private var useSkillAnim:MovieClip = new MovieClip(EmbedAssets.getHumanTextureAtlas(HumanActionType.USE_SKILL).getTextures("18"), 15);
		private var nameLbl:Label = new Label();
		private var data:Human;
		private var timer:Timer = new Timer(1000 * 10);
		public function HumanSprite(data:Human)
		{
			this.data = data;
			// start timer
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onSynced);
		}
		
		protected function onSynced(event:TimerEvent):void
		{
			TCPService.sendCommand(MessageType.CG_SYNC);
		}
		
		public function idle():void {
			// nameLbl
			nameLbl.text = data.name;
			// remove use skill
			Starling.juggler.remove(this.useSkillAnim);
			this.removeChild(this.useSkillAnim);
			// load human resource
			Starling.juggler.add(idleAnim);
			idleAnim.x = (stage.width - idleAnim.width) / 2;
			idleAnim.y = (stage.height - idleAnim.height) / 2;
			this.addChild(idleAnim);
			nameLbl.x = idleAnim.x + 80;
			nameLbl.y = idleAnim.y + 80;
			this.addChild(nameLbl);
		}
		
		public function useSkill():void {
			// remove idle
			Starling.juggler.remove(this.idleAnim);
			this.removeChild(this.idleAnim);
			this.removeChild(this.nameLbl);
			// add use skill
			Starling.juggler.add(useSkillAnim);
			useSkillAnim.x = (stage.width - useSkillAnim.width) / 2;
			useSkillAnim.y = (stage.height - useSkillAnim.height) / 2;
			this.addChild(useSkillAnim);
			useSkillAnim.addEventListener(Event.COMPLETE, onSkilCompleted);
		}
		
		private function onSkilCompleted(event:Event):void
		{
			// TODO Auto Generated method stub
			trace("Skill completed");
			if (event.target == this.useSkillAnim) {
				idle();
			}
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