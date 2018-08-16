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

class SerialSendRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SerialSendRequest
    // Serialize message field [command]
    bufferOffset = _serializer.int16(obj.command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SerialSendRequest
    let len;
    let data = new SerialSendRequest(null);
    // Deserialize message field [command]
    data.command = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'return_control/SerialSendRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7e9e8174f74cb4650ecb20cd2f2bf4c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 command
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SerialSendRequest(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0
    }

    return resolved;
    }
};

class SerialSendResponse {
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
    // Serializes a message object of type SerialSendResponse
    // Serialize message field [ack]
    bufferOffset = _serializer.int16(obj.ack, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SerialSendResponse
    let len;
    let data = new SerialSendResponse(null);
    // Deserialize message field [ack]
    data.ack = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'return_control/SerialSendResponse';
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
    const resolved = new SerialSendResponse(null);
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
  Request: SerialSendRequest,
  Response: SerialSendResponse,
  md5sum() { return '4a85f0858e5941ef92944e5dd453320b'; },
  datatype() { return 'return_control/SerialSend'; }
};
