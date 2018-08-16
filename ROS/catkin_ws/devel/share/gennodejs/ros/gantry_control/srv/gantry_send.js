// Auto-generated. Do not edit!

// (in-package gantry_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class gantry_sendRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
      this.type = null;
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = '';
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gantry_sendRequest
    // Serialize message field [command]
    bufferOffset = _serializer.string(obj.command, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [path]
    bufferOffset = _serializer.string(obj.path, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gantry_sendRequest
    let len;
    let data = new gantry_sendRequest(null);
    // Deserialize message field [command]
    data.command = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [path]
    data.path = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.command.length;
    length += object.type.length;
    length += object.path.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gantry_control/gantry_sendRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c395f0dfc1ed9431de3df8847a8f9592';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string command
    string type
    string path
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gantry_sendRequest(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = ''
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    if (msg.path !== undefined) {
      resolved.path = msg.path;
    }
    else {
      resolved.path = ''
    }

    return resolved;
    }
};

class gantry_sendResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ack = null;
    }
    else {
      if (initObj.hasOwnProperty('ack')) {
        this.ack = initObj.ack
      }
      else {
        this.ack = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gantry_sendResponse
    // Serialize message field [ack]
    bufferOffset = _serializer.int16(obj.ack, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gantry_sendResponse
    let len;
    let data = new gantry_sendResponse(null);
    // Deserialize message field [ack]
    data.ack = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'gantry_control/gantry_sendResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'efd27fb04e2a6ce3c9ff1f47eb32e7bb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 ack
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gantry_sendResponse(null);
    if (msg.ack !== undefined) {
      resolved.ack = msg.ack;
    }
    else {
      resolved.ack = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: gantry_sendRequest,
  Response: gantry_sendResponse,
  md5sum() { return '21afae2465c27c8fc1d2797f773bd384'; },
  datatype() { return 'gantry_control/gantry_send'; }
};
