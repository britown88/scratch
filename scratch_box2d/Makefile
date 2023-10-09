
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
SRC_DIR:=$(BASE_DIR)/box2d/src
OBJ_DIR:=obj
BIN_DIR:=$(BASE_DIR)/bin

SRC:=b2_broad_phase.cpp \
    b2_chain_shape.cpp \
    b2_circle_shape.cpp \
    b2_collide_circle.cpp \
    b2_collide_edge.cpp \
    b2_collide_polygon.cpp \
    b2_collision.cpp \
    b2_distance.cpp \
    b2_dynamic_tree.cpp \
    b2_edge_shape.cpp \
    b2_polygon_shape.cpp \
    b2_time_of_impact.cpp \
    b2_block_allocator.cpp \
    b2_draw.cpp \
    b2_math.cpp \
    b2_settings.cpp \
    b2_stack_allocator.cpp \
    b2_timer.cpp \
    b2_body.cpp \
    b2_chain_circle_contact.cpp \
    b2_chain_polygon_contact.cpp \
    b2_circle_contact.cpp \
    b2_contact.cpp \
    b2_contact_manager.cpp \
    b2_contact_solver.cpp \
    b2_distance_joint.cpp \
    b2_edge_circle_contact.cpp \
    b2_edge_polygon_contact.cpp \
    b2_fixture.cpp \
    b2_friction_joint.cpp \
    b2_gear_joint.cpp \
    b2_island.cpp \
    b2_joint.cpp \
    b2_motor_joint.cpp \
    b2_mouse_joint.cpp \
    b2_polygon_circle_contact.cpp \
    b2_polygon_contact.cpp \
    b2_prismatic_joint.cpp \
    b2_pulley_joint.cpp \
    b2_revolute_joint.cpp \
    b2_weld_joint.cpp \
    b2_wheel_joint.cpp \
    b2_world.cpp \
    b2_world_callbacks.cpp \
    b2_rope.cpp
OBJ:=$(patsubst %.cpp, $(OBJ_DIR)/%.o, $(SRC))
OUT:=$(BIN_DIR)/scratch_box2d.a
INCLUDES:=$(INCLUDES) -I$(BASE_DIR)/box2d/include -I$(SRC_DIR)/dynamics
VPATH:=$(SRC_DIR)/collision:$(SRC_DIR)/common:$(SRC_DIR)/dynamics:$(SRC_DIR)/rope
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
