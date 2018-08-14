; Auto-generated. Do not edit!


(cl:in-package serial_test-srv)


;//! \htmlinclude SerialSend-request.msg.html

(cl:defclass <SerialSend-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SerialSend-request (<SerialSend-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SerialSend-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SerialSend-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_test-srv:<SerialSend-request> is deprecated: use serial_test-srv:SerialSend-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <SerialSend-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-srv:command-val is deprecated.  Use serial_test-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SerialSend-request>) ostream)
  "Serializes a message object of type '<SerialSend-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SerialSend-request>) istream)
  "Deserializes a message object of type '<SerialSend-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SerialSend-request>)))
  "Returns string type for a service object of type '<SerialSend-request>"
  "serial_test/SerialSendRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SerialSend-request)))
  "Returns string type for a service object of type 'SerialSend-request"
  "serial_test/SerialSendRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SerialSend-request>)))
  "Returns md5sum for a message object of type '<SerialSend-request>"
  "4a85f0858e5941ef92944e5dd453320b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SerialSend-request)))
  "Returns md5sum for a message object of type 'SerialSend-request"
  "4a85f0858e5941ef92944e5dd453320b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SerialSend-request>)))
  "Returns full string definition for message of type '<SerialSend-request>"
  (cl:format cl:nil "int16 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SerialSend-request)))
  "Returns full string definition for message of type 'SerialSend-request"
  (cl:format cl:nil "int16 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SerialSend-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SerialSend-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SerialSend-request
    (cl:cons ':command (command msg))
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
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_test-srv:<SerialSend-response> is deprecated: use serial_test-srv:SerialSend-response instead.")))

(cl:ensure-generic-function 'ack-val :lambda-list '(m))
(cl:defmethod ack-val ((m <SerialSend-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-srv:ack-val is deprecated.  Use serial_test-srv:ack instead.")
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
  "serial_test/SerialSendResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SerialSend-response)))
  "Returns string type for a service object of type 'SerialSend-response"
  "serial_test/SerialSendResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SerialSend-response>)))
  "Returns md5sum for a message object of type '<SerialSend-response>"
  "4a85f0858e5941ef92944e5dd453320b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SerialSend-response)))
  "Returns md5sum for a message object of type 'SerialSend-response"
  "4a85f0858e5941ef92944e5dd453320b")
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
  "serial_test/SerialSend")