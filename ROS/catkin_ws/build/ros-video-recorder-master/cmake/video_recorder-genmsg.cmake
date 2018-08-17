# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "video_recorder: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(video_recorder_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv" NAME_WE)
add_custom_target(_video_recorder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "video_recorder" "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(video_recorder
  "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/video_recorder
)

### Generating Module File
_generate_module_cpp(video_recorder
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/video_recorder
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(video_recorder_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(video_recorder_generate_messages video_recorder_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv" NAME_WE)
add_dependencies(video_recorder_generate_messages_cpp _video_recorder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(video_recorder_gencpp)
add_dependencies(video_recorder_gencpp video_recorder_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS video_recorder_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(video_recorder
  "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/video_recorder
)

### Generating Module File
_generate_module_eus(video_recorder
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/video_recorder
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(video_recorder_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(video_recorder_generate_messages video_recorder_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv" NAME_WE)
add_dependencies(video_recorder_generate_messages_eus _video_recorder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(video_recorder_geneus)
add_dependencies(video_recorder_geneus video_recorder_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS video_recorder_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(video_recorder
  "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/video_recorder
)

### Generating Module File
_generate_module_lisp(video_recorder
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/video_recorder
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(video_recorder_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(video_recorder_generate_messages video_recorder_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv" NAME_WE)
add_dependencies(video_recorder_generate_messages_lisp _video_recorder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(video_recorder_genlisp)
add_dependencies(video_recorder_genlisp video_recorder_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS video_recorder_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(video_recorder
  "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/video_recorder
)

### Generating Module File
_generate_module_nodejs(video_recorder
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/video_recorder
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(video_recorder_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(video_recorder_generate_messages video_recorder_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv" NAME_WE)
add_dependencies(video_recorder_generate_messages_nodejs _video_recorder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(video_recorder_gennodejs)
add_dependencies(video_recorder_gennodejs video_recorder_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS video_recorder_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(video_recorder
  "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_recorder
)

### Generating Module File
_generate_module_py(video_recorder
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_recorder
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(video_recorder_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(video_recorder_generate_messages video_recorder_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv" NAME_WE)
add_dependencies(video_recorder_generate_messages_py _video_recorder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(video_recorder_genpy)
add_dependencies(video_recorder_genpy video_recorder_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS video_recorder_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/video_recorder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/video_recorder
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(video_recorder_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/video_recorder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/video_recorder
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(video_recorder_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/video_recorder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/video_recorder
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(video_recorder_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/video_recorder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/video_recorder
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(video_recorder_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_recorder)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_recorder\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/video_recorder
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(video_recorder_generate_messages_py std_msgs_generate_messages_py)
endif()
