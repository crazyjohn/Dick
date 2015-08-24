

package com.dick.game.msg {
	import com.netease.protobuf.Int64;
	import com.netease.protobuf.Message;
	import com.netease.protobuf.ReadUtils;
	import com.netease.protobuf.WireType;
	import com.netease.protobuf.WriteUtils;
	import com.netease.protobuf.WritingBuffer;
	import com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_ENUM;
	import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_INT32;
	import com.netease.protobuf.fieldDescriptors.FieldDescriptor_TYPE_INT64;
	
	import flash.errors.IOError;
	import flash.utils.IDataInput;

	use namespace com.netease.protobuf.used_by_generated_code;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Move extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("Move.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var id:Int64;

		/**
		 *  @private
		 */
		public static const OBJECTTYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("Move.objectType", "objectType", (2 << 3) | com.netease.protobuf.WireType.VARINT, SceneObjectType);

		public var objectType:int;

		/**
		 *  @private
		 */
		public static const X:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("Move.x", "x", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		public var x:int;

		/**
		 *  @private
		 */
		public static const Y:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("Move.y", "y", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var y:int;

		/**
		 *  @private
		 */
		public static const SCENEID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("Move.sceneId", "sceneId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var sceneId:int;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.id);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.objectType);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.x);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.y);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.sceneId);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var objectType$count:uint = 0;
			var x$count:uint = 0;
			var y$count:uint = 0;
			var sceneId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: Move.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (objectType$count != 0) {
						throw new flash.errors.IOError('Bad data format: Move.objectType cannot be set twice.');
					}
					++objectType$count;
					this.objectType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 3:
					if (x$count != 0) {
						throw new flash.errors.IOError('Bad data format: Move.x cannot be set twice.');
					}
					++x$count;
					this.x = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (y$count != 0) {
						throw new flash.errors.IOError('Bad data format: Move.y cannot be set twice.');
					}
					++y$count;
					this.y = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (sceneId$count != 0) {
						throw new flash.errors.IOError('Bad data format: Move.sceneId cannot be set twice.');
					}
					++sceneId$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
