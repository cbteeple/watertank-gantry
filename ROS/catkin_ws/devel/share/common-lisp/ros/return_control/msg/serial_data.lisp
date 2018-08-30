; Auto-generated. Do not edit!


(cl:in-package return_control-msg)


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
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass serial_data (<serial_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <serial_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'serial_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name return_control-msg:<serial_data> is deprecated: use return_control-msg:serial_data instead.")))

(cl:ensure-generic-function 'milliseconds-val :lambda-list '(m))
(cl:defmethod milliseconds-val ((m <serial_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader return_control-msg:milliseconds-val is deprecated.  Use return_control-msg:milliseconds instead.")
  (milliseconds m))

(cl:ensure-generic-function 'rate-val :lambda-list '(m))
(cl:defmethod rate-val ((m <serial_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader return_control-msg:rate-val is deprecated.  Use return_control-msg:rate instead.")
  (rate m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <serial_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader return_control-msg:data-val is deprecated.  Use return_control-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <serial_data>) ostream)
  "Serializes a message object of type '<serial_data>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'milliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'milliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'milliseconds)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'milliseconds)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'rate)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <serial_data>) istream)
  "Deserializes a message object of type '<serial_data>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'milliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'milliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'milliseconds)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'milliseconds)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rate) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<serial_data>)))
  "Returns string type for a message object of type '<serial_data>"
  "return_control/serial_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'serial_data)))
  "Returns string type for a message object of type 'serial_data"
  "return_control/serial_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<serial_data>)))
  "Returns md5sum for a message object of type '<serial_data>"
  "d07c74afae0b8cb3770367d6c7e162e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'serial_data)))
  "Returns md5sum for a message object of type 'serial_data"
  "d07c74afae0b8cb3770367d6c7e162e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<serial_data>)))
  "Returns full string definition for message of type '<serial_data>"
  (cl:format cl:nil "uint32 milliseconds~%int32 rate~%float32[] data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'serial_data)))
  "Returns full string definition for message of type 'serial_data"
  (cl:format cl:nil "uint32 milliseconds~%int32 rate~%float32[] data~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <serial_data>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <serial_data>))
  "Converts a ROS message object to a list"
  (cl:list 'serial_data
    (cl:cons ':milliseconds (milliseconds msg))
    (cl:cons ':rate (rate msg))
    (cl:cons ':data (data msg))
))
