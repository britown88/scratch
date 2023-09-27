# scratch

## Windows Instructions:

### Visual Studio 2022:
- `git clone https://github.com/britown88/scratch.git`
- `cd scratch`
- `git submodule update --init`
- Open `scratch.sln` in Visual Studio 2022
- Click The Green Local Windows Debugger button top center
- Start coding in scratch/main.cpp

### Microsoft C++ Build Tools:
- [Install Microsoft C++ Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)
- Run the Visual Studio Tools Command Prompt of your choice
- `git clone https://github.com/britown88/scratch.git`
- `cd scratch`
- `git submodule update --init`
- `MSBuild "scratch.sln" /t:Clean,Build /p:Platform=x64 /p:Configuration=Release`

Notes:
- Platform can be `Win32` or `x64`
- Configuration can be `Debug` or `Release`

### Msys2:
- [Install Msys2](https://www.msys2.org/)
- Run your preferred MSYS2 MinGW environment
- Install prerequisites: `pacman -S git ${MINGW_PACKAGE_PREFIX}-gcc ${MINGW_PACKAGE_PREFIX}-SDL2`
- `git clone https://github.com/britown88/scratch.git`
- `cd scratch`
- `git submodule update --init`
- `make`
- The `scratch.exe` binary will end up in the `bin/` directory

## Ubuntu/Debian Linux Instructions:
- Install prerequisites: `sudo apt-get install git build-essential libsdl2-dev`
- `git clone https://github.com/britown88/scratch.git`
- `cd scratch`
- `git submodule update --init`
- `make`
- The `scratch` binary will end up in the `bin/` directory
