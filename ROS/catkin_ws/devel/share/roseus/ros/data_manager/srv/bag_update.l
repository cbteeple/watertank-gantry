;; Auto-generated. Do not edit!


(when (boundp 'data_manager::bag_update)
  (if (not (find-package "DATA_MANAGER"))
    (make-package "DATA_MANAGER"))
  (shadow 'bag_update (find-package "DATA_MANAGER")))
(unless (find-package "DATA_MANAGER::BAG_UPDATE")
  (make-package "DATA_MANAGER::BAG_UPDATE"))
(unless (find-package "DATA_MANAGER::BAG_UPDATEREQUEST")
  (make-package "DATA_MANAGER::BAG_UPDATEREQUEST"))
(unless (find-package "DATA_MANAGER::BAG_UPDATERESPONSE")
  (make-package "DATA_MANAGER::BAG_UPDATERESPONSE"))

(in-package "ROS")





(defclass data_manager::bag_updateRequest
  :super ros::object
  :slots (_filename ))

(defmethod data_manager::bag_updateRequest
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

(defclass data_manager::bag_updateResponse
  :super ros::object
  :slots ())

(defmethod data_manager::bag_updateResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass data_manager::bag_update
  :super ros::object
  :slots ())

(setf (get data_manager::bag_update :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get data_manager::bag_update :datatype-) "data_manager/bag_update")
(setf (get data_manager::bag_update :request) data_manager::bag_updateRequest)
(setf (get data_manager::bag_update :response) data_manager::bag_updateResponse)

(defmethod data_manager::bag_updateRequest
  (:response () (instance data_manager::bag_updateResponse :init)))

(setf (get data_manager::bag_updateRequest :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get data_manager::bag_updateRequest :datatype-) "data_manager/bag_updateRequest")
(setf (get data_manager::bag_updateRequest :definition-)
      "string filename
---
")

(setf (get data_manager::bag_updateResponse :md5sum-) "030824f52a0628ead956fb9d67e66ae9")
(setf (get data_manager::bag_updateResponse :datatype-) "data_manager/bag_updateResponse")
(setf (get data_manager::bag_updateResponse :definition-)
      "string filename
---
")



(provide :data_manager/bag_update "030824f52a0628ead956fb9d67e66ae9")


