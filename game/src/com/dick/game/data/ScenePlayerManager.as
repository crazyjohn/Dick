package com.dick.game.data
{
	import com.dick.framework.event.EventBus;
	import com.dick.framework.event.GameEvent;
	import com.dick.game.msg.Human;
	import com.netease.protobuf.Int64;
	
	import flash.utils.Dictionary;

	public class ScenePlayerManager
	{
		private static var humans:Dictionary = new Dictionary();
		
		public static function getHuman(humanId:Int64):Human {
			return humans[humanId];
		}
		
		public static function add(human:Human):void {
			humans[human.guid.toNumber()] = human;
		}
		
		public static function addAll(allHumans:Array):void {
			for each (var human:Human in allHumans) {
				if (humans[human.name] == null) {
					EventBus.fireEvent(GameEvent.GC_APPEAR_NEW_HUMAN, [human]);
				}
				humans[human.name] = human;
			}
		}
	}
}