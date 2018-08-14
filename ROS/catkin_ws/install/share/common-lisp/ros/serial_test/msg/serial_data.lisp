; Auto-generated. Do not edit!


(cl:in-package serial_test-msg)


;//! \htmlinclude serial_data.msg.html

(cl:defclass <serial_data> (roslisp-msg-protocol:ros-message)
  ((milliseconds
    :reader milliseconds
    :initarg :milliseconds
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

(cl:defclass serial_data (<serial_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <serial_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'serial_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_test-msg:<serial_data> is deprecated: use serial_test-msg:serial_data instead.")))

(cl:ensure-generic-function 'milliseconds-val :lambda-list '(m))
(cl:defmethod milliseconds-val ((m <serial_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-msg:milliseconds-val is deprecated.  Use serial_test-msg:milliseconds instead.")
  (milliseconds m))

(cl:ensure-generic-function 'rate-val :lambda-list '(m))
(cl:defmethod rate-val ((m <serial_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-msg:rate-val is deprecated.  Use serial_test-msg:rate instead.")
  (rate m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <serial_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_test-msg:data-val is deprecated.  Use serial_test-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <serial_data>) ostream)
  "Serializes a message object of type '<serial_data>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'milliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'milliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'milliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'milliseconds)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <serial_data>) istream)
  "Deserializes a message object of type '<serial_data>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'milliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'milliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'milliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'milliseconds)) (cl:read-byte istream))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<serial_data>)))
  "Returns string type for a message object of type '<serial_data>"
  "serial_test/serial_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_data)))
  "Returns string type for a message object of type 'serial_data"
  "serial_test/serial_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<serial_data>)))
  "Returns md5sum for a message object of type '<serial_data>"
  "1dbb12ecfd1d112426442f51a9aecd31")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'serial_data)))
  "Returns md5sum for a message object of type 'serial_data"
  "1dbb12ecfd1d112426442f51a9aecd31")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<serial_data>)))
  "Returns full string definition for message of type '<serial_data>"
  (cl:format cl:nil "uint32 milliseconds~%uint32 rate~%uint16[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'serial_data)))
  "Returns full string definition for message of type 'serial_data"
  (cl:format cl:nil "uint32 milliseconds~%uint32 rate~%uint16[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <serial_data>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <serial_data>))
  "Converts a ROS message object to a list"
  (cl:list 'serial_data
    (cl:cons ':milliseconds (milliseconds msg))
    (cl:cons ':rate (rate msg))
    (cl:cons ':data (data msg))
))
