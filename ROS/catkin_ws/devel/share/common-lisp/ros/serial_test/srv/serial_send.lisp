; Auto-generated. Do not edit!


(cl:in-package serial_test-srv)


;//! \htmlinclude serial_send-request.msg.html

(cl:defclass <serial_send-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass serial_send-request (<serial_send-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <serial_send-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'serial_send-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_test-srv:<serial_send-request> is deprecated: use serial_test-srv:serial_send-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <serial_send-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-srv:command-val is deprecated.  Use serial_test-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <serial_send-request>) ostream)
  "Serializes a message object of type '<serial_send-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <serial_send-request>) istream)
  "Deserializes a message object of type '<serial_send-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<serial_send-request>)))
  "Returns string type for a service object of type '<serial_send-request>"
  "serial_test/serial_sendRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_send-request)))
  "Returns string type for a service object of type 'serial_send-request"
  "serial_test/serial_sendRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<serial_send-request>)))
  "Returns md5sum for a message object of type '<serial_send-request>"
  "4a85f0858e5941ef92944e5dd453320b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'serial_send-request)))
  "Returns md5sum for a message object of type 'serial_send-request"
  "4a85f0858e5941ef92944e5dd453320b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<serial_send-request>)))
  "Returns full string definition for message of type '<serial_send-request>"
  (cl:format cl:nil "int16 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'serial_send-request)))
  "Returns full string definition for message of type 'serial_send-request"
  (cl:format cl:nil "int16 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <serial_send-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <serial_send-request>))
  "Converts a ROS message object to a list"
  (cl:list 'serial_send-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude serial_send-response.msg.html

(cl:defclass <serial_send-response> (roslisp-msg-protocol:ros-message)
  ((ack
    :reader ack
    :initarg :ack
    :type cl:fixnum
    :initform 0))
)

(cl:defclass serial_send-response (<serial_send-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <serial_send-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'serial_send-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_test-srv:<serial_send-response> is deprecated: use serial_test-srv:serial_send-response instead.")))

(cl:ensure-generic-function 'ack-val :lambda-list '(m))
(cl:defmethod ack-val ((m <serial_send-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-srv:ack-val is deprecated.  Use serial_test-srv:ack instead.")
  (ack m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <serial_send-response>) ostream)
  "Serializes a message object of type '<serial_send-response>"
  (cl:let* ((signed (cl:slot-value msg 'ack)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <serial_send-response>) istream)
  "Deserializes a message object of type '<serial_send-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ack) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<serial_send-response>)))
  "Returns string type for a service object of type '<serial_send-response>"
  "serial_test/serial_sendResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_send-response)))
  "Returns string type for a service object of type 'serial_send-response"
  "serial_test/serial_sendResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<serial_send-response>)))
  "Returns md5sum for a message object of type '<serial_send-response>"
  "4a85f0858e5941ef92944e5dd453320b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'serial_send-response)))
  "Returns md5sum for a message object of type 'serial_send-response"
  "4a85f0858e5941ef92944e5dd453320b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<serial_send-response>)))
  "Returns full string definition for message of type '<serial_send-response>"
  (cl:format cl:nil "int16 ack~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'serial_send-response)))
  "Returns full string definition for message of type 'serial_send-response"
  (cl:format cl:nil "int16 ack~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <serial_send-response>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <serial_send-response>))
  "Converts a ROS message object to a list"
  (cl:list 'serial_send-response
    (cl:cons ':ack (ack msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'serial_send)))
  'serial_send-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'serial_send)))
  'serial_send-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_send)))
  "Returns string type for a service object of type '<serial_send>"
  "serial_test/serial_send")