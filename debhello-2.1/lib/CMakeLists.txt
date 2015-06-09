add_library(sharedlib SHARED sharedlib.c)
# CMake will link the executables and shared libraries with full RPATH to all
# used libraries in the build tree by default. When installing, it will clear
# the RPATH of these targets so they are installed with an empty RPATH.
set_property(TARGET sharedlib PROPERTY VERSION "1.0.0")
set_property(TARGET sharedlib PROPERTY SOVERSION 1 )
install(TARGETS sharedlib LIBRARY DESTINATION lib)
install(FILES sharedlib.h DESTINATION include)
