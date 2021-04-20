
# (C) 2001-2021 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.0sp1 232 win32 2021.04.20.20:08:33

# ----------------------------------------
# Auto-generated simulation script

# ----------------------------------------
# Initialize the variable
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
} 

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "HostSystem_tb"
} 

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
} 

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "D:/quartus/quartus/"
} 


# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cpu_rf_ram_a.dat ./
  file copy -force D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cpu_rf_ram_a.hex ./
  file copy -force D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cpu_rf_ram_a.mif ./
  file copy -force D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cpu_rf_ram_b.dat ./
  file copy -force D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cpu_rf_ram_b.hex ./
  file copy -force D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cpu_rf_ram_b.mif ./
  file copy -force D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_memory.hex ./
  file copy -force D:/QP/SNios/software/app/mem_init/hdl_sim/HostSystem_memory.dat ./
  file copy -force D:/QP/SNios/software/app/mem_init/HostSystem_memory.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if { ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] } {
  ensure_lib                        ./libraries/altera_ver/            
  vmap       altera_ver             ./libraries/altera_ver/            
  ensure_lib                        ./libraries/lpm_ver/               
  vmap       lpm_ver                ./libraries/lpm_ver/               
  ensure_lib                        ./libraries/sgate_ver/             
  vmap       sgate_ver              ./libraries/sgate_ver/             
  ensure_lib                        ./libraries/altera_mf_ver/         
  vmap       altera_mf_ver          ./libraries/altera_mf_ver/         
  ensure_lib                        ./libraries/altera_lnsim_ver/      
  vmap       altera_lnsim_ver       ./libraries/altera_lnsim_ver/      
  ensure_lib                        ./libraries/cycloneiv_hssi_ver/    
  vmap       cycloneiv_hssi_ver     ./libraries/cycloneiv_hssi_ver/    
  ensure_lib                        ./libraries/cycloneiv_pcie_hip_ver/
  vmap       cycloneiv_pcie_hip_ver ./libraries/cycloneiv_pcie_hip_ver/
  ensure_lib                        ./libraries/cycloneiv_ver/         
  vmap       cycloneiv_ver          ./libraries/cycloneiv_ver/         
  ensure_lib                        ./libraries/altera/                
  vmap       altera                 ./libraries/altera/                
  ensure_lib                        ./libraries/lpm/                   
  vmap       lpm                    ./libraries/lpm/                   
  ensure_lib                        ./libraries/sgate/                 
  vmap       sgate                  ./libraries/sgate/                 
  ensure_lib                        ./libraries/altera_mf/             
  vmap       altera_mf              ./libraries/altera_mf/             
  ensure_lib                        ./libraries/altera_lnsim/          
  vmap       altera_lnsim           ./libraries/altera_lnsim/          
  ensure_lib                        ./libraries/cycloneiv_hssi/        
  vmap       cycloneiv_hssi         ./libraries/cycloneiv_hssi/        
  ensure_lib                        ./libraries/cycloneiv_pcie_hip/    
  vmap       cycloneiv_pcie_hip     ./libraries/cycloneiv_pcie_hip/    
  ensure_lib                        ./libraries/cycloneiv/             
  vmap       cycloneiv              ./libraries/cycloneiv/             
}
ensure_lib                                                                                ./libraries/irq_mapper/                                                                    
vmap       irq_mapper                                                                     ./libraries/irq_mapper/                                                                    
ensure_lib                                                                                ./libraries/width_adapter/                                                                 
vmap       width_adapter                                                                  ./libraries/width_adapter/                                                                 
ensure_lib                                                                                ./libraries/rsp_xbar_mux/                                                                  
vmap       rsp_xbar_mux                                                                   ./libraries/rsp_xbar_mux/                                                                  
ensure_lib                                                                                ./libraries/cmd_xbar_mux/                                                                  
vmap       cmd_xbar_mux                                                                   ./libraries/cmd_xbar_mux/                                                                  
ensure_lib                                                                                ./libraries/cmd_xbar_demux/                                                                
vmap       cmd_xbar_demux                                                                 ./libraries/cmd_xbar_demux/                                                                
ensure_lib                                                                                ./libraries/rst_controller/                                                                
vmap       rst_controller                                                                 ./libraries/rst_controller/                                                                
ensure_lib                                                                                ./libraries/id_router_001/                                                                 
vmap       id_router_001                                                                  ./libraries/id_router_001/                                                                 
ensure_lib                                                                                ./libraries/id_router/                                                                     
vmap       id_router                                                                      ./libraries/id_router/                                                                     
ensure_lib                                                                                ./libraries/addr_router/                                                                   
vmap       addr_router                                                                    ./libraries/addr_router/                                                                   
ensure_lib                                                                                ./libraries/top_avalon_0_avalon_slave_0_translator_avalon_universal_slave_0_agent_rsp_fifo/
vmap       top_avalon_0_avalon_slave_0_translator_avalon_universal_slave_0_agent_rsp_fifo ./libraries/top_avalon_0_avalon_slave_0_translator_avalon_universal_slave_0_agent_rsp_fifo/
ensure_lib                                                                                ./libraries/memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo/                  
vmap       memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo                   ./libraries/memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo/                  
ensure_lib                                                                                ./libraries/memory_s1_translator_avalon_universal_slave_0_agent/                           
vmap       memory_s1_translator_avalon_universal_slave_0_agent                            ./libraries/memory_s1_translator_avalon_universal_slave_0_agent/                           
ensure_lib                                                                                ./libraries/cpu_instruction_master_translator_avalon_universal_master_0_agent/             
vmap       cpu_instruction_master_translator_avalon_universal_master_0_agent              ./libraries/cpu_instruction_master_translator_avalon_universal_master_0_agent/             
ensure_lib                                                                                ./libraries/memory_s1_translator/                                                          
vmap       memory_s1_translator                                                           ./libraries/memory_s1_translator/                                                          
ensure_lib                                                                                ./libraries/cpu_instruction_master_translator/                                             
vmap       cpu_instruction_master_translator                                              ./libraries/cpu_instruction_master_translator/                                             
ensure_lib                                                                                ./libraries/top_avalon_0/                                                                  
vmap       top_avalon_0                                                                   ./libraries/top_avalon_0/                                                                  
ensure_lib                                                                                ./libraries/cpu/                                                                           
vmap       cpu                                                                            ./libraries/cpu/                                                                           
ensure_lib                                                                                ./libraries/memory/                                                                        
vmap       memory                                                                         ./libraries/memory/                                                                        
ensure_lib                                                                                ./libraries/HostSystem_inst_reset_bfm/                                                     
vmap       HostSystem_inst_reset_bfm                                                      ./libraries/HostSystem_inst_reset_bfm/                                                     
ensure_lib                                                                                ./libraries/HostSystem_inst_clk_bfm/                                                       
vmap       HostSystem_inst_clk_bfm                                                        ./libraries/HostSystem_inst_clk_bfm/                                                       
ensure_lib                                                                                ./libraries/HostSystem_inst/                                                               
vmap       HostSystem_inst                                                                ./libraries/HostSystem_inst/                                                               

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if { ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] } {
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"               -work altera_ver            
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                        -work lpm_ver               
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                           -work sgate_ver             
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                       -work altera_mf_ver         
    vlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv"   -work altera_lnsim_ver      
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_hssi_atoms.v"            -work cycloneiv_hssi_ver    
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_pcie_hip_atoms.v"        -work cycloneiv_pcie_hip_ver
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_atoms.v"                 -work cycloneiv_ver         
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"         -work altera                
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"     -work altera                
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"        -work altera                
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"     -work altera                
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd"  -work altera                
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"             -work altera                
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                       -work lpm                   
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                      -work lpm                   
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                    -work sgate                 
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                         -work sgate                 
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"          -work altera_mf             
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                     -work altera_mf             
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"       -work altera_lnsim          
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_hssi_components.vhd"     -work cycloneiv_hssi        
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_hssi_atoms.vhd"          -work cycloneiv_hssi        
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_pcie_hip_components.vhd" -work cycloneiv_pcie_hip    
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_pcie_hip_atoms.vhd"      -work cycloneiv_pcie_hip    
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_atoms.vhd"               -work cycloneiv             
    vcom     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneiv_components.vhd"          -work cycloneiv             
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_irq_mapper.vho"                                                                     -work irq_mapper                                                                    
  vlog -sv "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_merlin_width_adapter.sv"                                                         -work width_adapter                                                                 
  vlog -sv "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_merlin_address_alignment.sv"                                                     -work width_adapter                                                                 
  vlog -sv "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_merlin_burst_uncompressor.sv"                                                    -work width_adapter                                                                 
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_rsp_xbar_mux.vho"                                                                   -work rsp_xbar_mux                                                                  
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cmd_xbar_mux.vho"                                                                   -work cmd_xbar_mux                                                                  
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cmd_xbar_demux.vho"                                                                 -work cmd_xbar_demux                                                                
  vlog     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_reset_controller.v"                                                              -work rst_controller                                                                
  vlog     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_reset_synchronizer.v"                                                            -work rst_controller                                                                
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_id_router_001.vho"                                                                  -work id_router_001                                                                 
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_id_router.vho"                                                                      -work id_router                                                                     
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_addr_router.vho"                                                                    -work addr_router                                                                   
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_top_avalon_0_avalon_slave_0_translator_avalon_universal_slave_0_agent_rsp_fifo.vho" -work top_avalon_0_avalon_slave_0_translator_avalon_universal_slave_0_agent_rsp_fifo
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo.vho"                   -work memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo                  
  vlog -sv "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_merlin_slave_agent.sv"                                                           -work memory_s1_translator_avalon_universal_slave_0_agent                           
  vlog -sv "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_merlin_burst_uncompressor.sv"                                                    -work memory_s1_translator_avalon_universal_slave_0_agent                           
  vlog -sv "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_merlin_master_agent.sv"                                                          -work cpu_instruction_master_translator_avalon_universal_master_0_agent             
  vlog -sv "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_merlin_slave_translator.sv"                                                      -work memory_s1_translator                                                          
  vlog -sv "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/mentor/altera_merlin_master_translator.sv"                                                     -work cpu_instruction_master_translator                                             
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/reg32.vhd"                                                                                     -work top_avalon_0                                                                  
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/top_avalon.vhd"                                                                                -work top_avalon_0                                                                  
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cpu.vhd"                                                                            -work cpu                                                                           
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_cpu_test_bench.vhd"                                                                 -work cpu                                                                           
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem_memory.vhd"                                                                         -work memory                                                                        
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/altera_avalon_reset_source.vhd"                                                                -work HostSystem_inst_reset_bfm                                                     
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/altera_avalon_clock_source.vhd"                                                                -work HostSystem_inst_clk_bfm                                                       
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/HostSystem.vhd"                                                                                -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/hostsystem_memory_s1_translator.vhd"                                                           -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/hostsystem_top_avalon_0_avalon_slave_0_translator.vhd"                                         -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/hostsystem_memory_s1_translator_avalon_universal_slave_0_agent.vhd"                            -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/hostsystem_top_avalon_0_avalon_slave_0_translator_avalon_universal_slave_0_agent.vhd"          -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/hostsystem_width_adapter.vhd"                                                                  -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/hostsystem_width_adapter_001.vhd"                                                              -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/hostsystem_cpu_instruction_master_translator.vhd"                                              -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/submodules/hostsystem_cpu_data_master_translator.vhd"                                                     -work HostSystem_inst                                                               
  vcom     "D:/QP/SNios/HostSystem/testbench/HostSystem_tb/simulation/HostSystem_tb.vhd"                                                                                                                                                                            
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  vsim -t ps \
    -G/$TOP_LEVEL_NAME$SYSTEM_INSTANCE_NAME/HostSystem_inst/memory/INIT_FILE=\"HostSystem_memory.hex\" \
     -L work -L work_lib -L irq_mapper -L width_adapter -L rsp_xbar_mux -L cmd_xbar_mux -L cmd_xbar_demux -L rst_controller -L id_router_001 -L id_router -L addr_router -L top_avalon_0_avalon_slave_0_translator_avalon_universal_slave_0_agent_rsp_fifo -L memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo -L memory_s1_translator_avalon_universal_slave_0_agent -L cpu_instruction_master_translator_avalon_universal_master_0_agent -L memory_s1_translator -L cpu_instruction_master_translator -L top_avalon_0 -L cpu -L memory -L HostSystem_inst_reset_bfm -L HostSystem_inst_clk_bfm -L HostSystem_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  vsim -novopt -t ps \
    -G/$TOP_LEVEL_NAME$SYSTEM_INSTANCE_NAME/HostSystem_inst/memory/INIT_FILE=\"HostSystem_memory.hex\" \
     -L work -L work_lib -L irq_mapper -L width_adapter -L rsp_xbar_mux -L cmd_xbar_mux -L cmd_xbar_demux -L rst_controller -L id_router_001 -L id_router -L addr_router -L top_avalon_0_avalon_slave_0_translator_avalon_universal_slave_0_agent_rsp_fifo -L memory_s1_translator_avalon_universal_slave_0_agent_rsp_fifo -L memory_s1_translator_avalon_universal_slave_0_agent -L cpu_instruction_master_translator_avalon_universal_master_0_agent -L memory_s1_translator -L cpu_instruction_master_translator -L top_avalon_0 -L cpu -L memory -L HostSystem_inst_reset_bfm -L HostSystem_inst_clk_bfm -L HostSystem_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
}
file_copy
h
