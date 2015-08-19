package com.dick.net.msg.handler
{
	import com.dick.net.msg.CreateRole;
	import com.dick.net.msg.Human;
	import com.dick.net.msg.MessageType;
	import com.dick.net.msg.Role;
	import com.dick.net.msg.SelectRole;
	import com.dick.net.session.TCPService;
	
	import flash.utils.ByteArray;

	public class LoginMessageHandler implements IMessageHandler
	{
		public static function GC_PLAYER_LOGIN_RESULT(succeed:Boolean):void
		{
			trace("Login result: " + succeed);
			// get role list
			if (succeed) {
				TCPService.sendCommand(MessageType.CG_GET_ROLE_LIST);
			}
		}
		
		public static function GC_GET_ROLE_LIST(roleList:Array):void
		{
			trace("RoleList size: " + roleList.length);
			if (roleList.length == 0) {
				// create role
				var createRole:CreateRole = new CreateRole();
				// TODO: crazyjohn read from model data
				createRole.name = "crazyjohn";
				createRole.templateId= 1001;
				var createData:ByteArray = new ByteArray();
				createRole.writeTo(createData);
				trace("Create role: " + createRole.name);
				TCPService.sendPackage(MessageType.CG_CREATE_ROLE, createData);
			} else {
				// select role
				var role:Role = roleList[0];
				var selectRole:SelectRole = new SelectRole();
				selectRole.roleId = role.roleId;
				var selectData:ByteArray = new ByteArray();
				selectRole.writeTo(selectData);
				trace("Select role: " + role.roleId);
				TCPService.sendPackage(MessageType.CG_SELECT_ROLE, selectData);
			}
		}
		
		public static function GC_ENTER_SCENE(human:Human):void
		{
			// TODO Auto Generated method stub
			trace("Enter scene ready: " + human.name);
			TCPService.sendCommand(MessageType.CG_ENTER_SCENE_READY);
			
		}
	}
}