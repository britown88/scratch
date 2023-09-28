# download CPM.cmake
file(
  DOWNLOAD
  https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.38.3/CPM.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake
  EXPECTED_HASH
    SHA256=cc155ce02e7945e7b8967ddfaff0b050e958a723ef7aad3766d368940cb15494)

include(${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake)

cpmaddpackage("gh:ocornut/imgui#v1.89.9")
cpmaddpackage("gh:nothings/stb#5736b15f7ea0ffb08dd38af21067c314d6a3aae9")
cpmaddpackage("gh:erincatto/box2d#v2.4.1")
cpmaddpackage("gh:libsdl-org/SDL#release-2.28.3")

if(imgui_ADDED)
  file(GLOB imgui_SOURCES "${imgui_SOURCE_DIR}/*.cpp")
  add_library(scratch_imgui STATIC ${imgui_SOURCES})
  target_include_directories(scratch_imgui PUBLIC ${imgui_SOURCE_DIR})
endif()
