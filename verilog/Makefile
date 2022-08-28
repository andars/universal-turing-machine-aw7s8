build:
	mkdir -p build

define VERILOG_SIM_RULE =
build/$(1)-sim: build $(2)
	iverilog $(2) -o build/$(1)-sim
.PHONY: check-$(1)
check-$(1): build/$(1)-sim
	./build/$(1)-sim
endef

$(eval $(call VERILOG_SIM_RULE,direction,direction.v tb_direction.v))
$(eval $(call VERILOG_SIM_RULE,new-symbol,new_symbol.v tb_new_symbol.v))
$(eval $(call VERILOG_SIM_RULE,next-state,next_state.v tb_next_state.v))
$(eval $(call VERILOG_SIM_RULE,3to8,decoder_3to8.v tb_decoder_3to8.v))
$(eval $(call VERILOG_SIM_RULE,8to3,encoder_8to3.v tb_encoder_8to3.v))
$(eval $(call VERILOG_SIM_RULE,user-module,user_module.v next_state.v new_symbol.v decoder_3to8.v encoder_8to3.v tb_user_module.v))

