; Auto-generated. Do not edit!


(cl:in-package return_control-msg)


;//! \htmlinclude setpoint.msg.html

(cl:defclass <setpoint> (roslisp-msg-protocol:ros-message)
  ((setpoint
    :reader setpoint
    :initarg :setpoint
    :type cl:float
    :initform 0.0)
   (time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0))
)

(cl:defclass setpoint (<setpoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <setpoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'setpoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name return_control-msg:<setpoint> is deprecated: use return_control-msg:setpoint instead.")))

(cl:ensure-generic-function 'setpoint-val :lambda-list '(m))
(cl:defmethod setpoint-val ((m <setpoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader return_control-msg:setpoint-val is deprecated.  Use return_control-msg:setpoint instead.")
  (setpoint m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <setpoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader return_control-msg:time-val is deprecated.  Use return_control-msg:time instead.")
  (time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <setpoint>) ostream)
  "Serializes a message object of type '<setpoint>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'setpoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <setpoint>) istream)
  "Deserializes a message object of type '<setpoint>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'setpoint) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<setpoint>)))
  "Returns string type for a message object of type '<setpoint>"
  "return_control/setpoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'setpoint)))
  "Returns string type for a message object of type 'setpoint"
  "return_control/setpoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<setpoint>)))
  "Returns md5sum for a message object of type '<setpoint>"
  "69dccf7b66123a7863bfbf542606a1d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'setpoint)))
  "Returns md5sum for a message object of type 'setpoint"
  "69dccf7b66123a7863bfbf542606a1d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<setpoint>)))
  "Returns full string definition for message of type '<setpoint>"
  (cl:format cl:nil "float32 setpoint~%float32 time~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'setpoint)))
  "Returns full string definition for message of type 'setpoint"
  (cl:format cl:nil "float32 setpoint~%float32 time~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <setpoint>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <setpoint>))
  "Converts a ROS message object to a list"
  (cl:list 'setpoint
    (cl:cons ':setpoint (setpoint msg))
    (cl:cons ':time (time msg))
))
