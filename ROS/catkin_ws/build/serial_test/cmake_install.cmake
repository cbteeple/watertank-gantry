# Install script for directory: /media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/serial_test

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/serial_test/msg" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/serial_test/msg/serial_data.msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/serial_test/srv" TYPE FILE FILES
    "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/serial_test/srv/serial_read.srv"
    "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/serial_test/srv/SerialSend.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/serial_test/cmake" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/serial_test/catkin_generated/installspace/serial_test-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/include/serial_test")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/share/roseus/ros/serial_test")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/share/common-lisp/ros/serial_test")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/share/gennodejs/ros/serial_test")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/lib/python2.7/dist-packages/serial_test")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/devel/lib/python2.7/dist-packages/serial_test")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/serial_test/catkin_generated/installspace/serial_test.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/serial_test/cmake" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/serial_test/catkin_generated/installspace/serial_test-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/serial_test/cmake" TYPE FILE FILES
    "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/serial_test/catkin_generated/installspace/serial_testConfig.cmake"
    "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/build/serial_test/catkin_generated/installspace/serial_testConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/serial_test" TYPE FILE FILES "/media/woodlab/DATAPART1/watertank-gantry/ROS/catkin_ws/src/serial_test/package.xml")
endif()

