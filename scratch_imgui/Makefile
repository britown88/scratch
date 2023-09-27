
CXX:=g++
AR:=ar
RM:=rm -f

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
CPPFLAGS:=$(CPPFLAGS) $(INCLUDES) -g -O2 -Wall

all: $(OUT)

$(OBJ): $(OBJ_DIR)/%.o: %.cpp | $(OBJ_DIR)
	$(CXX) $(CPPFLAGS) -c $< -o $@

$(OUT): $(OBJ) | $(BIN_DIR)
	$(AR) rcs $@ $^

$(OBJ_DIR) $(BIN_DIR):
	mkdir -p $@

clean:
	$(RM) -r $(OBJ_DIR) $(OUT)
