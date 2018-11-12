;; Auto-generated. Do not edit!


(when (boundp 'gantry_control::currPos)
  (if (not (find-package "GANTRY_CONTROL"))
    (make-package "GANTRY_CONTROL"))
  (shadow 'currPos (find-package "GANTRY_CONTROL")))
(unless (find-package "GANTRY_CONTROL::CURRPOS")
  (make-package "GANTRY_CONTROL::CURRPOS"))

(in-package "ROS")
;;//! \htmlinclude currPos.msg.html


(defclass gantry_control::currPos
  :super ros::object
  :slots (_position ))

(defmethod gantry_control::currPos
  (:init
   (&key
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _position __position)
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; float32[] _position
    (* 4    (length _position)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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

(setf (get gantry_control::currPos :md5sum-) "8ec164ae840396df197eeb512c1b8515")
(setf (get gantry_control::currPos :datatype-) "gantry_control/currPos")
(setf (get gantry_control::currPos :definition-)
      "float32[] position

")



(provide :gantry_control/currPos "8ec164ae840396df197eeb512c1b8515")

