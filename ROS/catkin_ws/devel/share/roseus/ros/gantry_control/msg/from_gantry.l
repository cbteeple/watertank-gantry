;; Auto-generated. Do not edit!


(when (boundp 'gantry_control::from_gantry)
  (if (not (find-package "GANTRY_CONTROL"))
    (make-package "GANTRY_CONTROL"))
  (shadow 'from_gantry (find-package "GANTRY_CONTROL")))
(unless (find-package "GANTRY_CONTROL::FROM_GANTRY")
  (make-package "GANTRY_CONTROL::FROM_GANTRY"))

(in-package "ROS")
;;//! \htmlinclude from_gantry.msg.html


(defclass gantry_control::from_gantry
  :super ros::object
  :slots (_response _position ))

(defmethod gantry_control::from_gantry
  (:init
   (&key
    ((:response __response) "")
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _response (string __response))
   (setq _position __position)
   self)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; string _response
    4 (length _response)
    ;; float32[] _position
    (* 4    (length _position)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _response
       (write-long (length _response) s) (princ _response s)
     ;; float32[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _response
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _response (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get gantry_control::from_gantry :md5sum-) "462b18e0de79f571e404f9b05e3ff8d0")
(setf (get gantry_control::from_gantry :datatype-) "gantry_control/from_gantry")
(setf (get gantry_control::from_gantry :definition-)
      "string response
float32[] position

")



(provide :gantry_control/from_gantry "462b18e0de79f571e404f9b05e3ff8d0")


