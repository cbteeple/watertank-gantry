
(cl:in-package :asdf)

(defsystem "gantry_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "from_gantry" :depends-on ("_package_from_gantry"))
    (:file "_package_from_gantry" :depends-on ("_package"))
    (:file "to_gantry" :depends-on ("_package_to_gantry"))
    (:file "_package_to_gantry" :depends-on ("_package"))
  ))