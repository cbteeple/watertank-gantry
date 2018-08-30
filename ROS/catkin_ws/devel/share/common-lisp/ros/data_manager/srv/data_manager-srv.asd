
(cl:in-package :asdf)

(defsystem "data_manager-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "bag_update" :depends-on ("_package_bag_update"))
    (:file "_package_bag_update" :depends-on ("_package"))
    (:file "trajectory" :depends-on ("_package_trajectory"))
    (:file "_package_trajectory" :depends-on ("_package"))
  ))