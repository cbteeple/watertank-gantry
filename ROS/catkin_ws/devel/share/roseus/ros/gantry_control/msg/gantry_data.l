;; Auto-generated. Do not edit!


(when (boundp 'gantry_control::gantry_data)
  (if (not (find-package "GANTRY_CONTROL"))
    (make-package "GANTRY_CONTROL"))
  (shadow 'gantry_data (find-package "GANTRY_CONTROL")))
(unless (find-package "GANTRY_CONTROL::GANTRY_DATA")
  (make-package "GANTRY_CONTROL::GANTRY_DATA"))

(in-package "ROS")
;;//! \htmlinclude gantry_data.msg.html


(defclass gantry_control::gantry_data
  :super ros::object
  :slots (_milliseconds _rate _data ))

(defmethod gantry_control::gantry_data
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
    ;; int32[] _data
    (* 4    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _milliseconds
       (write-long _milliseconds s)
     ;; uint32 _rate
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
   ;; uint32 _rate
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

(setf (get gantry_control::gantry_data :md5sum-) "de3135af80b69505452faf10b8247a05")
(setf (get gantry_control::gantry_data :datatype-) "gantry_control/gantry_data")
(setf (get gantry_control::gantry_data :definition-)
      "uint32 milliseconds
uint32 rate
int32[] data

")



(provide :gantry_control/gantry_data "de3135af80b69505452faf10b8247a05")


