;; Auto-generated. Do not edit!


(when (boundp 'gantry_control::to_gantry)
  (if (not (find-package "GANTRY_CONTROL"))
    (make-package "GANTRY_CONTROL"))
  (shadow 'to_gantry (find-package "GANTRY_CONTROL")))
(unless (find-package "GANTRY_CONTROL::TO_GANTRY")
  (make-package "GANTRY_CONTROL::TO_GANTRY"))

(in-package "ROS")
;;//! \htmlinclude to_gantry.msg.html


(defclass gantry_control::to_gantry
  :super ros::object
  :slots (_message ))

(defmethod gantry_control::to_gantry
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get gantry_control::to_gantry :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get gantry_control::to_gantry :datatype-) "gantry_control/to_gantry")
(setf (get gantry_control::to_gantry :definition-)
      "string message

")



(provide :gantry_control/to_gantry "5f003d6bcc824cbd51361d66d8e4f76c")

