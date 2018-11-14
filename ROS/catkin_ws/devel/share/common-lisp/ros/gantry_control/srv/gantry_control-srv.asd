
(cl:in-package :asdf)

(defsystem "gantry_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "gantry_send" :depends-on ("_package_gantry_send"))
    (:file "_package_gantry_send" :depends-on ("_package"))
    (:file "serial_read" :depends-on ("_package_serial_read"))
    (:file "_package_serial_read" :depends-on ("_package"))
    (:file "trajectory" :depends-on ("_package_trajectory"))
    (:file "_package_trajectory" :depends-on ("_package"))
  ))