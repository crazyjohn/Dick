package com.dick.game.handler
{
	import com.dick.framework.event.EventBus;
	import com.dick.framework.event.GameEvent;
	import com.dick.framework.handler.IMessageHandler;
	import com.dick.framework.log.Logger;
	import com.dick.game.msg.CreateRole;
	import com.dick.game.msg.Human;
	import com.dick.game.msg.MessageType;
	import com.dick.game.msg.Role;
	import com.dick.game.msg.SelectRole;
	import com.dick.game.msg.Sync;
	import com.dick.game.service.TCPService;
	
	import flash.utils.ByteArray;

	public class LoginMessageHandler implements IMessageHandler
	{
		/** log */
		private static var log:Logger = new Logger("LoginMessageHandler");
		
		public static function GC_PLAYER_LOGIN_RESULT(succeed:Boolean):void
		{
			log.debug("Login result: " + succeed);
			// get role list
			if (succeed) {
				TCPService.sendCommand(MessageType.CG_GET_ROLE_LIST);
			}
		}
		
		public static function GC_GET_ROLE_LIST(roleList:Array):void
		{
			log.debug("RoleList size: " + roleList.length);
			if (roleList.length == 0) {
				// create role
				var createRole:CreateRole = new CreateRole();
				// TODO: crazyjohn read from model data
				createRole.name = "crazyjohn";
				createRole.templateId= 1001;
				var createData:ByteArray = new ByteArray();
				createRole.writeTo(createData);
				log.debug("Create role: " + createRole.name);
				TCPService.sendPackage(MessageType.CG_CREATE_ROLE, createData);
			} else {
				// select role
				var role:Role = roleList[0];
				var selectRole:SelectRole = new SelectRole();
				selectRole.roleId = role.roleId;
				var selectData:ByteArray = new ByteArray();
				selectRole.writeTo(selectData);
				log.debug("Select role: " + role.roleId);
				TCPService.sendPackage(MessageType.CG_SELECT_ROLE, selectData);
			}
		}
		
		public static function GC_ENTER_SCENE(human:Human):void
		{
			// enter scene
			log.debug("Enter scene ready: " + human.name);
			TCPService.sendCommand(MessageType.CG_ENTER_SCENE_READY);
			EventBus.fireEvent(GameEvent.GC_ENTER_SCENE_READY, [human]);
		}
		
		public static function GC_SYNC(sync:Sync):void
		{
			EventBus.fireEvent(GameEvent.GC_SYNC, [sync]);
		}
	}
}