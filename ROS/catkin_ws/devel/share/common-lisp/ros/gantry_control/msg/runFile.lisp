; Auto-generated. Do not edit!


(cl:in-package gantry_control-msg)


;//! \htmlinclude runFile.msg.html

(cl:defclass <runFile> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform ""))
)

(cl:defclass runFile (<runFile>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <runFile>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'runFile)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gantry_control-msg:<runFile> is deprecated: use gantry_control-msg:runFile instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <runFile>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-msg:filename-val is deprecated.  Use gantry_control-msg:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <runFile>) ostream)
  "Serializes a message object of type '<runFile>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <runFile>) istream)
  "Deserializes a message object of type '<runFile>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<runFile>)))
  "Returns string type for a message object of type '<runFile>"
  "gantry_control/runFile")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'runFile)))
  "Returns string type for a message object of type 'runFile"
  "gantry_control/runFile")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<runFile>)))
  "Returns md5sum for a message object of type '<runFile>"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'runFile)))
  "Returns md5sum for a message object of type 'runFile"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<runFile>)))
  "Returns full string definition for message of type '<runFile>"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'runFile)))
  "Returns full string definition for message of type 'runFile"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <runFile>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <runFile>))
  "Converts a ROS message object to a list"
  (cl:list 'runFile
    (cl:cons ':filename (filename msg))
))
