cmake_minimum_required (VERSION 3.0.0)
project (gtest_project VERSION 0.0.1)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 ")
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Os -fPIC")

set(PROJECT_NAME gtest)

add_executable(${PROJECT_NAME} main.cpp src/test_01.cpp) 

target_link_directories(gtest PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/libs/)

target_link_libraries(${PROJECT_NAME}  libgtest.a)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include )

