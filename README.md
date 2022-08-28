a universal turing machine core, using Watanabe's 5 symbol, 8 state machine.

infinite tape not included.

Shigeru Watanabe. 1961. 5-Symbol 8-State and 5-Symbol 6-State Universal Turing Machines. J. ACM 8, 4 (Oct. 1961), 476–483.

### Tiny Tapeout Module

currently the tiny tapeout user module is the (state, symbol) -> (state, symbol, direction)
transition function, without internal memory elements to hold the current
state.

tiny tapeout template files are from https://github.com/mattvenn/wokwi-verilog-gds-test
