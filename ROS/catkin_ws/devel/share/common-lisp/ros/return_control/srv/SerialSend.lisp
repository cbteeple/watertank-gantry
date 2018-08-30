; Auto-generated. Do not edit!


(cl:in-package return_control-srv)


;//! \htmlinclude SerialSend-request.msg.html

(cl:defclass <SerialSend-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (values
    :reader values
    :initarg :values
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass SerialSend-request (<SerialSend-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SerialSend-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SerialSend-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name return_control-srv:<SerialSend-request> is deprecated: use return_control-srv:SerialSend-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <SerialSend-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader return_control-srv:command-val is deprecated.  Use return_control-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'values-val :lambda-list '(m))
(cl:defmethod values-val ((m <SerialSend-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader return_control-srv:values-val is deprecated.  Use return_control-srv:values instead.")
  (values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SerialSend-request>) ostream)
  "Serializes a message object of type '<SerialSend-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'values))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SerialSend-request>) istream)
  "Deserializes a message object of type '<SerialSend-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'values)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SerialSend-request>)))
  "Returns string type for a service object of type '<SerialSend-request>"
  "return_control/SerialSendRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SerialSend-request)))
  "Returns string type for a service object of type 'SerialSend-request"
  "return_control/SerialSendRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SerialSend-request>)))
  "Returns md5sum for a message object of type '<SerialSend-request>"
  "7d12e4d9c96639392fbf6fb3d0d04203")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SerialSend-request)))
  "Returns md5sum for a message object of type 'SerialSend-request"
  "7d12e4d9c96639392fbf6fb3d0d04203")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SerialSend-request>)))
  "Returns full string definition for message of type '<SerialSend-request>"
  (cl:format cl:nil "string command~%float32[] values~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SerialSend-request)))
  "Returns full string definition for message of type 'SerialSend-request"
  (cl:format cl:nil "string command~%float32[] values~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SerialSend-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SerialSend-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SerialSend-request
    (cl:cons ':command (command msg))
    (cl:cons ':values (values msg))
))
;//! \htmlinclude SerialSend-response.msg.html

(cl:defclass <SerialSend-response> (roslisp-msg-protocol:ros-message)
  ((ack
    :reader ack
    :initarg :ack
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SerialSend-response (<SerialSend-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SerialSend-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SerialSend-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name return_control-srv:<SerialSend-response> is deprecated: use return_control-srv:SerialSend-response instead.")))

(cl:ensure-generic-function 'ack-val :lambda-list '(m))
(cl:defmethod ack-val ((m <SerialSend-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader return_control-srv:ack-val is deprecated.  Use return_control-srv:ack instead.")
  (ack m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SerialSend-response>) ostream)
  "Serializes a message object of type '<SerialSend-response>"
  (cl:let* ((signed (cl:slot-value msg 'ack)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SerialSend-response>) istream)
  "Deserializes a message object of type '<SerialSend-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ack) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SerialSend-response>)))
  "Returns string type for a service object of type '<SerialSend-response>"
  "return_control/SerialSendResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SerialSend-response)))
  "Returns string type for a service object of type 'SerialSend-response"
  "return_control/SerialSendResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SerialSend-response>)))
  "Returns md5sum for a message object of type '<SerialSend-response>"
  "7d12e4d9c96639392fbf6fb3d0d04203")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SerialSend-response)))
  "Returns md5sum for a message object of type 'SerialSend-response"
  "7d12e4d9c96639392fbf6fb3d0d04203")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SerialSend-response>)))
  "Returns full string definition for message of type '<SerialSend-response>"
  (cl:format cl:nil "int16 ack~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SerialSend-response)))
  "Returns full string definition for message of type 'SerialSend-response"
  (cl:format cl:nil "int16 ack~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SerialSend-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SerialSend-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SerialSend-response
    (cl:cons ':ack (ack msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SerialSend)))
  'SerialSend-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SerialSend)))
  'SerialSend-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SerialSend)))
  "Returns string type for a service object of type '<SerialSend>"
  "return_control/SerialSend")