package
{
	import com.dick.game.msg.Login;
	import com.dick.game.msg.MessageType;
	import com.dick.game.service.TCPService;
	import com.dick.game.util.Style;
	import com.dick.net.msg.response.GCLoginMessageResonse;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.FeathersControl;
	import feathers.core.ITextEditor;
	import feathers.core.ITextRenderer;
	
	import starling.core.Starling;
	
	[SWF(width="1024", height="768", frameRate="60", backgroundColor="#000000")]
	public class game extends Sprite
	{
		/** the starling context */
		private var myStarling:Starling;
		
		public function game()
		{
			// init starling
			initStarling();
			// set text render
			setDefaultFeathersTextRender();
			// suport autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			// tcpService
			var session:TCPService = new TCPService();
			// 203.195.218.172
			session.connect("127.0.0.1", 8081, sendLogin);
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
		
		/**
		 * Set feathers;
		 */
		private function setDefaultFeathersTextRender():void {
			FeathersControl.defaultTextRendererFactory = function():ITextRenderer {
				var textRender:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRender.textFormat = Style.getDefaultTextFormat();
				return textRender;
			}
			FeathersControl.defaultTextEditorFactory = function():ITextEditor {
				var textEditor:TextFieldTextEditor = new TextFieldTextEditor();
				textEditor.textFormat = Style.getDefaultTextFormat();
				return textEditor;
			}
			
		}
		
		/**
		 * Init the starling context;
		 */
		private function initStarling():void
		{
			var viewPort:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			this.myStarling = new Starling(GameEnterScene, stage, viewPort);
			// start
			this.myStarling.start();
			
		}
	}
}