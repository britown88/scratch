# Add all source files to one variable
file(GLOB scratch_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")
# Add all header files, including the ones from our dependencies into a variable
file(GLOB scratch_HEADERS ${SDL_BINARY_DIR}/include/SDL2
     ${SDL_BINARY_DIR}/include-config-/SDL2 ${imgui_SOURCE_DIR}
     ${stb_SOURCE_DIR})

add_executable(scratch ${scratch_SOURCES})

target_link_libraries(scratch PRIVATE SDL2::SDL2 box2d scratch_imgui GL)

target_include_directories(scratch PRIVATE ${scratch_HEADERS})
