// Auto-generated. Do not edit!

// (in-package gantry_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class actuation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.levels = null;
    }
    else {
      if (initObj.hasOwnProperty('levels')) {
        this.levels = initObj.levels
      }
      else {
        this.levels = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type actuation
    // Serialize message field [levels]
    bufferOffset = _arraySerializer.float32(obj.levels, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type actuation
    let len;
    let data = new actuation(null);
    // Deserialize message field [levels]
    data.levels = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.levels.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gantry_control/actuation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36506dab5a92e5be22a70802ef8ef9e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] levels
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new actuation(null);
    if (msg.levels !== undefined) {
      resolved.levels = msg.levels;
    }
    else {
      resolved.levels = []
    }

    return resolved;
    }
};

module.exports = actuation;
