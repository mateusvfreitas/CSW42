vcom -reportprogress 300 -work work {D:/Quartus Projects/bramefifo/*.vhd}
vsim gate_work.bramefifo_tb
add wave -position end  sim:/bramefifo_tb/DUT/clk_50
add wave -position end  sim:/bramefifo_tb/DUT/write_sm/state
add wave -position end  sim:/bramefifo_tb/DUT/write_sm/wr_fifo_enable
add wave -position end  sim:/bramefifo_tb/DUT/write_sm/address
add wave -position end  sim:/bramefifo_tb/DUT/input_ram/address
add wave -position end  sim:/bramefifo_tb/DUT/input_ram/q
add wave -position end  sim:/bramefifo_tb/DUT/queue/usedw
add wave -position end  sim:/bramefifo_tb/DUT/read_sm/state
add wave -position end  sim:/bramefifo_tb/DUT/read_sm/address
add wave -position end  sim:/bramefifo_tb/DUT/read_sm/rd_fifo_enable
add wave -position end  sim:/bramefifo_tb/DUT/read_sm/output_ram_wren
add wave -position end  sim:/bramefifo_tb/DUT/output_ram/address
add wave -position end  sim:/bramefifo_tb/DUT/output_ram/data
add wave -position end  sim:/bramefifo_tb/DUT/output_ram/q
run 328000 ns