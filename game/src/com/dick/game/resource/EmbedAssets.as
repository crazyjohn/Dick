package com.dick.game.resource
{
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
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):starling.textures.Texture {
			if (gameTextures[name] == undefined) {
				// FIXME:
				var bitmap:Bitmap = new EmbedAssets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
		public static function getHumanTextureAtlas():TextureAtlas {
			var xml:XML = XML(new HumanIdleXml());
			var humanAtlas:TextureAtlas = new TextureAtlas(getTexture("HumanIdleImg"), xml);
			return humanAtlas;
		}
	}
}