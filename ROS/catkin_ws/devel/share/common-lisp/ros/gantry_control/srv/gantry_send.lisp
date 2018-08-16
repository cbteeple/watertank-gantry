; Auto-generated. Do not edit!


(cl:in-package gantry_control-srv)


;//! \htmlinclude gantry_send-request.msg.html

(cl:defclass <gantry_send-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (path
    :reader path
    :initarg :path
    :type cl:string
    :initform ""))
)

(cl:defclass gantry_send-request (<gantry_send-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gantry_send-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gantry_send-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gantry_control-srv:<gantry_send-request> is deprecated: use gantry_control-srv:gantry_send-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <gantry_send-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-srv:command-val is deprecated.  Use gantry_control-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <gantry_send-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-srv:type-val is deprecated.  Use gantry_control-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <gantry_send-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-srv:path-val is deprecated.  Use gantry_control-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gantry_send-request>) ostream)
  "Serializes a message object of type '<gantry_send-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gantry_send-request>) istream)
  "Deserializes a message object of type '<gantry_send-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gantry_send-request>)))
  "Returns string type for a service object of type '<gantry_send-request>"
  "gantry_control/gantry_sendRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gantry_send-request)))
  "Returns string type for a service object of type 'gantry_send-request"
  "gantry_control/gantry_sendRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gantry_send-request>)))
  "Returns md5sum for a message object of type '<gantry_send-request>"
  "21afae2465c27c8fc1d2797f773bd384")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gantry_send-request)))
  "Returns md5sum for a message object of type 'gantry_send-request"
  "21afae2465c27c8fc1d2797f773bd384")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gantry_send-request>)))
  "Returns full string definition for message of type '<gantry_send-request>"
  (cl:format cl:nil "string command~%string type~%string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gantry_send-request)))
  "Returns full string definition for message of type 'gantry_send-request"
  (cl:format cl:nil "string command~%string type~%string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gantry_send-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gantry_send-request>))
  "Converts a ROS message object to a list"
  (cl:list 'gantry_send-request
    (cl:cons ':command (command msg))
    (cl:cons ':type (type msg))
    (cl:cons ':path (path msg))
))
;//! \htmlinclude gantry_send-response.msg.html

(cl:defclass <gantry_send-response> (roslisp-msg-protocol:ros-message)
  ((ack
    :reader ack
    :initarg :ack
    :type cl:fixnum
    :initform 0))
)

(cl:defclass gantry_send-response (<gantry_send-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gantry_send-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gantry_send-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gantry_control-srv:<gantry_send-response> is deprecated: use gantry_control-srv:gantry_send-response instead.")))

(cl:ensure-generic-function 'ack-val :lambda-list '(m))
(cl:defmethod ack-val ((m <gantry_send-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-srv:ack-val is deprecated.  Use gantry_control-srv:ack instead.")
  (ack m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gantry_send-response>) ostream)
  "Serializes a message object of type '<gantry_send-response>"
  (cl:let* ((signed (cl:slot-value msg 'ack)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gantry_send-response>) istream)
  "Deserializes a message object of type '<gantry_send-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ack) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gantry_send-response>)))
  "Returns string type for a service object of type '<gantry_send-response>"
  "gantry_control/gantry_sendResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gantry_send-response)))
  "Returns string type for a service object of type 'gantry_send-response"
  "gantry_control/gantry_sendResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gantry_send-response>)))
  "Returns md5sum for a message object of type '<gantry_send-response>"
  "21afae2465c27c8fc1d2797f773bd384")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gantry_send-response)))
  "Returns md5sum for a message object of type 'gantry_send-response"
  "21afae2465c27c8fc1d2797f773bd384")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gantry_send-response>)))
  "Returns full string definition for message of type '<gantry_send-response>"
  (cl:format cl:nil "int16 ack~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gantry_send-response)))
  "Returns full string definition for message of type 'gantry_send-response"
  (cl:format cl:nil "int16 ack~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gantry_send-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gantry_send-response>))
  "Converts a ROS message object to a list"
  (cl:list 'gantry_send-response
    (cl:cons ':ack (ack msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'gantry_send)))
  'gantry_send-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'gantry_send)))
  'gantry_send-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gantry_send)))
  "Returns string type for a service object of type '<gantry_send>"
  "gantry_control/gantry_send")