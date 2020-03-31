cmake_minimum_required(VERSION 3.9)
project(jbig2dec C)

set(CMAKE_DEBUG_POSTFIX d)

file(GLOB SOURCES jbig2*.c)
list(REMOVE_ITEM SOURCES
  "${CMAKE_CURRENT_SOURCE_DIR}/jbig2dec.c"
)

add_library(jbig2dec ${SOURCES})

install(TARGETS jbig2dec
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)

install(FILES jbig2.h DESTINATION include)
