; Auto-generated. Do not edit!


(cl:in-package video_recorder-srv)


;//! \htmlinclude cam_control-request.msg.html

(cl:defclass <cam_control-request> (roslisp-msg-protocol:ros-message)
  ((settings
    :reader settings
    :initarg :settings
    :type cl:string
    :initform ""))
)

(cl:defclass cam_control-request (<cam_control-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cam_control-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cam_control-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name video_recorder-srv:<cam_control-request> is deprecated: use video_recorder-srv:cam_control-request instead.")))

(cl:ensure-generic-function 'settings-val :lambda-list '(m))
(cl:defmethod settings-val ((m <cam_control-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader video_recorder-srv:settings-val is deprecated.  Use video_recorder-srv:settings instead.")
  (settings m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cam_control-request>) ostream)
  "Serializes a message object of type '<cam_control-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'settings))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'settings))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cam_control-request>) istream)
  "Deserializes a message object of type '<cam_control-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'settings) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'settings) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cam_control-request>)))
  "Returns string type for a service object of type '<cam_control-request>"
  "video_recorder/cam_controlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cam_control-request)))
  "Returns string type for a service object of type 'cam_control-request"
  "video_recorder/cam_controlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cam_control-request>)))
  "Returns md5sum for a message object of type '<cam_control-request>"
  "d5be26e0dc9e08360fce9406fdf1866e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cam_control-request)))
  "Returns md5sum for a message object of type 'cam_control-request"
  "d5be26e0dc9e08360fce9406fdf1866e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cam_control-request>)))
  "Returns full string definition for message of type '<cam_control-request>"
  (cl:format cl:nil "string settings~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cam_control-request)))
  "Returns full string definition for message of type 'cam_control-request"
  (cl:format cl:nil "string settings~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cam_control-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'settings))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cam_control-request>))
  "Converts a ROS message object to a list"
  (cl:list 'cam_control-request
    (cl:cons ':settings (settings msg))
))
;//! \htmlinclude cam_control-response.msg.html

(cl:defclass <cam_control-response> (roslisp-msg-protocol:ros-message)
  ((ack
    :reader ack
    :initarg :ack
    :type cl:fixnum
    :initform 0))
)

(cl:defclass cam_control-response (<cam_control-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cam_control-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cam_control-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name video_recorder-srv:<cam_control-response> is deprecated: use video_recorder-srv:cam_control-response instead.")))

(cl:ensure-generic-function 'ack-val :lambda-list '(m))
(cl:defmethod ack-val ((m <cam_control-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader video_recorder-srv:ack-val is deprecated.  Use video_recorder-srv:ack instead.")
  (ack m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cam_control-response>) ostream)
  "Serializes a message object of type '<cam_control-response>"
  (cl:let* ((signed (cl:slot-value msg 'ack)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cam_control-response>) istream)
  "Deserializes a message object of type '<cam_control-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ack) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cam_control-response>)))
  "Returns string type for a service object of type '<cam_control-response>"
  "video_recorder/cam_controlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cam_control-response)))
  "Returns string type for a service object of type 'cam_control-response"
  "video_recorder/cam_controlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cam_control-response>)))
  "Returns md5sum for a message object of type '<cam_control-response>"
  "d5be26e0dc9e08360fce9406fdf1866e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cam_control-response)))
  "Returns md5sum for a message object of type 'cam_control-response"
  "d5be26e0dc9e08360fce9406fdf1866e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cam_control-response>)))
  "Returns full string definition for message of type '<cam_control-response>"
  (cl:format cl:nil "int16 ack~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cam_control-response)))
  "Returns full string definition for message of type 'cam_control-response"
  (cl:format cl:nil "int16 ack~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cam_control-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cam_control-response>))
  "Converts a ROS message object to a list"
  (cl:list 'cam_control-response
    (cl:cons ':ack (ack msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'cam_control)))
  'cam_control-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'cam_control)))
  'cam_control-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cam_control)))
  "Returns string type for a service object of type '<cam_control>"
  "video_recorder/cam_control")