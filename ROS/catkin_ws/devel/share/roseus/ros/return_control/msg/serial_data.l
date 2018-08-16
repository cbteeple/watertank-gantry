;; Auto-generated. Do not edit!


(when (boundp 'return_control::serial_data)
  (if (not (find-package "RETURN_CONTROL"))
    (make-package "RETURN_CONTROL"))
  (shadow 'serial_data (find-package "RETURN_CONTROL")))
(unless (find-package "RETURN_CONTROL::SERIAL_DATA")
  (make-package "RETURN_CONTROL::SERIAL_DATA"))

(in-package "ROS")
;;//! \htmlinclude serial_data.msg.html


(defclass return_control::serial_data
  :super ros::object
  :slots (_milliseconds _rate _data ))

(defmethod return_control::serial_data
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
    ;; int32 _rate
    4
    ;; int32[] _data
    (* 4    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _milliseconds
       (write-long _milliseconds s)
     ;; int32 _rate
       (write-long _rate s)
     ;; int32[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-long (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _milliseconds
     (setq _milliseconds (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _rate
     (setq _rate (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get return_control::serial_data :md5sum-) "708b64347fb146b1e49fddd9e079952d")
(setf (get return_control::serial_data :datatype-) "return_control/serial_data")
(setf (get return_control::serial_data :definition-)
      "uint32 milliseconds
int32 rate
int32[] data


")



(provide :return_control/serial_data "708b64347fb146b1e49fddd9e079952d")


