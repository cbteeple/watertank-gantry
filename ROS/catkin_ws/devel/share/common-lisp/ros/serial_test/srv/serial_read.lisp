; Auto-generated. Do not edit!


(cl:in-package serial_test-srv)


;//! \htmlinclude serial_read-request.msg.html

(cl:defclass <serial_read-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass serial_read-request (<serial_read-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <serial_read-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'serial_read-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_test-srv:<serial_read-request> is deprecated: use serial_test-srv:serial_read-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <serial_read-request>) ostream)
  "Serializes a message object of type '<serial_read-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <serial_read-request>) istream)
  "Deserializes a message object of type '<serial_read-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<serial_read-request>)))
  "Returns string type for a service object of type '<serial_read-request>"
  "serial_test/serial_readRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_read-request)))
  "Returns string type for a service object of type 'serial_read-request"
  "serial_test/serial_readRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<serial_read-request>)))
  "Returns md5sum for a message object of type '<serial_read-request>"
  "b191cc1f130fc908db72dc38712947ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'serial_read-request)))
  "Returns md5sum for a message object of type 'serial_read-request"
  "b191cc1f130fc908db72dc38712947ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<serial_read-request>)))
  "Returns full string definition for message of type '<serial_read-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'serial_read-request)))
  "Returns full string definition for message of type 'serial_read-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <serial_read-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <serial_read-request>))
  "Converts a ROS message object to a list"
  (cl:list 'serial_read-request
))
;//! \htmlinclude serial_read-response.msg.html

(cl:defclass <serial_read-response> (roslisp-msg-protocol:ros-message)
  ((miliseconds
    :reader miliseconds
    :initarg :miliseconds
    :type cl:integer
    :initform 0)
   (rate
    :reader rate
    :initarg :rate
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass serial_read-response (<serial_read-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <serial_read-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'serial_read-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_test-srv:<serial_read-response> is deprecated: use serial_test-srv:serial_read-response instead.")))

(cl:ensure-generic-function 'miliseconds-val :lambda-list '(m))
(cl:defmethod miliseconds-val ((m <serial_read-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-srv:miliseconds-val is deprecated.  Use serial_test-srv:miliseconds instead.")
  (miliseconds m))

(cl:ensure-generic-function 'rate-val :lambda-list '(m))
(cl:defmethod rate-val ((m <serial_read-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-srv:rate-val is deprecated.  Use serial_test-srv:rate instead.")
  (rate m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <serial_read-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-srv:data-val is deprecated.  Use serial_test-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <serial_read-response>) ostream)
  "Serializes a message object of type '<serial_read-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'miliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'miliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'miliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'miliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rate)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <serial_read-response>) istream)
  "Deserializes a message object of type '<serial_read-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'miliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'miliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'miliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'miliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rate)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<serial_read-response>)))
  "Returns string type for a service object of type '<serial_read-response>"
  "serial_test/serial_readResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_read-response)))
  "Returns string type for a service object of type 'serial_read-response"
  "serial_test/serial_readResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<serial_read-response>)))
  "Returns md5sum for a message object of type '<serial_read-response>"
  "b191cc1f130fc908db72dc38712947ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'serial_read-response)))
  "Returns md5sum for a message object of type 'serial_read-response"
  "b191cc1f130fc908db72dc38712947ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<serial_read-response>)))
  "Returns full string definition for message of type '<serial_read-response>"
  (cl:format cl:nil "uint32 miliseconds~%uint32 rate~%uint16[] data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'serial_read-response)))
  "Returns full string definition for message of type 'serial_read-response"
  (cl:format cl:nil "uint32 miliseconds~%uint32 rate~%uint16[] data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <serial_read-response>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <serial_read-response>))
  "Converts a ROS message object to a list"
  (cl:list 'serial_read-response
    (cl:cons ':miliseconds (miliseconds msg))
    (cl:cons ':rate (rate msg))
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'serial_read)))
  'serial_read-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'serial_read)))
  'serial_read-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_read)))
  "Returns string type for a service object of type '<serial_read>"
  "serial_test/serial_read")