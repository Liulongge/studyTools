########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(simple_lib_FIND_QUIETLY)
    set(simple_lib_MESSAGE_MODE VERBOSE)
else()
    set(simple_lib_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/simple_libTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${simple_lib_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(simple_lib_VERSION_STRING "1.0.0")
set(simple_lib_INCLUDE_DIRS ${simple_lib_INCLUDE_DIRS_RELEASE} )
set(simple_lib_INCLUDE_DIR ${simple_lib_INCLUDE_DIRS_RELEASE} )
set(simple_lib_LIBRARIES ${simple_lib_LIBRARIES_RELEASE} )
set(simple_lib_DEFINITIONS ${simple_lib_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${simple_lib_BUILD_MODULES_PATHS_RELEASE} )
    message(${simple_lib_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


