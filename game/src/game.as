package
{
	import com.dick.net.msg.Login;
	import com.dick.net.msg.MessageType;
	import com.dick.net.msg.response.GCLoginMessageResonse;
	import com.dick.net.session.TCPService;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.utils.ByteArray;
	
	public class game extends Sprite
	{
		public function game()
		{
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			trace("i am coming as!");
			// tcpService
			var session:TCPService = new TCPService();
			session.connect("203.195.218.172", 8081, sendLogin);
			// register handler
			session.registerLoginMessageHandler(new GCLoginMessageResonse());
			function sendLogin():void {
				// send login
				var login:Login = new Login();
				login.puid = "crazyjohn";
				var msgBody:ByteArray = new ByteArray();
				login.writeTo(msgBody);
				TCPService.sendPackage(MessageType.CG_PLAYER_LOGIN, msgBody);
			}
			
		}
	}
}