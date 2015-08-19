package
{
	import com.dick.game.msg.Login;
	import com.dick.game.msg.MessageType;
	import com.dick.game.service.TCPService;
	import com.dick.net.msg.response.GCLoginMessageResonse;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import starling.core.Starling;
	
	[SWF(width="1024", height="768", frameRate="60", backgroundColor="#000000")]
	public class game extends Sprite
	{
		private var myStarling:Starling;
		public function game()
		{
			// init starling
			initStarling();
			// suport autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
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
		
		private function initStarling():void
		{
			var viewPort:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			this.myStarling = new Starling(GameEnterScene, stage, viewPort);
			// start
			this.myStarling.start();
			
		}
	}
}