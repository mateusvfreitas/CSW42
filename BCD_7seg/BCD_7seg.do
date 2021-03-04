vcom -reportprogress 300 -work work {D:/Quartus Projects/BCD_7seg/BCD_7seg.vhd}
vcom -reportprogress 300 -work work {D:/Quartus Projects/BCD_7seg/BCD_7seg_tb.vhd}
vsim BCD_7seg_tb
add wave -position insertpoint  \
sim:/bcd_7seg_tb/s_input
add wave -position insertpoint  \
sim:/bcd_7seg_tb/s_output
run 450 ns