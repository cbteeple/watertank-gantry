;; Auto-generated. Do not edit!


(when (boundp 'serial_test::serial_send)
  (if (not (find-package "SERIAL_TEST"))
    (make-package "SERIAL_TEST"))
  (shadow 'serial_send (find-package "SERIAL_TEST")))
(unless (find-package "SERIAL_TEST::SERIAL_SEND")
  (make-package "SERIAL_TEST::SERIAL_SEND"))
(unless (find-package "SERIAL_TEST::SERIAL_SENDREQUEST")
  (make-package "SERIAL_TEST::SERIAL_SENDREQUEST"))
(unless (find-package "SERIAL_TEST::SERIAL_SENDRESPONSE")
  (make-package "SERIAL_TEST::SERIAL_SENDRESPONSE"))

(in-package "ROS")





(defclass serial_test::serial_sendRequest
  :super ros::object
  :slots (_command ))

(defmethod serial_test::serial_sendRequest
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

(defclass serial_test::serial_sendResponse
  :super ros::object
  :slots (_ack ))

(defmethod serial_test::serial_sendResponse
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

(defclass serial_test::serial_send
  :super ros::object
  :slots ())

(setf (get serial_test::serial_send :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get serial_test::serial_send :datatype-) "serial_test/serial_send")
(setf (get serial_test::serial_send :request) serial_test::serial_sendRequest)
(setf (get serial_test::serial_send :response) serial_test::serial_sendResponse)

(defmethod serial_test::serial_sendRequest
  (:response () (instance serial_test::serial_sendResponse :init)))

(setf (get serial_test::serial_sendRequest :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get serial_test::serial_sendRequest :datatype-) "serial_test/serial_sendRequest")
(setf (get serial_test::serial_sendRequest :definition-)
      "int16 command
---
int16 ack

")

(setf (get serial_test::serial_sendResponse :md5sum-) "4a85f0858e5941ef92944e5dd453320b")
(setf (get serial_test::serial_sendResponse :datatype-) "serial_test/serial_sendResponse")
(setf (get serial_test::serial_sendResponse :definition-)
      "int16 command
---
int16 ack

")



(provide :serial_test/serial_send "4a85f0858e5941ef92944e5dd453320b")


