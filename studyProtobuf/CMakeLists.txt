# cmake needs this line
cmake_minimum_required(VERSION 3.1)

# Define project name
project(protobuf_demo_project)

set(PROJECT_NAME protobuf_demo)
set (CMAKE_CXX_STANDARD 11) # 使用c++ 11标准

# Declare the executable target built from your sources
FILE (GLOB DIR_PB_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/protobufGenFiles/*.pb.cc" )
FILE (GLOB DIR_SRCS "${CMAKE_CURRENT_SOURCE_DIR}/test.cpp" )
SET (ALL_SRCS ${DIR_PB_SRCS} ${DIR_SRCS})
add_executable(protobuf_demo ${ALL_SRCS}) # 链接*.cc源文件 及 *.pb.cc文件

target_link_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/protobuf-21.5/build)
target_link_libraries(protobuf_demo PRIVATE protobuf)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/protobuf-21.5/src
                ${CMAKE_CURRENT_SOURCE_DIR}/protobufGenFiles) # 

# ./protobuf-21.5/build/protoc ./game.proto --cpp_out=.
# g++ -o main test.cpp game.pb.cc -std=c++11 -I ./protobuf-21.5/src/ -L ./protobuf-21.5/build -lprotobuf