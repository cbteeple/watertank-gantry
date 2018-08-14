;; Auto-generated. Do not edit!


(when (boundp 'serial_test::SerialSend)
  (if (not (find-package "SERIAL_TEST"))
    (make-package "SERIAL_TEST"))
  (shadow 'SerialSend (find-package "SERIAL_TEST")))
(unless (find-package "SERIAL_TEST::SERIALSEND")
  (make-package "SERIAL_TEST::SERIALSEND"))
(unless (find-package "SERIAL_TEST::SERIALSENDREQUEST")
  (make-package "SERIAL_TEST::SERIALSENDREQUEST"))
(unless (find-package "SERIAL_TEST::SERIALSENDRESPONSE")
  (make-package "SERIAL_TEST::SERIALSENDRESPONSE"))

(in-package "ROS")





(defclass serial_test::SerialSendRequest
  :super ros::object
  :slots (_command ))

(defmethod serial_test::SerialSendRequest
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

(defclass serial_test::SerialSendResponse
  :super ros::object
  :slots (_ack ))

(defmethod serial_test::SerialSendResponse
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

(defclass serial_test::SerialSend
  :super ros::object
  :slots ())

(setf (get serial_test::SerialSend :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get serial_test::SerialSend :datatype-) "serial_test/SerialSend")
(setf (get serial_test::SerialSend :request) serial_test::SerialSendRequest)
(setf (get serial_test::SerialSend :response) serial_test::SerialSendResponse)

(defmethod serial_test::SerialSendRequest
  (:response () (instance serial_test::SerialSendResponse :init)))

(setf (get serial_test::SerialSendRequest :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get serial_test::SerialSendRequest :datatype-) "serial_test/SerialSendRequest")
(setf (get serial_test::SerialSendRequest :definition-)
      "int16 command
---
int16 ack

")

(setf (get serial_test::SerialSendResponse :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get serial_test::SerialSendResponse :datatype-) "serial_test/SerialSendResponse")
(setf (get serial_test::SerialSendResponse :definition-)
      "int16 command
---
int16 ack

")



(provide :serial_test/SerialSend "4a85f0858e5941ef92944e5dd453320b")


