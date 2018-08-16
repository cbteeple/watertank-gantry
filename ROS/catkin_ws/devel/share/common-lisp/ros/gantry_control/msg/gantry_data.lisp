; Auto-generated. Do not edit!


(cl:in-package gantry_control-msg)


;//! \htmlinclude gantry_data.msg.html

(cl:defclass <gantry_data> (roslisp-msg-protocol:ros-message)
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
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass gantry_data (<gantry_data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gantry_data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gantry_data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gantry_control-msg:<gantry_data> is deprecated: use gantry_control-msg:gantry_data instead.")))

(cl:ensure-generic-function 'milliseconds-val :lambda-list '(m))
(cl:defmethod milliseconds-val ((m <gantry_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-msg:milliseconds-val is deprecated.  Use gantry_control-msg:milliseconds instead.")
  (milliseconds m))

(cl:ensure-generic-function 'rate-val :lambda-list '(m))
(cl:defmethod rate-val ((m <gantry_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-msg:rate-val is deprecated.  Use gantry_control-msg:rate instead.")
  (rate m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <gantry_data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-msg:data-val is deprecated.  Use gantry_control-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gantry_data>) ostream)
  "Serializes a message object of type '<gantry_data>"
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
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gantry_data>) istream)
  "Deserializes a message object of type '<gantry_data>"
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gantry_data>)))
  "Returns string type for a message object of type '<gantry_data>"
  "gantry_control/gantry_data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gantry_data)))
  "Returns string type for a message object of type 'gantry_data"
  "gantry_control/gantry_data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gantry_data>)))
  "Returns md5sum for a message object of type '<gantry_data>"
  "de3135af80b69505452faf10b8247a05")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gantry_data)))
  "Returns md5sum for a message object of type 'gantry_data"
  "de3135af80b69505452faf10b8247a05")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gantry_data>)))
  "Returns full string definition for message of type '<gantry_data>"
  (cl:format cl:nil "uint32 milliseconds~%uint32 rate~%int32[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gantry_data)))
  "Returns full string definition for message of type 'gantry_data"
  (cl:format cl:nil "uint32 milliseconds~%uint32 rate~%int32[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gantry_data>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gantry_data>))
  "Converts a ROS message object to a list"
  (cl:list 'gantry_data
    (cl:cons ':milliseconds (milliseconds msg))
    (cl:cons ':rate (rate msg))
    (cl:cons ':data (data msg))
))
