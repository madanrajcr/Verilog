remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog ../rtl/upcounter_4.v

elaborate upcounter_4

link 

check_design

current_design  upcounter_4

compile_ultra

write_file -f verilog -hier -output upcounter_4_netlist.v


 

