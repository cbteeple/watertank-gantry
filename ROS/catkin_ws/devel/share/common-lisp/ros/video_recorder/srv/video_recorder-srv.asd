
(cl:in-package :asdf)

(defsystem "video_recorder-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cam_control" :depends-on ("_package_cam_control"))
    (:file "_package_cam_control" :depends-on ("_package"))
  ))