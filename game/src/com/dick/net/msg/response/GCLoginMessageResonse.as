package com.dick.net.msg.response
{
	import com.dick.net.msg.EnterScene;
	import com.dick.net.msg.LoginResult;
	import com.dick.net.msg.RoleList;
	import com.dick.net.msg.handler.IMessageHandler;
	import com.dick.net.msg.handler.LoginMessageHandler;
	
	import flash.utils.IDataInput;

	public class GCLoginMessageResonse implements IMessageHandler
	{
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