# scratch

## Build Instructions

### CMake presets:

- `windows-cl-release` (windows)
- `windows-cl-debug` (windows)
- `windows-clang-release` (windows)
- `windows-clang-debug` (windows)
- `unixlike-clang-release` (linux, macos)
- `unixlike-clang-debug` (linux, macos)
- `unixlike-gcc-release` (linux, macos)
- `unixlike-gcc-debug` (linux, macos)

### Windows:

- Ensure you have the `Linux development with C++` components installed in Visual Studio
- `git clone https://github.com/britown88/scratch.git`
- Open the repository in Visual Studio 2022
- Visual Studio will list all available build configurations once the CMake processed the project
- Click The Green Local Windows Debugger button top center
- Start coding in scratch/main.cpp

### Microsoft C++ Build Tools:

- [Install Microsoft C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)
- Run the Visual Studio Tools Command Prompt of your choice
- `git clone https://github.com/britown88/scratch.git`
- `cd scratch`
- `cmake --preset=<preset> -S . -B build`
- `cmake --build build`

## Ubuntu/Debian Linux Instructions:

- Install prerequisites: `sudo apt-get install git build-essential clang ninja`
- Your system might require some additional packages for building SDL2 - check `.github/workflows/cmake-multi-platform.yml` for an up-to-date list
- `git clone https://github.com/britown88/scratch.git`
- `cd scratch`
- `cmake --preset=<preset> -S . -B build`
- `cmake --build build`

## macOS Instructions:

- Install prerequisites: `brew install git make gcc coreutils ninja`
- `git clone https://github.com/britown88/scratch.git`
- `cd scratch`
- `cmake --preset=<preset> -S . -B build`
- `cmake --build build`
