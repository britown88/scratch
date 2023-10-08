
DEBUG?=0
CLANG?=0
CROSS?=
RM:=rm -f

UNAME_S?=$(shell uname -s)
ifeq ($(UNAME_S), Darwin)
    UNAME_O?=Darwin
else
    UNAME_O?=$(shell uname -o)
endif

ifneq ($(GITHUB_ACTIONS), true)
    ifeq ($(CLANG), 1)
        CC:=clang
        CXX:=clang++
        STRIP:=llvm-strip
    else
        CC:=gcc
        CXX:=g++
        STRIP:=strip
    endif
endif

ifneq ($(CROSS),)
    CC:=$(CROSS)-$(CC)
    CXX:=$(CROSS)-$(CXX)
    STRIP:=$(CROSS)-$(STRIP)
endif

BASE_DIR:=..
SRC_DIR:=.
OBJ_DIR:=obj
BIN_DIR:=$(BASE_DIR)/bin

C_SRC:=stb_vorbis.c
CXX_SRC:=imgui_impl_opengl3.cpp \
    imgui_impl_sdl2.cpp \
    main.cpp
C_OBJ:=$(patsubst %.c, $(OBJ_DIR)/%.o, $(C_SRC))
CXX_OBJ:=$(patsubst %.cpp, $(OBJ_DIR)/%.o, $(CXX_SRC))
OUT:=$(BIN_DIR)/scratch
INCLUDES:=$(INCLUDES) -I$(SRC_DIR) $(shell sdl2-config --cflags) -I$(BASE_DIR)/stb -I$(BASE_DIR)/box2d/include -I$(BASE_DIR)/imgui
VPATH:=$(SRC_DIR):$(BASE_DIR)/stb
CFLAGS:=$(CFLAGS) $(INCLUDES)
CPPFLAGS:=$(CPPFLAGS) $(INCLUDES) -std=c++11
ifeq ($(DEBUG), 1)
    CFLAGS:=$(CFLAGS) -g -O0 -DDEBUG -Wall
    CPPFLAGS:=$(CPPFLAGS) -g -O0 -DDEBUG -Wall
else
    CFLAGS:=$(CFLAGS) -O2 -DNDEBUG -Wall
    CPPFLAGS:=$(CPPFLAGS) -O2 -DNDEBUG -Wall
endif

ifeq ($(UNAME_O), Msys)
    OUT:=$(OUT).exe
    LDLIBS:=$(LDLIBS) -mwindows -lopengl32 -static-libgcc -static-libstdc++ -Wl,-Bstatic -lstdc++ -lpthread -Wl,-Bdynamic
    COPY_FILES:=$(MSYSTEM_PREFIX)/bin/SDL2.dll
else ifeq ($(UNAME_S), Darwin)
    LDLIBS:=$(LDLIBS) -framework OpenGL
    COPY_FILES:=
else
    LDLIBS:=$(LDLIBS) -ldl -lGL
    COPY_FILES:=
endif
LDLIBS:=$(LDLIBS) $(shell sdl2-config --libs) $(BIN_DIR)/scratch_imgui.a $(BIN_DIR)/scratch_box2d.a

all: $(OUT)

$(C_OBJ): $(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(CXX_OBJ): $(OBJ_DIR)/%.o: %.cpp | $(OBJ_DIR)
	$(CXX) $(CPPFLAGS) -c $< -o $@

$(OUT): $(C_OBJ) $(CXX_OBJ) | $(BIN_DIR)
	$(CXX) $(LDFLAGS) -o $@ $+ $(LDLIBS)
	if [ -n "$(COPY_FILES)" ]; then for file in $(COPY_FILES); do cp -vf $$file $(BIN_DIR); done; fi

$(OBJ_DIR) $(BIN_DIR):
	mkdir -pv $@

strip: $(OUT)
	$(STRIP) $^

clean:
	$(RM) -r $(OBJ_DIR) $(OUT)
