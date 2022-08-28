build:
	mkdir -p build

define VERILOG_SIM_RULE =
build/$(1)-sim: build $(2)
	iverilog $(2) -o build/$(1)-sim
.PHONY: check-$(1)
check-$(1): build/$(1)-sim
	./build/$(1)-sim
endef

$(eval $(call VERILOG_SIM_RULE,new-symbol,new_symbol.v tb_new_symbol.v))
$(eval $(call VERILOG_SIM_RULE,next-state,next_state.v tb_next_state.v))

