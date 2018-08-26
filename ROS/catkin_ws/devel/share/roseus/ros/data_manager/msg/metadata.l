;; Auto-generated. Do not edit!


(when (boundp 'data_manager::metadata)
  (if (not (find-package "DATA_MANAGER"))
    (make-package "DATA_MANAGER"))
  (shadow 'metadata (find-package "DATA_MANAGER")))
(unless (find-package "DATA_MANAGER::METADATA")
  (make-package "DATA_MANAGER::METADATA"))

(in-package "ROS")
;;//! \htmlinclude metadata.msg.html


(defclass data_manager::metadata
  :super ros::object
  :slots (_traj_folder _test_type _curr_file ))

(defmethod data_manager::metadata
  (:init
   (&key
    ((:traj_folder __traj_folder) "")
    ((:test_type __test_type) "")
    ((:curr_file __curr_file) "")
    )
   (send-super :init)
   (setq _traj_folder (string __traj_folder))
   (setq _test_type (string __test_type))
   (setq _curr_file (string __curr_file))
   self)
  (:traj_folder
   (&optional __traj_folder)
   (if __traj_folder (setq _traj_folder __traj_folder)) _traj_folder)
  (:test_type
   (&optional __test_type)
   (if __test_type (setq _test_type __test_type)) _test_type)
  (:curr_file
   (&optional __curr_file)
   (if __curr_file (setq _curr_file __curr_file)) _curr_file)
  (:serialization-length
   ()
   (+
    ;; string _traj_folder
    4 (length _traj_folder)
    ;; string _test_type
    4 (length _test_type)
    ;; string _curr_file
    4 (length _curr_file)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _traj_folder
       (write-long (length _traj_folder) s) (princ _traj_folder s)
     ;; string _test_type
       (write-long (length _test_type) s) (princ _test_type s)
     ;; string _curr_file
       (write-long (length _curr_file) s) (princ _curr_file s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _traj_folder
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _traj_folder (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _test_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _test_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _curr_file
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _curr_file (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get data_manager::metadata :md5sum-) "f0a7f8ee6e43bf6a0f98c30689b71546")
(setf (get data_manager::metadata :datatype-) "data_manager/metadata")
(setf (get data_manager::metadata :definition-)
      "string traj_folder
string test_type
string curr_file
")



(provide :data_manager/metadata "f0a7f8ee6e43bf6a0f98c30689b71546")


