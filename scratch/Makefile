
CC:=gcc
CXX:=g++
STRIP:=strip
RM:=rm -f

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
CPPFLAGS:=$(CPPFLAGS) $(INCLUDES) -g -O2 -Wall
ifeq ($(shell uname -o), Msys)
    OUT:=$(OUT).exe
    LDLIBS:=$(LDLIBS) -lopengl32
else
    LDLIBS:=$(LDLIBS) -ldl -lGL
endif
LDLIBS:=$(LDLIBS) $(shell sdl2-config --libs) $(BIN_DIR)/scratch_imgui.a $(BIN_DIR)/scratch_box2d.a

all: $(OUT)

$(C_OBJ): $(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CC) $(CPPFLAGS) -c $< -o $@

$(CXX_OBJ): $(OBJ_DIR)/%.o: %.cpp | $(OBJ_DIR)
	$(CXX) $(CPPFLAGS) -c $< -o $@

$(OUT): $(C_OBJ) $(CXX_OBJ) | $(BIN_DIR)
	$(CXX) $(LDFLAGS) -o $@ $+ $(LDLIBS)

$(OBJ_DIR) $(BIN_DIR):
	mkdir -p $@

strip: $(OUT)
	$(STRIP) $^

clean:
	$(RM) -r $(OBJ_DIR) $(OUT)
