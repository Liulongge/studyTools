cmake_minimum_required(VERSION 3.15)
project(TestProject2)

# 加载 Conan 生成的配置文件
include(./conan_toolchain.cmake)

# 查找 simple_lib 包
find_package(simple_lib REQUIRED PATHS "/Users/runge.liu/Documents/code/studyTools/studyConan/simple_lib/build")

# 添加可执行文件
add_executable(main main.cpp)

# 链接 simple_lib
target_link_libraries(main simple_lib::simple_lib)