vcom -reportprogress 300 -work work {D:/Quartus Projects/Chronometer/CounterUpToN.vhd}
vcom -reportprogress 300 -work work {D:/Quartus Projects/Chronometer/CounterUpToN_tb.vhd}
vsim gate_work.counterupton_tb
add wave -position end  sim:/counterupton_tb/clk_50_tb
add wave -position end  sim:/counterupton_tb/DUT/counter
add wave -position end  sim:/counterupton_tb/output_tb
add wave -position end  sim:/counterupton_tb/upper_bound_tb
run 500 ns
