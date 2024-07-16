execute_process(COMMAND "/home/syt/tianbot_ws/build/tianracer/tianracer_gps/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/syt/tianbot_ws/build/tianracer/tianracer_gps/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
