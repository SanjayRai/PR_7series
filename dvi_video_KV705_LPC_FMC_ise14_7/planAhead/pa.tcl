# Created : 13:18:43, Tue Oct 2, 2012 : Sanjay Rai

set DESIGN_NAME "FMC_DVIDP_CONFIG_test"
set PROJECT_NAME "planAhead_prj1"
set DEVICE "xc7k325t-2-ffg900"
set NETLIST "../build/synth_results/$DESIGN_NAME.ngc"
set CORE_SEARCH_PATH { ../coregen ../PR_modules/PR_module_A_video_crossover/synth}
#set UCF_FILE "../src/$DESIGN_NAME.ucf"
set UCF_FILE "../src/FMC_DVIDP_CONFIG_test_non_PR.ucf"
set NCD_FILE "../build/FMC_DVIDP_CONFIG_test_par.ncd"
set PCF_FILE "../build/FMC_DVIDP_CONFIG_test.pcf"
set TWX_FILE "../build/FMC_DVIDP_CONFIG_test.twx"
#set NCD_FILE "../PR_modules/PR_module_A_static/build/FMC_DVIDP_CONFIG_test_par.ncd"
#set PCF_FILE "../PR_modules/PR_module_A_static/build/FMC_DVIDP_CONFIG_test.pcf"
#set TWX_FILE "../PR_modules/PR_module_A_static/build/FMC_DVIDP_CONFIG_test.twx"

create_project $PROJECT_NAME $PROJECT_NAME
set_property design_mode GateLvl [get_property srcset [current_run]]
set_property edif_top_file $NETLIST [get_property srcset [current_run]]
add_files $CORE_SEARCH_PATH
set_property name floorplan_1 [get_filesets constrs_1]
set_property target_part $DEVICE [get_filesets floorplan_1]
open_netlist_design -constrset floorplan_1 -part $DEVICE  
read_ucf $UCF_FILE
#import_as_run -pcf $PCF_FILE -twx $TWX_FILE $NCD_FILE 
#open_impl_design
