# cmake needs this line
cmake_minimum_required(VERSION 3.1)

# Define project name
project(demo_project)

add_compile_options(-std=c++11 -fopenmp)

# Declare the executable target built from your sources
add_executable(demo main.cpp)


target_link_libraries(demo PRIVATE gomp)
