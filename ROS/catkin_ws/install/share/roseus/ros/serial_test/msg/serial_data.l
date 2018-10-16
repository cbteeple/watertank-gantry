;; Auto-generated. Do not edit!


(when (boundp 'serial_test::serial_data)
  (if (not (find-package "SERIAL_TEST"))
    (make-package "SERIAL_TEST"))
  (shadow 'serial_data (find-package "SERIAL_TEST")))
(unless (find-package "SERIAL_TEST::SERIAL_DATA")
  (make-package "SERIAL_TEST::SERIAL_DATA"))

(in-package "ROS")
;;//! \htmlinclude serial_data.msg.html


(defclass serial_test::serial_data
  :super ros::object
  :slots (_milliseconds _rate _data ))

(defmethod serial_test::serial_data
  (:init
   (&key
    ((:milliseconds __milliseconds) 0)
    ((:rate __rate) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _milliseconds (round __milliseconds))
   (setq _rate (round __rate))
   (setq _data __data)
   self)
  (:milliseconds
   (&optional __milliseconds)
   (if __milliseconds (setq _milliseconds __milliseconds)) _milliseconds)
  (:rate
   (&optional __rate)
   (if __rate (setq _rate __rate)) _rate)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; uint32 _milliseconds
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
     ;; uint32 _milliseconds
       (write-long _milliseconds s)
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
   ;; uint32 _milliseconds
     (setq _milliseconds (sys::peek buf ptr- :integer)) (incf ptr- 4)
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

(setf (get serial_test::serial_data :md5sum-) "1dbb12ecfd1d112426442f51a9aecd31")
(setf (get serial_test::serial_data :datatype-) "serial_test/serial_data")
(setf (get serial_test::serial_data :definition-)
      "uint32 milliseconds
uint32 rate
uint16[] data

")



(provide :serial_test/serial_data "1dbb12ecfd1d112426442f51a9aecd31")

