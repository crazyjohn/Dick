package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import com.dick.net.msg.Login;
	
	public class Game extends Sprite
	{
		public function Game()
		{
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			trace("i am coming as!");
			// protobuf msg
			var login:Login = new Login();
			login.puid = "crazyjohn";
		}
	}
}