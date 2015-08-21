package com.dick.net.msg.response
{
	import com.dick.framework.response.IMessageResponse;
	import com.dick.game.handler.LoginMessageHandler;
	import com.dick.game.msg.EnterScene;
	import com.dick.game.msg.LoginResult;
	import com.dick.game.msg.RoleList;
	import com.dick.game.msg.Sync;
	
	import flash.utils.IDataInput;

	public class GCLoginMessageResonse implements IMessageResponse
	{
		
		public function GC_SYNC(data:IDataInput):void {
			var sync:Sync = new Sync();
			sync.mergeFrom(data);
			// handle
			LoginMessageHandler.GC_SYNC(sync);
		}
		
		
		public function GC_ENTER_SCENE(data:IDataInput):void {
			var enterScene:EnterScene = new EnterScene();
			enterScene.mergeFrom(data);
			// handle
			LoginMessageHandler.GC_ENTER_SCENE(enterScene.human);
		}
		
		
		public function GC_GET_ROLE_LIST(data:IDataInput):void {
			var list:RoleList = new RoleList();
			list.mergeFrom(data);
			// handle
			LoginMessageHandler.GC_GET_ROLE_LIST(list.roleList);
		}
		
		public function GC_PLAYER_LOGIN_RESULT(data:IDataInput):void {
			var result:LoginResult = new LoginResult();
			result.mergeFrom(data);
			// handle
			LoginMessageHandler.GC_PLAYER_LOGIN_RESULT(result.succeed);
		}
	}
}