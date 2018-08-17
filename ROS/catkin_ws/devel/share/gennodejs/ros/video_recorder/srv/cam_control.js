// Auto-generated. Do not edit!

// (in-package video_recorder.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class cam_controlRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.settings = null;
    }
    else {
      if (initObj.hasOwnProperty('settings')) {
        this.settings = initObj.settings
      }
      else {
        this.settings = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type cam_controlRequest
    // Serialize message field [settings]
    bufferOffset = _serializer.string(obj.settings, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cam_controlRequest
    let len;
    let data = new cam_controlRequest(null);
    // Deserialize message field [settings]
    data.settings = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.settings.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'video_recorder/cam_controlRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'adaefbda6e892ce0da5d70a54c9e569a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string settings
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new cam_controlRequest(null);
    if (msg.settings !== undefined) {
      resolved.settings = msg.settings;
    }
    else {
      resolved.settings = ''
    }

    return resolved;
    }
};

class cam_controlResponse {
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
    // Serializes a message object of type cam_controlResponse
    // Serialize message field [ack]
    bufferOffset = _serializer.int16(obj.ack, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type cam_controlResponse
    let len;
    let data = new cam_controlResponse(null);
    // Deserialize message field [ack]
    data.ack = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'video_recorder/cam_controlResponse';
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
    const resolved = new cam_controlResponse(null);
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
  Request: cam_controlRequest,
  Response: cam_controlResponse,
  md5sum() { return 'd5be26e0dc9e08360fce9406fdf1866e'; },
  datatype() { return 'video_recorder/cam_control'; }
};
