
all:
	+$(MAKE) -C scratch_box2d
	+$(MAKE) -C scratch_imgui
	+$(MAKE) -C scratch

strip: all
	+$(MAKE) -C scratch $@

clean:
	+$(MAKE) -C scratch_box2d $@
	+$(MAKE) -C scratch_imgui $@
	+$(MAKE) -C scratch $@
