; Auto-generated. Do not edit!


(cl:in-package data_manager-msg)


;//! \htmlinclude metadata.msg.html

(cl:defclass <metadata> (roslisp-msg-protocol:ros-message)
  ((traj_folder
    :reader traj_folder
    :initarg :traj_folder
    :type cl:string
    :initform "")
   (test_type
    :reader test_type
    :initarg :test_type
    :type cl:string
    :initform "")
   (curr_file
    :reader curr_file
    :initarg :curr_file
    :type cl:string
    :initform ""))
)

(cl:defclass metadata (<metadata>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <metadata>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'metadata)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name data_manager-msg:<metadata> is deprecated: use data_manager-msg:metadata instead.")))

(cl:ensure-generic-function 'traj_folder-val :lambda-list '(m))
(cl:defmethod traj_folder-val ((m <metadata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader data_manager-msg:traj_folder-val is deprecated.  Use data_manager-msg:traj_folder instead.")
  (traj_folder m))

(cl:ensure-generic-function 'test_type-val :lambda-list '(m))
(cl:defmethod test_type-val ((m <metadata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader data_manager-msg:test_type-val is deprecated.  Use data_manager-msg:test_type instead.")
  (test_type m))

(cl:ensure-generic-function 'curr_file-val :lambda-list '(m))
(cl:defmethod curr_file-val ((m <metadata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader data_manager-msg:curr_file-val is deprecated.  Use data_manager-msg:curr_file instead.")
  (curr_file m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <metadata>) ostream)
  "Serializes a message object of type '<metadata>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'traj_folder))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'traj_folder))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'test_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'test_type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'curr_file))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'curr_file))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <metadata>) istream)
  "Deserializes a message object of type '<metadata>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'traj_folder) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'traj_folder) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'test_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'test_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'curr_file) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'curr_file) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<metadata>)))
  "Returns string type for a message object of type '<metadata>"
  "data_manager/metadata")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'metadata)))
  "Returns string type for a message object of type 'metadata"
  "data_manager/metadata")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<metadata>)))
  "Returns md5sum for a message object of type '<metadata>"
  "f0a7f8ee6e43bf6a0f98c30689b71546")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'metadata)))
  "Returns md5sum for a message object of type 'metadata"
  "f0a7f8ee6e43bf6a0f98c30689b71546")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<metadata>)))
  "Returns full string definition for message of type '<metadata>"
  (cl:format cl:nil "string traj_folder~%string test_type~%string curr_file~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'metadata)))
  "Returns full string definition for message of type 'metadata"
  (cl:format cl:nil "string traj_folder~%string test_type~%string curr_file~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <metadata>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'traj_folder))
     4 (cl:length (cl:slot-value msg 'test_type))
     4 (cl:length (cl:slot-value msg 'curr_file))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <metadata>))
  "Converts a ROS message object to a list"
  (cl:list 'metadata
    (cl:cons ':traj_folder (traj_folder msg))
    (cl:cons ':test_type (test_type msg))
    (cl:cons ':curr_file (curr_file msg))
))
