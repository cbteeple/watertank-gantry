;; Auto-generated. Do not edit!


(when (boundp 'return_control::SerialSend)
  (if (not (find-package "RETURN_CONTROL"))
    (make-package "RETURN_CONTROL"))
  (shadow 'SerialSend (find-package "RETURN_CONTROL")))
(unless (find-package "RETURN_CONTROL::SERIALSEND")
  (make-package "RETURN_CONTROL::SERIALSEND"))
(unless (find-package "RETURN_CONTROL::SERIALSENDREQUEST")
  (make-package "RETURN_CONTROL::SERIALSENDREQUEST"))
(unless (find-package "RETURN_CONTROL::SERIALSENDRESPONSE")
  (make-package "RETURN_CONTROL::SERIALSENDRESPONSE"))

(in-package "ROS")





(defclass return_control::SerialSendRequest
  :super ros::object
  :slots (_command _values ))

(defmethod return_control::SerialSendRequest
  (:init
   (&key
    ((:command __command) "")
    ((:values __values) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _command (string __command))
   (setq _values __values)
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ;; float32[] _values
    (* 4    (length _values)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; float32[] _values
     (write-long (length _values) s)
     (dotimes (i (length _values))
       (sys::poke (elt _values i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _values i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass return_control::SerialSendResponse
  :super ros::object
  :slots (_ack ))

(defmethod return_control::SerialSendResponse
  (:init
   (&key
    ((:ack __ack) 0)
    )
   (send-super :init)
   (setq _ack (round __ack))
   self)
  (:ack
   (&optional __ack)
   (if __ack (setq _ack __ack)) _ack)
  (:serialization-length
   ()
   (+
    ;; int16 _ack
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _ack
       (write-word _ack s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _ack
     (setq _ack (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass return_control::SerialSend
  :super ros::object
  :slots ())

(setf (get return_control::SerialSend :md5sum-) "7d12e4d9c96639392fbf6fb3d0d04203")
(setf (get return_control::SerialSend :datatype-) "return_control/SerialSend")
(setf (get return_control::SerialSend :request) return_control::SerialSendRequest)
(setf (get return_control::SerialSend :response) return_control::SerialSendResponse)

(defmethod return_control::SerialSendRequest
  (:response () (instance return_control::SerialSendResponse :init)))

(setf (get return_control::SerialSendRequest :md5sum-) "7d12e4d9c96639392fbf6fb3d0d04203")
(setf (get return_control::SerialSendRequest :datatype-) "return_control/SerialSendRequest")
(setf (get return_control::SerialSendRequest :definition-)
      "string command
float32[] values
---
int16 ack

")

(setf (get return_control::SerialSendResponse :md5sum-) "7d12e4d9c96639392fbf6fb3d0d04203")
(setf (get return_control::SerialSendResponse :datatype-) "return_control/SerialSendResponse")
(setf (get return_control::SerialSendResponse :definition-)
      "string command
float32[] values
---
int16 ack

")



(provide :return_control/SerialSend "7d12e4d9c96639392fbf6fb3d0d04203")


