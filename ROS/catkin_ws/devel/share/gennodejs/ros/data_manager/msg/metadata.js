// Auto-generated. Do not edit!

// (in-package data_manager.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class metadata {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.traj_folder = null;
      this.test_type = null;
      this.curr_file = null;
    }
    else {
      if (initObj.hasOwnProperty('traj_folder')) {
        this.traj_folder = initObj.traj_folder
      }
      else {
        this.traj_folder = '';
      }
      if (initObj.hasOwnProperty('test_type')) {
        this.test_type = initObj.test_type
      }
      else {
        this.test_type = '';
      }
      if (initObj.hasOwnProperty('curr_file')) {
        this.curr_file = initObj.curr_file
      }
      else {
        this.curr_file = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type metadata
    // Serialize message field [traj_folder]
    bufferOffset = _serializer.string(obj.traj_folder, buffer, bufferOffset);
    // Serialize message field [test_type]
    bufferOffset = _serializer.string(obj.test_type, buffer, bufferOffset);
    // Serialize message field [curr_file]
    bufferOffset = _serializer.string(obj.curr_file, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type metadata
    let len;
    let data = new metadata(null);
    // Deserialize message field [traj_folder]
    data.traj_folder = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [test_type]
    data.test_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [curr_file]
    data.curr_file = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.traj_folder.length;
    length += object.test_type.length;
    length += object.curr_file.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'data_manager/metadata';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f0a7f8ee6e43bf6a0f98c30689b71546';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string traj_folder
    string test_type
    string curr_file
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new metadata(null);
    if (msg.traj_folder !== undefined) {
      resolved.traj_folder = msg.traj_folder;
    }
    else {
      resolved.traj_folder = ''
    }

    if (msg.test_type !== undefined) {
      resolved.test_type = msg.test_type;
    }
    else {
      resolved.test_type = ''
    }

    if (msg.curr_file !== undefined) {
      resolved.curr_file = msg.curr_file;
    }
    else {
      resolved.curr_file = ''
    }

    return resolved;
    }
};

module.exports = metadata;
