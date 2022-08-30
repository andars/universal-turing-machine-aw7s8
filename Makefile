# derived from https://github.com/mattvenn/wokwi-verilog-gds-test/blob/main/Makefile

WOKWI_PROJECT_ID=341174563322724948

VERILOG_FILES = core.v direction.v next_state.v new_symbol.v decoder_3to8.v encoder_8to3.v user_module.v
PROCESSED_VERILOG_FILES = $(patsubst %.v,src/%_$(WOKWI_PROJECT_ID).v,$(VERILOG_FILES))
$(info processed verilog files: $(PROCESSED_VERILOG_FILES))

fetch: $(PROCESSED_VERILOG_FILES)
	echo "Project ID = $(WOKWI_PROJECT_ID)"
	ls src
	sed -e 's/USER_MODULE_ID/$(WOKWI_PROJECT_ID)/g' template/scan_wrapper.v > src/scan_wrapper_$(WOKWI_PROJECT_ID).v
	sed -e 's/USER_MODULE_ID/$(WOKWI_PROJECT_ID)/g' template/config.tcl > src/config.tcl
	echo $(WOKWI_PROJECT_ID) > src/ID

# needs PDK_ROOT and OPENLANE_ROOT, OPENLANE_IMAGE_NAME set from your environment
harden:
	docker run --rm \
	-v $(OPENLANE_ROOT):/openlane \
	-v $(PDK_ROOT):$(PDK_ROOT) \
	-v $(CURDIR):/work \
	-e PDK_ROOT=$(PDK_ROOT) \
	-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
	$(OPENLANE_IMAGE_NAME) \
	/bin/bash -c "./flow.tcl -overwrite -design /work/src -run_path /work/runs -tag wokwi"

$(PROCESSED_VERILOG_FILES): src/%_$(WOKWI_PROJECT_ID).v: verilog/%.v
	mkdir -p src
	sed -e 's/PROJECT_ID/$(WOKWI_PROJECT_ID)/g' $< > $@

.PHONY: clean
clean:
	rm -rf src
