# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/simple_lib-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${simple_lib_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${simple_lib_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET simple_lib::simple_lib)
    add_library(simple_lib::simple_lib INTERFACE IMPORTED)
    message(${simple_lib_MESSAGE_MODE} "Conan: Target declared 'simple_lib::simple_lib'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/simple_lib-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()