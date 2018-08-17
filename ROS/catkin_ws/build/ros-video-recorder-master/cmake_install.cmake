# Install script for directory: /media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/video_recorder/srv" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/srv/cam_control.srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/video_recorder/cmake" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/ros-video-recorder-master/catkin_generated/installspace/video_recorder-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/include/video_recorder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/share/roseus/ros/video_recorder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/share/common-lisp/ros/video_recorder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/share/gennodejs/ros/video_recorder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/lib/python2.7/dist-packages/video_recorder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/lib/python2.7/dist-packages/video_recorder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/ros-video-recorder-master/catkin_generated/installspace/video_recorder.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/video_recorder/cmake" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/ros-video-recorder-master/catkin_generated/installspace/video_recorder-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/video_recorder/cmake" TYPE FILE FILES
    "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/ros-video-recorder-master/catkin_generated/installspace/video_recorderConfig.cmake"
    "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/ros-video-recorder-master/catkin_generated/installspace/video_recorderConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/video_recorder" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/ros-video-recorder-master/package.xml")
endif()

