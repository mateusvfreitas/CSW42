vcom -reportprogress 300 -work work {D:/Quartus Projects/Chronometer/*.vhd}
vsim gate_work.chronometer_tb
add wave -position end  sim:/chronometer_tb/DUT/count_digit4
add wave -position end  sim:/chronometer_tb/DUT/count_digit3
add wave -position end  sim:/chronometer_tb/DUT/count_digit2
add wave -position end  sim:/chronometer_tb/DUT/count_digit1
run 110 ms