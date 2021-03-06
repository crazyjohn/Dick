package  {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import Human;
	import Move;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SceneObjectAppear extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HUMAN:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("SceneObjectAppear.human", "human", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return Human; });

		public var human:Human;

		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("SceneObjectAppear.pos", "pos", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return Move; });

		public var pos:Move;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.human);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.pos);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var human$count:uint = 0;
			var pos$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (human$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneObjectAppear.human cannot be set twice.');
					}
					++human$count;
					this.human = new Human();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.human);
					break;
				case 2:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneObjectAppear.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = new Move();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.pos);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
