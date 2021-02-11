STOW = stow -v --target=$(HOME)

STOWDIRS = $(wildcard stow-*)
STOWDIRS_CLEAN = $(addprefix clean-, $(STOWDIRS))
STOWDIRS_ADOPT = $(addprefix adopt-, $(STOWDIRS))

.PHONY: all clean $(STOWDIRS) $(STOWDIRS_CLEAN)

all: $(STOWDIRS)

clean: $(STOWDIRS_CLEAN)

$(STOWDIRS):
	$(STOW) $@
$(STOWDIRS_CLEAN):
	$(STOW) -D $(@:clean-%=%)
$(STOWDIRS_ADOPT):
	$(STOW) --adopt $(@:adopt-%=%)
