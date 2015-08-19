package com.dick.framework.event
{
	import flash.utils.Dictionary;

	public class EventBus
	{
		private static var handlers:Dictionary = new Dictionary();
		
		public static function fireEvent(eventType:String, params:Array):void {
			var handler:Function = handlers[eventType];
			if (handler != null) {
				handler(params);
			} else {
				trace("EventBus: no such handler: " + eventType);
			}
		}
		
		public static function addEventListener(eventType:String, handler:Function):void {
			handlers[eventType] = handler;
		}
		
		public static function removeEventListener(eventType:String):void {
			// TODO: crazyjohn
		}
	}
}