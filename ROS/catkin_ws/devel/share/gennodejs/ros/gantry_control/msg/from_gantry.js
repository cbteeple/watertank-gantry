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

class from_gantry {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.response = null;
      this.position = null;
    }
    else {
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = '';
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type from_gantry
    // Serialize message field [response]
    bufferOffset = _serializer.string(obj.response, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float32(obj.position, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type from_gantry
    let len;
    let data = new from_gantry(null);
    // Deserialize message field [response]
    data.response = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.response.length;
    length += 4 * object.position.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gantry_control/from_gantry';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '462b18e0de79f571e404f9b05e3ff8d0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string response
    float32[] position
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new from_gantry(null);
    if (msg.response !== undefined) {
      resolved.response = msg.response;
    }
    else {
      resolved.response = ''
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = []
    }

    return resolved;
    }
};

module.exports = from_gantry;
