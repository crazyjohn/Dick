package com.dick.net.msg.response
{
	import com.dick.framework.response.IMessageResponse;
	import com.dick.game.handler.SceneMessageHandler;
	
	import flash.utils.IDataInput;
	
	public class GCSceneMessageResponse implements IMessageResponse
	{
		public function GC_BROADCAST_MOVE(data:IDataInput):void {
			var move:Move = new Move();
			move.mergeFrom(data);
			// handle
			SceneMessageHandler.GC_BROADCAST_MOVE(move);
		}
		
		public function GC_SCENE_OBJECT_APPEAR(data:IDataInput):void {
			var appear:SceneObjectAppear = new SceneObjectAppear();
			appear.mergeFrom(data);
			// handle
			SceneMessageHandler.GC_SCENE_OBJECT_APPEAR(appear);
		}
	}
}