;; Auto-generated. Do not edit!


(when (boundp 'gantry_control::runFile)
  (if (not (find-package "GANTRY_CONTROL"))
    (make-package "GANTRY_CONTROL"))
  (shadow 'runFile (find-package "GANTRY_CONTROL")))
(unless (find-package "GANTRY_CONTROL::RUNFILE")
  (make-package "GANTRY_CONTROL::RUNFILE"))

(in-package "ROS")
;;//! \htmlinclude runFile.msg.html


(defclass gantry_control::runFile
  :super ros::object
  :slots (_filename ))

(defmethod gantry_control::runFile
  (:init
   (&key
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _filename (string __filename))
   self)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get gantry_control::runFile :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get gantry_control::runFile :datatype-) "gantry_control/runFile")
(setf (get gantry_control::runFile :definition-)
      "string filename

")



(provide :gantry_control/runFile "030824f52a0628ead956fb9d67e66ae9")


