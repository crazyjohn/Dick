package com.dick.game.handler
{
	import com.dick.framework.event.EventBus;
	import com.dick.framework.event.GameEvent;

	public class SceneMessageHandler
	{
		public static function GC_SCENE_OBJECT_APPEAR(appear:SceneObjectAppear):void {
			EventBus.fireEvent(GameEvent.GC_SCENE_OBJECT_APPEAR, [appear]);
		}
		
		public static function GC_BROADCAST_MOVE(move:Move):void
		{
			EventBus.fireEvent(GameEvent.GC_BROADCAST_MOVE, [move]);
		}
	}
}