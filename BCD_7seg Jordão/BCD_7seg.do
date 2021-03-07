vcom -reportprogress 300 -work work D:/altera/13.0sp1/Projects/BCD_7seg/BCD_7seg.vhd
vcom -reportprogress 300 -work work D:/altera/13.0sp1/Projects/BCD_7seg/BCD_7seg_tb.vhd
vsim +altera -do BCD_7seg_run_msim_rtl_vhdl.do -l msim_transcript -gui rtl_work.bcd_7seg_tb
do BCD_7seg_run_msim_rtl_vhdl.do
add wave -position end  sim:/bcd_7seg_tb/DUT/input
add wave -position end  sim:/bcd_7seg_tb/DUT/output
run 600 ns;