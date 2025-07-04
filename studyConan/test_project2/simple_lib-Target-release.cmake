# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(simple_lib_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(simple_lib_FRAMEWORKS_FOUND_RELEASE "${simple_lib_FRAMEWORKS_RELEASE}" "${simple_lib_FRAMEWORK_DIRS_RELEASE}")

set(simple_lib_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET simple_lib_DEPS_TARGET)
    add_library(simple_lib_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET simple_lib_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${simple_lib_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${simple_lib_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### simple_lib_DEPS_TARGET to all of them
conan_package_library_targets("${simple_lib_LIBS_RELEASE}"    # libraries
                              "${simple_lib_LIB_DIRS_RELEASE}" # package_libdir
                              "${simple_lib_BIN_DIRS_RELEASE}" # package_bindir
                              "${simple_lib_LIBRARY_TYPE_RELEASE}"
                              "${simple_lib_IS_HOST_WINDOWS_RELEASE}"
                              simple_lib_DEPS_TARGET
                              simple_lib_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "simple_lib"    # package_name
                              "${simple_lib_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${simple_lib_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET simple_lib::simple_lib
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${simple_lib_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${simple_lib_LIBRARIES_TARGETS}>
                 )

    if("${simple_lib_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET simple_lib::simple_lib
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     simple_lib_DEPS_TARGET)
    endif()

    set_property(TARGET simple_lib::simple_lib
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${simple_lib_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET simple_lib::simple_lib
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${simple_lib_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET simple_lib::simple_lib
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${simple_lib_LIB_DIRS_RELEASE}>)
    set_property(TARGET simple_lib::simple_lib
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${simple_lib_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET simple_lib::simple_lib
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${simple_lib_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(simple_lib_LIBRARIES_RELEASE simple_lib::simple_lib)
