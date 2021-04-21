# Create Clock
# ------------
create_clock -name {clk} -period 50.000 -waveform { 0.000 20.000 } [get_ports {clk_clk}]
derive_clock_uncertainty