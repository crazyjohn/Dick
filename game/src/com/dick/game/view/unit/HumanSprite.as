package com.dick.game.view.unit
{
	import com.dick.game.constants.HumanActionType;
	import com.dick.game.msg.Human;
	import com.dick.game.msg.MessageType;
	import com.dick.game.msg.Move;
	import com.dick.game.msg.SceneObjectType;
	import com.dick.game.net.session.IoSession;
	import com.dick.game.resource.EmbedAssets;
	
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import feathers.controls.Label;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * The human sprite;
	 * 
	 * @author crazyjohn;
	 */
	public class HumanSprite extends Sprite
	{
		private var idleAnim:MovieClip = new MovieClip(EmbedAssets.getHumanTextureAtlas(HumanActionType.IDLE).getTextures("daiji"), 18);
		private var useSkillAnim:MovieClip = new MovieClip(EmbedAssets.getHumanTextureAtlas(HumanActionType.USE_SKILL).getTextures("18"), 15);
		private var nameLbl:Label = new Label();
		private var data:Human;
		private var timer:Timer = new Timer(1000 * 5);
		public function HumanSprite(data:Human)
		{
			this.data = data;
			// start timer
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onSynced);
		}
		
		protected function onSynced(event:TimerEvent):void
		{
			IoSession.sendCommand(MessageType.CG_SYNC);
		}
		
		public function idle():void {
			// nameLbl
			nameLbl.text = data.name;
			// remove use skill
			Starling.juggler.remove(this.useSkillAnim);
			this.removeChild(this.useSkillAnim);
			// load human resource
			Starling.juggler.add(idleAnim);
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
			this.addChild(useSkillAnim);
			useSkillAnim.addEventListener(Event.COMPLETE, onSkilCompleted);
		}
		
		private function onSkilCompleted(event:Event):void
		{
			if (event.target == this.useSkillAnim) {
				idle();
			}
		}
		private var speed:int = 100;
		private var faceToFront:Boolean = true;
		public function moveTo(toX:int, toY:int):void
		{
			var xCostTime:int = Math.abs(this.x - toX) / speed;
			var yCostTime:int = Math.abs(this.y - toY) / speed;
			var costTime:int = Math.max(xCostTime, yCostTime);
			Starling.juggler.tween(this, costTime, {
				transition: Transitions.EASE_OUT,
				delay: 0.1, // -> tween.delay = 20
				x: toX, // -> tween.animate("x", 50)
				y: toY
			});
			// send msg
			var move:Move = new Move();
			var moveData:ByteArray = new ByteArray();
			move.id = this.data.guid;
			move.objectType = SceneObjectType.HUMAN;
			// FIXME: crazyjohn mock data
			move.sceneId = 1;
			move.x = toX;
			move.y = toY;
			move.writeTo(moveData);
			IoSession.sendPackage(MessageType.CG_REQUEST_MOVE, moveData);
		}
	}
}