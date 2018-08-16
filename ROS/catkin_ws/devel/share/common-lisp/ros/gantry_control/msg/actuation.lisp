; Auto-generated. Do not edit!


(cl:in-package gantry_control-msg)


;//! \htmlinclude actuation.msg.html

(cl:defclass <actuation> (roslisp-msg-protocol:ros-message)
  ((levels
    :reader levels
    :initarg :levels
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass actuation (<actuation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <actuation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'actuation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gantry_control-msg:<actuation> is deprecated: use gantry_control-msg:actuation instead.")))

(cl:ensure-generic-function 'levels-val :lambda-list '(m))
(cl:defmethod levels-val ((m <actuation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-msg:levels-val is deprecated.  Use gantry_control-msg:levels instead.")
  (levels m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <actuation>) ostream)
  "Serializes a message object of type '<actuation>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'levels))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'levels))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <actuation>) istream)
  "Deserializes a message object of type '<actuation>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'levels) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'levels)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<actuation>)))
  "Returns string type for a message object of type '<actuation>"
  "gantry_control/actuation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'actuation)))
  "Returns string type for a message object of type 'actuation"
  "gantry_control/actuation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<actuation>)))
  "Returns md5sum for a message object of type '<actuation>"
  "36506dab5a92e5be22a70802ef8ef9e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'actuation)))
  "Returns md5sum for a message object of type 'actuation"
  "36506dab5a92e5be22a70802ef8ef9e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<actuation>)))
  "Returns full string definition for message of type '<actuation>"
  (cl:format cl:nil "float32[] levels~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'actuation)))
  "Returns full string definition for message of type 'actuation"
  (cl:format cl:nil "float32[] levels~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <actuation>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'levels) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <actuation>))
  "Converts a ROS message object to a list"
  (cl:list 'actuation
    (cl:cons ':levels (levels msg))
))
