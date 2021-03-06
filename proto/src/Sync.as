package   {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Sync extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SYNCTIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("Sync.syncTime", "syncTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var syncTime:Int64;

		/**
		 *  @private
		 */
		public static const HUMANS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("Sync.humans", "humans", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return Human; });

		[ArrayElementType("Human")]
		public var humans:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.syncTime);
			for (var humans$index:uint = 0; humans$index < this.humans.length; ++humans$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.humans[humans$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var syncTime$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (syncTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: Sync.syncTime cannot be set twice.');
					}
					++syncTime$count;
					this.syncTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					this.humans.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new Human()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
