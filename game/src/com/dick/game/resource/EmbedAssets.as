package com.dick.game.resource
{
	import com.dick.game.constants.HumanActionType;
	
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class EmbedAssets
	{
		// bg
		[Embed(source="/embedRes/map/1.jpg")]
		public static const Map:Class;
		// human idle
		[Embed(source="/embedRes/unit/1.png")]
		public static const HumanIdleImg:Class;
		[Embed(source="/embedRes/unit/1.xml", mimeType="application/octet-stream")]
		public static const HumanIdleXml:Class;
		// human use skill
		[Embed(source="/embedRes/unit/13.png")]
		public static const HumanSkillImg:Class;
		[Embed(source="/embedRes/unit/13.xml", mimeType="application/octet-stream")]
		public static const HumanSkillXml:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):starling.textures.Texture {
			if (gameTextures[name] == undefined) {
				// FIXME:
				var bitmap:Bitmap = new EmbedAssets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
		public static function getHumanTextureAtlas(type:int):TextureAtlas {
			var result:TextureAtlas;
			if (type == HumanActionType.IDLE) {
				var xml:XML = XML(new HumanIdleXml());
				result = new TextureAtlas(getTexture("HumanIdleImg"), xml);
			} else if (type == HumanActionType.USE_SKILL) {
				xml = XML(new HumanSkillXml());
				result = new TextureAtlas(getTexture("HumanSkillImg"), xml);
			}
			
			return result;
		}
	}
}