cmake_minimum_required(VERSION 3.10)
project(HelloNinja)

# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 17)

# 生成可执行文件
add_executable(hello_ninja src/main.cpp)

# 可选：指定 Ninja 生成器（也可通过命令行 -G 指定）
# set(CMAKE_GENERATOR "Ninja" CACHE INTERNAL "")