;; Auto-generated. Do not edit!


(when (boundp 'video_recorder::cam_control)
  (if (not (find-package "VIDEO_RECORDER"))
    (make-package "VIDEO_RECORDER"))
  (shadow 'cam_control (find-package "VIDEO_RECORDER")))
(unless (find-package "VIDEO_RECORDER::CAM_CONTROL")
  (make-package "VIDEO_RECORDER::CAM_CONTROL"))
(unless (find-package "VIDEO_RECORDER::CAM_CONTROLREQUEST")
  (make-package "VIDEO_RECORDER::CAM_CONTROLREQUEST"))
(unless (find-package "VIDEO_RECORDER::CAM_CONTROLRESPONSE")
  (make-package "VIDEO_RECORDER::CAM_CONTROLRESPONSE"))

(in-package "ROS")





(defclass video_recorder::cam_controlRequest
  :super ros::object
  :slots (_settings ))

(defmethod video_recorder::cam_controlRequest
  (:init
   (&key
    ((:settings __settings) "")
    )
   (send-super :init)
   (setq _settings (string __settings))
   self)
  (:settings
   (&optional __settings)
   (if __settings (setq _settings __settings)) _settings)
  (:serialization-length
   ()
   (+
    ;; string _settings
    4 (length _settings)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _settings
       (write-long (length _settings) s) (princ _settings s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _settings
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _settings (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass video_recorder::cam_controlResponse
  :super ros::object
  :slots (_ack ))

(defmethod video_recorder::cam_controlResponse
  (:init
   (&key
    ((:ack __ack) 0)
    )
   (send-super :init)
   (setq _ack (round __ack))
   self)
  (:ack
   (&optional __ack)
   (if __ack (setq _ack __ack)) _ack)
  (:serialization-length
   ()
   (+
    ;; int16 _ack
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _ack
       (write-word _ack s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _ack
     (setq _ack (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass video_recorder::cam_control
  :super ros::object
  :slots ())

(setf (get video_recorder::cam_control :md5sum-) "d5be26e0dc9e08360fce9406fdf1866e")
(setf (get video_recorder::cam_control :datatype-) "video_recorder/cam_control")
(setf (get video_recorder::cam_control :request) video_recorder::cam_controlRequest)
(setf (get video_recorder::cam_control :response) video_recorder::cam_controlResponse)

(defmethod video_recorder::cam_controlRequest
  (:response () (instance video_recorder::cam_controlResponse :init)))

(setf (get video_recorder::cam_controlRequest :md5sum-) "d5be26e0dc9e08360fce9406fdf1866e")
(setf (get video_recorder::cam_controlRequest :datatype-) "video_recorder/cam_controlRequest")
(setf (get video_recorder::cam_controlRequest :definition-)
      "string settings
---
int16 ack

")

(setf (get video_recorder::cam_controlResponse :md5sum-) "d5be26e0dc9e08360fce9406fdf1866e")
(setf (get video_recorder::cam_controlResponse :datatype-) "video_recorder/cam_controlResponse")
(setf (get video_recorder::cam_controlResponse :definition-)
      "string settings
---
int16 ack

")



(provide :video_recorder/cam_control "d5be26e0dc9e08360fce9406fdf1866e")


