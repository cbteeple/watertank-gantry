; Auto-generated. Do not edit!


(cl:in-package gantry_control-msg)


;//! \htmlinclude from_gantry.msg.html

(cl:defclass <from_gantry> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass from_gantry (<from_gantry>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <from_gantry>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'from_gantry)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gantry_control-msg:<from_gantry> is deprecated: use gantry_control-msg:from_gantry instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <from_gantry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-msg:response-val is deprecated.  Use gantry_control-msg:response instead.")
  (response m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <from_gantry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-msg:position-val is deprecated.  Use gantry_control-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <from_gantry>) ostream)
  "Serializes a message object of type '<from_gantry>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'response))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <from_gantry>) istream)
  "Deserializes a message object of type '<from_gantry>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'response) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'response) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<from_gantry>)))
  "Returns string type for a message object of type '<from_gantry>"
  "gantry_control/from_gantry")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'from_gantry)))
  "Returns string type for a message object of type 'from_gantry"
  "gantry_control/from_gantry")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<from_gantry>)))
  "Returns md5sum for a message object of type '<from_gantry>"
  "462b18e0de79f571e404f9b05e3ff8d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'from_gantry)))
  "Returns md5sum for a message object of type 'from_gantry"
  "462b18e0de79f571e404f9b05e3ff8d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<from_gantry>)))
  "Returns full string definition for message of type '<from_gantry>"
  (cl:format cl:nil "string response~%float32[] position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'from_gantry)))
  "Returns full string definition for message of type 'from_gantry"
  (cl:format cl:nil "string response~%float32[] position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <from_gantry>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'response))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <from_gantry>))
  "Converts a ROS message object to a list"
  (cl:list 'from_gantry
    (cl:cons ':response (response msg))
    (cl:cons ':position (position msg))
))
