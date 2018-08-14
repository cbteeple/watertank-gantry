
(cl:in-package :asdf)

(defsystem "serial_test-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SerialSend" :depends-on ("_package_SerialSend"))
    (:file "_package_SerialSend" :depends-on ("_package"))
    (:file "serial_read" :depends-on ("_package_serial_read"))
    (:file "_package_serial_read" :depends-on ("_package"))
  ))