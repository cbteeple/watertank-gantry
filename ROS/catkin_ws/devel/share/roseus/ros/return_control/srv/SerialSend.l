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
  :slots (_command ))

(defmethod return_control::SerialSendRequest
  (:init
   (&key
    ((:command __command) 0)
    )
   (send-super :init)
   (setq _command (round __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; int16 _command
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _command
       (write-word _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _command
     (setq _command (sys::peek buf ptr- :short)) (incf ptr- 2)
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

(setf (get return_control::SerialSend :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get return_control::SerialSend :datatype-) "return_control/SerialSend")
(setf (get return_control::SerialSend :request) return_control::SerialSendRequest)
(setf (get return_control::SerialSend :response) return_control::SerialSendResponse)

(defmethod return_control::SerialSendRequest
  (:response () (instance return_control::SerialSendResponse :init)))

(setf (get return_control::SerialSendRequest :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get return_control::SerialSendRequest :datatype-) "return_control/SerialSendRequest")
(setf (get return_control::SerialSendRequest :definition-)
      "int16 command
---
int16 ack

")

(setf (get return_control::SerialSendResponse :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get return_control::SerialSendResponse :datatype-) "return_control/SerialSendResponse")
(setf (get return_control::SerialSendResponse :definition-)
      "int16 command
---
int16 ack

")



(provide :return_control/SerialSend "4a85f0858e5941ef92944e5dd453320b")


