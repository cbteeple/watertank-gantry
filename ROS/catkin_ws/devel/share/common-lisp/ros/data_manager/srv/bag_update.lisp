; Auto-generated. Do not edit!


(cl:in-package data_manager-srv)


;//! \htmlinclude bag_update-request.msg.html

(cl:defclass <bag_update-request> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform ""))
)

(cl:defclass bag_update-request (<bag_update-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bag_update-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bag_update-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name data_manager-srv:<bag_update-request> is deprecated: use data_manager-srv:bag_update-request instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <bag_update-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader data_manager-srv:filename-val is deprecated.  Use data_manager-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bag_update-request>) ostream)
  "Serializes a message object of type '<bag_update-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bag_update-request>) istream)
  "Deserializes a message object of type '<bag_update-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bag_update-request>)))
  "Returns string type for a service object of type '<bag_update-request>"
  "data_manager/bag_updateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bag_update-request)))
  "Returns string type for a service object of type 'bag_update-request"
  "data_manager/bag_updateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bag_update-request>)))
  "Returns md5sum for a message object of type '<bag_update-request>"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bag_update-request)))
  "Returns md5sum for a message object of type 'bag_update-request"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bag_update-request>)))
  "Returns full string definition for message of type '<bag_update-request>"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bag_update-request)))
  "Returns full string definition for message of type 'bag_update-request"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bag_update-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bag_update-request>))
  "Converts a ROS message object to a list"
  (cl:list 'bag_update-request
    (cl:cons ':filename (filename msg))
))
;//! \htmlinclude bag_update-response.msg.html

(cl:defclass <bag_update-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass bag_update-response (<bag_update-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bag_update-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bag_update-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name data_manager-srv:<bag_update-response> is deprecated: use data_manager-srv:bag_update-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bag_update-response>) ostream)
  "Serializes a message object of type '<bag_update-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bag_update-response>) istream)
  "Deserializes a message object of type '<bag_update-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bag_update-response>)))
  "Returns string type for a service object of type '<bag_update-response>"
  "data_manager/bag_updateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bag_update-response)))
  "Returns string type for a service object of type 'bag_update-response"
  "data_manager/bag_updateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bag_update-response>)))
  "Returns md5sum for a message object of type '<bag_update-response>"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bag_update-response)))
  "Returns md5sum for a message object of type 'bag_update-response"
  "030824f52a0628ead956fb9d67e66ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bag_update-response>)))
  "Returns full string definition for message of type '<bag_update-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bag_update-response)))
  "Returns full string definition for message of type 'bag_update-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bag_update-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bag_update-response>))
  "Converts a ROS message object to a list"
  (cl:list 'bag_update-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'bag_update)))
  'bag_update-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'bag_update)))
  'bag_update-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bag_update)))
  "Returns string type for a service object of type '<bag_update>"
  "data_manager/bag_update")