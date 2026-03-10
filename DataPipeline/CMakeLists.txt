cmake_minimum_required(VERSION 3.16)
project(DataPipeline VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(BUILD_TESTS "Build unit tests" ON)

# Conan интеграция
if(EXISTS "${CMAKE_BINARY_DIR}/generators/conan_toolchain.cmake")
    include("${CMAKE_BINARY_DIR}/generators/conan_toolchain.cmake")
endif()

# Основной исполняемый файл
add_executable(datapipeline
    src/main.cpp
    src/core/thread_pool.cpp
    src/core/message_queue.cpp
    src/core/pipeline.cpp
    src/processors/anomaly_detector.cpp
    src/storage/database.cpp
)
target_include_directories(datapipeline PRIVATE ${CMAKE_SOURCE_DIR}/src)

# Тесты
if(BUILD_TESTS)
    enable_testing()
    
    # Это найдёт таргеты от Conan
    find_package(GTest CONFIG)
    
    add_executable(tests
        tests/unit/test_queue.cpp
        tests/unit/test_thread_pool.cpp
        tests/unit/test_anomaly.cpp
    )
    
    target_include_directories(tests PRIVATE ${CMAKE_SOURCE_DIR}/src)
    
    # Правильные имена таргетов от Conan 2.x
    target_link_libraries(tests PRIVATE 
        GTest::gtest
        GTest::gtest_main
    )
    
    add_test(NAME unit_tests COMMAND tests)
endif()

message(STATUS "Compiler: ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")