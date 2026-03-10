# CMake generated Testfile for 
# Source directory: D:/MY_first_project/DataPipeline
# Build directory: D:/MY_first_project/DataPipeline/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(unit_tests "D:/MY_first_project/DataPipeline/build/Debug/tests.exe")
  set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "D:/MY_first_project/DataPipeline/CMakeLists.txt;47;add_test;D:/MY_first_project/DataPipeline/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(unit_tests "D:/MY_first_project/DataPipeline/build/Release/tests.exe")
  set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "D:/MY_first_project/DataPipeline/CMakeLists.txt;47;add_test;D:/MY_first_project/DataPipeline/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(unit_tests "D:/MY_first_project/DataPipeline/build/MinSizeRel/tests.exe")
  set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "D:/MY_first_project/DataPipeline/CMakeLists.txt;47;add_test;D:/MY_first_project/DataPipeline/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(unit_tests "D:/MY_first_project/DataPipeline/build/RelWithDebInfo/tests.exe")
  set_tests_properties(unit_tests PROPERTIES  _BACKTRACE_TRIPLES "D:/MY_first_project/DataPipeline/CMakeLists.txt;47;add_test;D:/MY_first_project/DataPipeline/CMakeLists.txt;0;")
else()
  add_test(unit_tests NOT_AVAILABLE)
endif()
