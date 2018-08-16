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

class gantry_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.milliseconds = null;
      this.rate = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('milliseconds')) {
        this.milliseconds = initObj.milliseconds
      }
      else {
        this.milliseconds = 0;
      }
      if (initObj.hasOwnProperty('rate')) {
        this.rate = initObj.rate
      }
      else {
        this.rate = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gantry_data
    // Serialize message field [milliseconds]
    bufferOffset = _serializer.uint32(obj.milliseconds, buffer, bufferOffset);
    // Serialize message field [rate]
    bufferOffset = _serializer.uint32(obj.rate, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.int32(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gantry_data
    let len;
    let data = new gantry_data(null);
    // Deserialize message field [milliseconds]
    data.milliseconds = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [rate]
    data.rate = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.data.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gantry_control/gantry_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'de3135af80b69505452faf10b8247a05';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 milliseconds
    uint32 rate
    int32[] data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gantry_data(null);
    if (msg.milliseconds !== undefined) {
      resolved.milliseconds = msg.milliseconds;
    }
    else {
      resolved.milliseconds = 0
    }

    if (msg.rate !== undefined) {
      resolved.rate = msg.rate;
    }
    else {
      resolved.rate = 0
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = gantry_data;
