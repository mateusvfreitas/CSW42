vcom -reportprogress 300 -work work {D:/Quartus Projects/Chronometer/Counter10ms.vhd}
vcom -reportprogress 300 -work work {D:/Quartus Projects/Chronometer/Counter10ms_tb.vhd}
vsim gate_work.counter10ms_tb
add wave -position end  sim:/counter10ms_tb/clk_50_tb
add wave -position end  sim:/counter10ms_tb/output_tb
run 100 ms
