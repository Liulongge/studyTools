cmake_minimum_required (VERSION 3.0.0)
project (testTintXML_project VERSION 0.0.1)

set(PROJECT_NAME testTintXML)
add_executable(${PROJECT_NAME} test.cpp)
target_link_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/libs/)
target_link_libraries(${PROJECT_NAME} PUBLIC TinyXML)
target_include_directories(${PROJECT_NAME} PUBLIC libs/include)