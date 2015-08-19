package com.dick.framework.log
{

	public class Logger	
	{
		public static const DEBUG:Number = 5;
		public static const INFO:Number  = 4;
		public static const WARN:Number  = 3;
		public static const ERROR:Number = 2;
		public static const FATAL:Number = 1;

		private static var loggers:Array = [];
		public static var mcOutputClip:ILoggerClip;
		
		/**
		 * 分类 
		 */
		private var category:String = "ROOT";
		/**
		 *  日志等级
		 */
		private var level:Number = Logger.DEBUG;

		public static function getLogger(category:String = "ROOT"):Logger
		{
			var logger:Logger
			category=category.toLowerCase();
			var length:Number=Logger.loggers.length;
			for (var i:Number=0; i < length; i++)
			{
				logger=Logger.loggers[i];
				if (logger.category == category)
				{
					return logger;
				}
			}
			logger = new Logger(category);
			Logger.loggers.push(logger);
			return logger;
		}

		public function Logger(category:String)
		{
			this.category=category;
		}
		
		public function debug(... arg):void
		{
			if (level >= Logger.DEBUG)
			{
				output(createOutputMessage(arg.join(","), DEBUG));
			}
		}

		public function error(... arg):void
		{
			if (level >= Logger.ERROR)
			{
				output(createOutputMessage(arg.join(","), ERROR));
			}
		}

		public function fatal(... arg):void
		{
			if (level >= Logger.INFO)
			{
				output(createOutputMessage(arg.join(","), FATAL));
			}
		}

		public function info(... arg):void
		{
			if (level >= Logger.INFO)
			{
				output(createOutputMessage(arg.join(","), INFO));
			}
		}
		
		public function warn(... arg):void
		{
			if (level >= Logger.WARN)
			{
				output(createOutputMessage(arg.join(","), WARN));
			}
		}

		public function setLevel(level:Number):void
		{
			level=level;
		}

		private function createOutputMessage(message:String, outputLevel:Number = Logger.DEBUG):String
		{
			var sOutput:String = "";
			var sLevelName:String = getLevelName(outputLevel).toUpperCase();
			var date:Date = new Date();
			var time:String = date.hours + ":" + date.minutes + ":" + date.seconds;
			sOutput = "[" + sLevelName + "]" + "[" + time + "]" + category.toUpperCase() + ":" + message;
			return sOutput;
		}

		private function getLevelName(level:Number):String
		{
			switch (level)
			{
				case Logger.FATAL:
					return "FATAL";
					break;
				case Logger.WARN:
					return "WARN";
					break;
				case Logger.ERROR:
					return "ERROR";
					break;
				case Logger.INFO:
					return "INFO";
					break;
				case Logger.DEBUG:
					return "DEBUG";
					break;
				default:
					return "UNKNOWN LEVEL";
					break;
			}
		}

		private function output(message:String):void
		{
			if (mcOutputClip != null)
			{
				mcOutputClip.output(message);
			}
			else
			{
				trace(message);
			}
		}
	}
}


