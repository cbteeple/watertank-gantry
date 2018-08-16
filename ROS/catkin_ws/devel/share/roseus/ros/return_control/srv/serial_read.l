;; Auto-generated. Do not edit!


(when (boundp 'return_control::serial_read)
  (if (not (find-package "RETURN_CONTROL"))
    (make-package "RETURN_CONTROL"))
  (shadow 'serial_read (find-package "RETURN_CONTROL")))
(unless (find-package "RETURN_CONTROL::SERIAL_READ")
  (make-package "RETURN_CONTROL::SERIAL_READ"))
(unless (find-package "RETURN_CONTROL::SERIAL_READREQUEST")
  (make-package "RETURN_CONTROL::SERIAL_READREQUEST"))
(unless (find-package "RETURN_CONTROL::SERIAL_READRESPONSE")
  (make-package "RETURN_CONTROL::SERIAL_READRESPONSE"))

(in-package "ROS")





(defclass return_control::serial_readRequest
  :super ros::object
  :slots ())

(defmethod return_control::serial_readRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass return_control::serial_readResponse
  :super ros::object
  :slots (_miliseconds _rate _data ))

(defmethod return_control::serial_readResponse
  (:init
   (&key
    ((:miliseconds __miliseconds) 0)
    ((:rate __rate) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _miliseconds (round __miliseconds))
   (setq _rate (round __rate))
   (setq _data __data)
   self)
  (:miliseconds
   (&optional __miliseconds)
   (if __miliseconds (setq _miliseconds __miliseconds)) _miliseconds)
  (:rate
   (&optional __rate)
   (if __rate (setq _rate __rate)) _rate)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; uint32 _miliseconds
    4
    ;; uint32 _rate
    4
    ;; uint16[] _data
    (* 2    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _miliseconds
       (write-long _miliseconds s)
     ;; uint32 _rate
       (write-long _rate s)
     ;; uint16[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-word (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _miliseconds
     (setq _miliseconds (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _rate
     (setq _rate (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(defclass return_control::serial_read
  :super ros::object
  :slots ())

(setf (get return_control::serial_read :md5sum-) "b191cc1f130fc908db72dc38712947ff")
(setf (get return_control::serial_read :datatype-) "return_control/serial_read")
(setf (get return_control::serial_read :request) return_control::serial_readRequest)
(setf (get return_control::serial_read :response) return_control::serial_readResponse)

(defmethod return_control::serial_readRequest
  (:response () (instance return_control::serial_readResponse :init)))

(setf (get return_control::serial_readRequest :md5sum-) "b191cc1f130fc908db72dc38712947ff")
(setf (get return_control::serial_readRequest :datatype-) "return_control/serial_readRequest")
(setf (get return_control::serial_readRequest :definition-)
      "
---
uint32 miliseconds
uint32 rate
uint16[] data

")

(setf (get return_control::serial_readResponse :md5sum-) "b191cc1f130fc908db72dc38712947ff")
(setf (get return_control::serial_readResponse :datatype-) "return_control/serial_readResponse")
(setf (get return_control::serial_readResponse :definition-)
      "
---
uint32 miliseconds
uint32 rate
uint16[] data

")



(provide :return_control/serial_read "b191cc1f130fc908db72dc38712947ff")


