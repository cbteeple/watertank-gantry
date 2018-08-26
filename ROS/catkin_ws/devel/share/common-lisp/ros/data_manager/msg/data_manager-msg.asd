
(cl:in-package :asdf)

(defsystem "data_manager-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "metadata" :depends-on ("_package_metadata"))
    (:file "_package_metadata" :depends-on ("_package"))
  ))