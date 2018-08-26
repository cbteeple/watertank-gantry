; Auto-generated. Do not edit!


(cl:in-package gantry_control-msg)


;//! \htmlinclude curr_pos.msg.html

(cl:defclass <curr_pos> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass curr_pos (<curr_pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <curr_pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'curr_pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gantry_control-msg:<curr_pos> is deprecated: use gantry_control-msg:curr_pos instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <curr_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gantry_control-msg:position-val is deprecated.  Use gantry_control-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <curr_pos>) ostream)
  "Serializes a message object of type '<curr_pos>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <curr_pos>) istream)
  "Deserializes a message object of type '<curr_pos>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<curr_pos>)))
  "Returns string type for a message object of type '<curr_pos>"
  "gantry_control/curr_pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'curr_pos)))
  "Returns string type for a message object of type 'curr_pos"
  "gantry_control/curr_pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<curr_pos>)))
  "Returns md5sum for a message object of type '<curr_pos>"
  "8ec164ae840396df197eeb512c1b8515")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'curr_pos)))
  "Returns md5sum for a message object of type 'curr_pos"
  "8ec164ae840396df197eeb512c1b8515")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<curr_pos>)))
  "Returns full string definition for message of type '<curr_pos>"
  (cl:format cl:nil "float32[] position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'curr_pos)))
  "Returns full string definition for message of type 'curr_pos"
  (cl:format cl:nil "float32[] position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <curr_pos>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <curr_pos>))
  "Converts a ROS message object to a list"
  (cl:list 'curr_pos
    (cl:cons ':position (position msg))
))
