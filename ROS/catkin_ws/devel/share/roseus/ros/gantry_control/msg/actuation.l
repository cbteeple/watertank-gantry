;; Auto-generated. Do not edit!


(when (boundp 'gantry_control::actuation)
  (if (not (find-package "GANTRY_CONTROL"))
    (make-package "GANTRY_CONTROL"))
  (shadow 'actuation (find-package "GANTRY_CONTROL")))
(unless (find-package "GANTRY_CONTROL::ACTUATION")
  (make-package "GANTRY_CONTROL::ACTUATION"))

(in-package "ROS")
;;//! \htmlinclude actuation.msg.html


(defclass gantry_control::actuation
  :super ros::object
  :slots (_levels ))

(defmethod gantry_control::actuation
  (:init
   (&key
    ((:levels __levels) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _levels __levels)
   self)
  (:levels
   (&optional __levels)
   (if __levels (setq _levels __levels)) _levels)
  (:serialization-length
   ()
   (+
    ;; float32[] _levels
    (* 4    (length _levels)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _levels
     (write-long (length _levels) s)
     (dotimes (i (length _levels))
       (sys::poke (elt _levels i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _levels
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _levels (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _levels i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get gantry_control::actuation :md5sum-) "36506dab5a92e5be22a70802ef8ef9e7")
(setf (get gantry_control::actuation :datatype-) "gantry_control/actuation")
(setf (get gantry_control::actuation :definition-)
      "float32[] levels

")



(provide :gantry_control/actuation "36506dab5a92e5be22a70802ef8ef9e7")


