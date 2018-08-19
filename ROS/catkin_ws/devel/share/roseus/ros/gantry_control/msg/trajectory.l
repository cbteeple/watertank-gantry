;; Auto-generated. Do not edit!


(when (boundp 'gantry_control::trajectory)
  (if (not (find-package "GANTRY_CONTROL"))
    (make-package "GANTRY_CONTROL"))
  (shadow 'trajectory (find-package "GANTRY_CONTROL")))
(unless (find-package "GANTRY_CONTROL::TRAJECTORY")
  (make-package "GANTRY_CONTROL::TRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude trajectory.msg.html


(defclass gantry_control::trajectory
  :super ros::object
  :slots (_position _speed ))

(defmethod gantry_control::trajectory
  (:init
   (&key
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _position __position)
   (setq _speed (float __speed))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float32[] _position
    (* 4    (length _position)) 4
    ;; float32 _speed
    4
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
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get gantry_control::trajectory :md5sum-) "bda8f7862e869dcca7a9693b5585ae02")
(setf (get gantry_control::trajectory :datatype-) "gantry_control/trajectory")
(setf (get gantry_control::trajectory :definition-)
      "float32[] position
float32 speed

")



(provide :gantry_control/trajectory "bda8f7862e869dcca7a9693b5585ae02")


