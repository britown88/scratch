
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
        CXX:=clang++
        AR:=llvm-ar
    else
        CXX:=g++
        AR:=ar
    endif
endif

ifneq ($(CROSS),)
    CXX:=$(CROSS)-$(CXX)
    AR:=$(CROSS)-$(AR)
endif

BASE_DIR:=..
SRC_DIR:=$(BASE_DIR)/imgui
OBJ_DIR:=obj
BIN_DIR:=$(BASE_DIR)/bin

SRC:=imgui.cpp \
    imgui_demo.cpp \
    imgui_draw.cpp \
    imgui_tables.cpp \
    imgui_widgets.cpp
OBJ:=$(patsubst %.cpp, $(OBJ_DIR)/%.o, $(SRC))
OUT:=$(BIN_DIR)/scratch_imgui.a
INCLUDES:=$(INCLUDES) -I$(SRC_DIR)
VPATH:=$(SRC_DIR)
CPPFLAGS:=$(CPPFLAGS) $(INCLUDES) -std=c++11
ifeq ($(DEBUG), 1)
    CPPFLAGS:=$(CPPFLAGS) -g -O0 -DDEBUG -Wall
else
    CPPFLAGS:=$(CPPFLAGS) -O2 -DNDEBUG -Wall
endif

all: $(OUT)

$(OBJ): $(OBJ_DIR)/%.o: %.cpp | $(OBJ_DIR)
	$(CXX) $(CPPFLAGS) -c $< -o $@

$(OUT): $(OBJ) | $(BIN_DIR)
	$(AR) rcs $@ $^

$(OBJ_DIR) $(BIN_DIR):
	mkdir -pv $@

clean:
	$(RM) -r $(OBJ_DIR) $(OUT)
