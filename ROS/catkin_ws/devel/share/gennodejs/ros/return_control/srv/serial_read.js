// Auto-generated. Do not edit!

// (in-package return_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class serial_readRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type serial_readRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type serial_readRequest
    let len;
    let data = new serial_readRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'return_control/serial_readRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new serial_readRequest(null);
    return resolved;
    }
};

class serial_readResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.miliseconds = null;
      this.rate = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('miliseconds')) {
        this.miliseconds = initObj.miliseconds
      }
      else {
        this.miliseconds = 0;
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
    // Serializes a message object of type serial_readResponse
    // Serialize message field [miliseconds]
    bufferOffset = _serializer.uint32(obj.miliseconds, buffer, bufferOffset);
    // Serialize message field [rate]
    bufferOffset = _serializer.uint32(obj.rate, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint16(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type serial_readResponse
    let len;
    let data = new serial_readResponse(null);
    // Deserialize message field [miliseconds]
    data.miliseconds = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [rate]
    data.rate = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.data.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'return_control/serial_readResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b191cc1f130fc908db72dc38712947ff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 miliseconds
    uint32 rate
    uint16[] data
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new serial_readResponse(null);
    if (msg.miliseconds !== undefined) {
      resolved.miliseconds = msg.miliseconds;
    }
    else {
      resolved.miliseconds = 0
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

module.exports = {
  Request: serial_readRequest,
  Response: serial_readResponse,
  md5sum() { return 'b191cc1f130fc908db72dc38712947ff'; },
  datatype() { return 'return_control/serial_read'; }
};
