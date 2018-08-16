;; Auto-generated. Do not edit!


(when (boundp 'gantry_control::gantry_send)
  (if (not (find-package "GANTRY_CONTROL"))
    (make-package "GANTRY_CONTROL"))
  (shadow 'gantry_send (find-package "GANTRY_CONTROL")))
(unless (find-package "GANTRY_CONTROL::GANTRY_SEND")
  (make-package "GANTRY_CONTROL::GANTRY_SEND"))
(unless (find-package "GANTRY_CONTROL::GANTRY_SENDREQUEST")
  (make-package "GANTRY_CONTROL::GANTRY_SENDREQUEST"))
(unless (find-package "GANTRY_CONTROL::GANTRY_SENDRESPONSE")
  (make-package "GANTRY_CONTROL::GANTRY_SENDRESPONSE"))

(in-package "ROS")





(defclass gantry_control::gantry_sendRequest
  :super ros::object
  :slots (_command _type _path ))

(defmethod gantry_control::gantry_sendRequest
  (:init
   (&key
    ((:command __command) "")
    ((:type __type) "")
    ((:path __path) "")
    )
   (send-super :init)
   (setq _command (string __command))
   (setq _type (string __type))
   (setq _path (string __path))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ;; string _type
    4 (length _type)
    ;; string _path
    4 (length _path)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; string _path
       (write-long (length _path) s) (princ _path s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass gantry_control::gantry_sendResponse
  :super ros::object
  :slots (_ack ))

(defmethod gantry_control::gantry_sendResponse
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

(defclass gantry_control::gantry_send
  :super ros::object
  :slots ())

(setf (get gantry_control::gantry_send :md5sum-) "21afae2465c27c8fc1d2797f773bd384")
(setf (get gantry_control::gantry_send :datatype-) "gantry_control/gantry_send")
(setf (get gantry_control::gantry_send :request) gantry_control::gantry_sendRequest)
(setf (get gantry_control::gantry_send :response) gantry_control::gantry_sendResponse)

(defmethod gantry_control::gantry_sendRequest
  (:response () (instance gantry_control::gantry_sendResponse :init)))

(setf (get gantry_control::gantry_sendRequest :md5sum-) "21afae2465c27c8fc1d2797f773bd384")
(setf (get gantry_control::gantry_sendRequest :datatype-) "gantry_control/gantry_sendRequest")
(setf (get gantry_control::gantry_sendRequest :definition-)
      "string command
string type
string path
---
int16 ack

")

(setf (get gantry_control::gantry_sendResponse :md5sum-) "21afae2465c27c8fc1d2797f773bd384")
(setf (get gantry_control::gantry_sendResponse :datatype-) "gantry_control/gantry_sendResponse")
(setf (get gantry_control::gantry_sendResponse :definition-)
      "string command
string type
string path
---
int16 ack

")



(provide :gantry_control/gantry_send "21afae2465c27c8fc1d2797f773bd384")


