# Created : 13:18:43, Tue Oct 2, 2012 : Sanjay Rai

read_vhdl -verbose {
../PR_modules/PR_module_A_video_bypass/src/video_filter_PR.vhd
}
#read_vhdl -verbose {
#../PR_modules/PR_module_A_video_softness/src/moving_average.vhd
#../PR_modules/PR_module_A_video_softness/src/video_filter_PR.vhd
#}
read_vhdl -verbose {
../src/window.vhd
}
read_verilog -sv -verbose {
../coregen/clk_wiz_v3_6.v
../coregen/chipscope_icon.v
../coregen/chipscope_vio.v
../coregen/chipscope_ila.v
../src/fmc_dvidp_dvi_in.v
../src/fmc_dvidp_dvi_out.v
../src/FMC_DVIDP_CONFIG.v
../src/PB_FMC_DVIDP_CONFIG.v
../src/kcpsm3.v
../src/test_patterns.v
../src/FMC_DVIDP_CONFIG_test.v
}

## __SRAI coregen files
#read_edif -verbose {
#../coregen/chipscope_icon.ngc
#../coregen/chipscope_vio.ngc
#../coregen/chipscope_ila.ngc
#}

read_xdc -verbose ../src/FMC_DVIDP_CONFIG_test.xdc

synth_design -top FMC_DVIDP_CONFIG_test -fanout_limit 100000 -include_dirs ../coregn -part xc7k325t-2-ffg900
opt_design -verbose
place_design -verbose
phys_opt_design -verbose
route_design -verbose -effort_level high
report_timing -delay_type min_max -path_type full_clock_expanded -max_paths 100 -sort_by group -significant_digits 3 -input_pins -nets -name {results_par_1} -file FMC_DVIDP_CONFIG_test.timing_rpt
report_timing_summary -delay_type min_max -path_type full_clock_expanded -max_paths 100 -significant_digits 3 -input_pins -nets -file FMC_DVIDP_CONFIG_test.timing_summary_rpt
write_bitstream ./FMC_DVIDP_CONFIG_test.bit
