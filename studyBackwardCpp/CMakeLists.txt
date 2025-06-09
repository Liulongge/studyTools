# cmake_minimum_required(VERSION 3.10)
# project(backward_demo)

# set(CMAKE_CXX_STANDARD 17)

# # 添加可执行文件
# add_executable(${PROJECT_NAME} src/main.cpp)

# # 添加backward-cpp
# option(USE_BACKWARD_CPP "Use backward-cpp for stack traces" ON)

# if(USE_BACKWARD_CPP)
#     # 设置backward-cpp路径
#     set(BACKWARD_CPP_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/backward-cpp)
    
#     # 添加backward-cpp源文件
#     target_sources(${PROJECT_NAME} PRIVATE ${BACKWARD_CPP_DIR}/backward.cpp)
    
#     # 包含头文件目录
#     target_include_directories(${PROJECT_NAME} PRIVATE ${BACKWARD_CPP_DIR})
    
#     # 根据不同平台设置链接库
#     if(UNIX AND NOT APPLE)
#         target_link_libraries(${PROJECT_NAME} PRIVATE dl)
#     elseif(APPLE)
#         # macOS不需要额外链接
#     elseif(WIN32)
#         target_link_libraries(${PROJECT_NAME} PRIVATE Dbghelp)
#     endif()
    
#     # 定义宏以便backward-cpp知道是静态链接
#     target_compile_definitions(${PROJECT_NAME} PRIVATE BACKWARD_HAS_DW=1)
# endif()




cmake_minimum_required(VERSION 3.14)
project(backward_demo)

set(CMAKE_CXX_STANDARD 17)

# 使用FetchContent获取backward-cpp
include(FetchContent)
FetchContent_Declare(
    backward-cpp
    GIT_REPOSITORY https://github.com/bombela/backward-cpp.git
    GIT_TAG v1.6
)
FetchContent_MakeAvailable(backward-cpp)

# 添加可执行文件
add_executable(${PROJECT_NAME} src/main.cpp)

# 链接backward-cpp
target_link_libraries(${PROJECT_NAME} PRIVATE backward)

# 根据不同平台设置链接库
if(UNIX AND NOT APPLE)
    target_link_libraries(${PROJECT_NAME} PRIVATE dl)
elseif(WIN32)
    target_link_libraries(${PROJECT_NAME} PRIVATE Dbghelp)
endif()