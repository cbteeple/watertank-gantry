;; Auto-generated. Do not edit!


(when (boundp 'return_control::setpoint)
  (if (not (find-package "RETURN_CONTROL"))
    (make-package "RETURN_CONTROL"))
  (shadow 'setpoint (find-package "RETURN_CONTROL")))
(unless (find-package "RETURN_CONTROL::SETPOINT")
  (make-package "RETURN_CONTROL::SETPOINT"))

(in-package "ROS")
;;//! \htmlinclude setpoint.msg.html


(defclass return_control::setpoint
  :super ros::object
  :slots (_setpoint _time ))

(defmethod return_control::setpoint
  (:init
   (&key
    ((:setpoint __setpoint) 0.0)
    ((:time __time) 0.0)
    )
   (send-super :init)
   (setq _setpoint (float __setpoint))
   (setq _time (float __time))
   self)
  (:setpoint
   (&optional __setpoint)
   (if __setpoint (setq _setpoint __setpoint)) _setpoint)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; float32 _setpoint
    4
    ;; float32 _time
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _setpoint
       (sys::poke _setpoint (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _time
       (sys::poke _time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _setpoint
     (setq _setpoint (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _time
     (setq _time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get return_control::setpoint :md5sum-) "69dccf7b66123a7863bfbf542606a1d6")
(setf (get return_control::setpoint :datatype-) "return_control/setpoint")
(setf (get return_control::setpoint :definition-)
      "float32 setpoint
float32 time



")



(provide :return_control/setpoint "69dccf7b66123a7863bfbf542606a1d6")


