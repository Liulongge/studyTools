cmake_minimum_required (VERSION 3.0.0)
project (TinyXML_project VERSION 0.0.1)

set(PROJECT_NAME TinyXML)

aux_source_directory(. LIB_TinyXML_SRC)
ADD_LIBRARY(${PROJECT_NAME} STATIC ${LIB_TinyXML_SRC})