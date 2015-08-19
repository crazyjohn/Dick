package com.dick.game.resource
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;

	public class EmbedAssets
	{
		[Embed(source="/embedRes/map/1.jpg")]
		public static const Map:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):starling.textures.Texture {
			if (gameTextures[name] == undefined) {
				// FIXME:
				var bitmap:Bitmap = new EmbedAssets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}