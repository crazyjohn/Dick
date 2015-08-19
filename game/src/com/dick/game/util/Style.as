package com.dick.game.util
{
	import flash.filters.GlowFilter;
	import flash.system.ApplicationDomain;
	import flash.text.StyleSheet;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import feathers.text.BitmapFontTextFormat;

	public class Style
	{
		public static var BACKGROUND:uint=0xCCCCCC;
		public static var BUTTON_FACE:uint=0xFFFFFF;
		public static var INPUT_TEXT:uint=0xFFFFFF;
		public static var LABEL_TEXT:uint=0xFFFFFF;
		public static var DROPSHADOW:uint=0x000000;
		public static var PANEL:uint=0xF3F3F3;
		public static var PROGRESS_BAR:uint=0xFFFFFFFF;
		public static var ALERT_TITLE:uint = 0xcc9966;
		
		public static var buttonDisAbleLabelColor:uint = 0x999999;

		public static var embedFonts:Boolean=true;
		public static var fontName:String="SimSun"; //"PF Ronda Seven";"黑体""Consolas" "微软雅黑"
		public static var fontSize:Number=14;

		public static var UIDomain:ApplicationDomain;

		/** 聊天文本格式化 */
		public static const CHAT_FORMAT:String = "<font color='{0}' size='15'>[{1}]</font> <font color='{2}' size='15'>{3}</font> <font color='#ffffff' size='15'>{4}</font>";

		private static var _styleSheet:StyleSheet;

		public static function get styleSheet():StyleSheet
		{
			if (_styleSheet)
			{
				return _styleSheet;
			}
			_styleSheet=new StyleSheet();
			_styleSheet.setStyle("a:hover", {color: "#FFFFFF", textDecoration: "none"});
			_styleSheet.setStyle("a:link", {color: "#ffff00", textDecoration: "none"});
			_styleSheet.setStyle("a:active", {color: "#FF0000", textDecoration: "none"});

			return _styleSheet;
		}
		
		//描边颜色
		public static const stroke:uint=0x292317;
		
		public static const fontFilter:Array = [new GlowFilter(stroke, 1, 2, 2, 16)]

		
		public static const DEFAULT_FONT_NAME:String = "Arial";
		/**
		 * 默认字体样式
		 * @param fontSize 字体大小
		 * @param color	字体颜色
		 * @param align	段落对齐方式
		 * @param bold 加粗
		 * @return 
		 * 
		 */
		public static function getDefaultTextFormat(/*fontName:String = "Arial",*/ fontSize:int = 20, color:int = 0xffffff,align:String = TextFormatAlign.LEFT,bold:Boolean = false):TextFormat {
			//return new TextFormat(DEFAULT_FONT_NAME, fontSize, color);
			var format:TextFormat = new TextFormat();
			format.size = fontSize;
			format.color = color;
			format.align = align;
			format.bold = bold;
			return format;
		}
		
		// 默认的文字模式 
		public static function getDefaultBimMapFontTextFormat(fontName:String = "godsoul", fontSize:int = 20, color:int = 0xffffff):BitmapFontTextFormat {
			return new BitmapFontTextFormat(fontName, fontSize, 0xffffff);
		}
	}
}