########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(simple_lib_COMPONENT_NAMES "")
if(DEFINED simple_lib_FIND_DEPENDENCY_NAMES)
  list(APPEND simple_lib_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES simple_lib_FIND_DEPENDENCY_NAMES)
else()
  set(simple_lib_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(simple_lib_PACKAGE_FOLDER_RELEASE "/Users/runge.liu/.conan2/p/b/simpld5b863dd11e25/p")
set(simple_lib_BUILD_MODULES_PATHS_RELEASE )


set(simple_lib_INCLUDE_DIRS_RELEASE "${simple_lib_PACKAGE_FOLDER_RELEASE}/include")
set(simple_lib_RES_DIRS_RELEASE )
set(simple_lib_DEFINITIONS_RELEASE )
set(simple_lib_SHARED_LINK_FLAGS_RELEASE )
set(simple_lib_EXE_LINK_FLAGS_RELEASE )
set(simple_lib_OBJECTS_RELEASE )
set(simple_lib_COMPILE_DEFINITIONS_RELEASE )
set(simple_lib_COMPILE_OPTIONS_C_RELEASE )
set(simple_lib_COMPILE_OPTIONS_CXX_RELEASE )
set(simple_lib_LIB_DIRS_RELEASE "${simple_lib_PACKAGE_FOLDER_RELEASE}/lib")
set(simple_lib_BIN_DIRS_RELEASE )
set(simple_lib_LIBRARY_TYPE_RELEASE UNKNOWN)
set(simple_lib_IS_HOST_WINDOWS_RELEASE 0)
set(simple_lib_LIBS_RELEASE simple_lib)
set(simple_lib_SYSTEM_LIBS_RELEASE )
set(simple_lib_FRAMEWORK_DIRS_RELEASE )
set(simple_lib_FRAMEWORKS_RELEASE )
set(simple_lib_BUILD_DIRS_RELEASE )
set(simple_lib_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(simple_lib_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${simple_lib_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${simple_lib_COMPILE_OPTIONS_C_RELEASE}>")
set(simple_lib_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${simple_lib_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${simple_lib_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${simple_lib_EXE_LINK_FLAGS_RELEASE}>")


set(simple_lib_COMPONENTS_RELEASE )