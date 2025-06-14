cmake_minimum_required(VERSION 3.15)
project(SimpleLib VERSION 1.0.0 LANGUAGES CXX)

# 设置安装前缀
set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/output" CACHE PATH "Installation directory")

# 创建库
add_library(simple_lib STATIC src/simple_lib.cpp)

# 包含头文件
target_include_directories(simple_lib PUBLIC include)

# 安装库和头文件到指定目录
install(TARGETS simple_lib
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)
install(DIRECTORY include/ DESTINATION include)