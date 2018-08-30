
(cl:in-package :asdf)

(defsystem "return_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "serial_data" :depends-on ("_package_serial_data"))
    (:file "_package_serial_data" :depends-on ("_package"))
    (:file "setpoint" :depends-on ("_package_setpoint"))
    (:file "_package_setpoint" :depends-on ("_package"))
  ))