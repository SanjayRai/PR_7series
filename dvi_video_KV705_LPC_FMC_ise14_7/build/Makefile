# Created : 13:18:43, Tue Oct 2, 2012 : Sanjay Rai

TARGET=FMC_DVIDP_CONFIG_test
ISE_RESULTS_DIR=ise_results
SYNTH_RESULTS_DIR=synth_results
EDK_RESULTS_DIR=edk_results
PROJECT_FILE=$(TARGET).prj
TOP_MODULE=$(TARGET)
PROCESSOR_SUBSYS=system
DEVICE=xc7k325t-2-ffg900
IP_dirs  = -sd ../coregen
IP_dirs += -sd synth_results 
IP_dirs += -sd $(EDK_RESULTS_DIR)/implementation
IP_dirs += -sd ../PR_modules/PR_module_A_video_crossover/synth 
#IP_dirs += -sd ../PR_modules/PR_module_A_video_softness/synth 
Bit_file_ID=0xAAAAAAAA
RANDOM_SEED=37


PLATGEN_OPTIONS = -p $(DEVICE) -lang vhdl -od $(EDK_RESULTS_DIR) -toplevel no -ti Inst_system
MAP_OPTIONS  = -timing -detail -ignore_keep_hierarchy -xe n -ol high -t $(RANDOM_SEED) -p $(DEVICE) -pr b
PAR_OPTIONS  = -w  -xe n -ol high
TRCE_OPTIONS = -v 100 -u 100 -l 100 -tsi $(ISE_RESULTS_DIR)/$(TARGET).tsi

BITGEN_OPTS_0 = -g DebugBitstream:No -g Binary:no -g CRC:Enable -g UnusedPin:PullDown
BITGEN_OPTS_1 = -g StartUpClk:CCLK -g DONE_cycle:4 -g GTS_cycle:5 -g GWE_cycle:6
BITGEN_OPTS_2 = -g LCK_cycle:NoWait -g DriveDone:No -g UserID:$(Bit_file_ID)
BITGEN_OPTIONS = $(BITGEN_OPTS_0) $(BITGEN_OPTS_1) $(BITGEN_OPTS_2)

#UCF = ../src/$(TARGET)_non_PR.ucf
UCF = ../src/$(TARGET).ucf
MHS = ../src/$(PROCESSOR_SUBSYS).mhs
EDK = $(EDK_RESULTS_DIR)/implementation/$(PROCESSOR_SUBSYS).ngc
NGC = synth_results/$(TARGET).ngc
NGD = $(ISE_RESULTS_DIR)/$(TARGET).ngd
MAP = $(ISE_RESULTS_DIR)/$(TARGET)_map.ncd
PAR = $(ISE_RESULTS_DIR)/$(TARGET).ncd
BIT = $(ISE_RESULTS_DIR)/$(TARGET).bit
IBS = $(ISE_RESULTS_DIR)/$(TARGET).ibs
MCS = $(ISE_RESULTS_DIR)/$(TARGET).mcs
TWR = $(ISE_RESULTS_DIR)/$(TARGET).twr
PCF = $(ISE_RESULTS_DIR)/$(TARGET).pcf
PWR = $(ISE_RESULTS_DIR)/$(TARGET).pwr

BIT: $(BIT)
$(BIT): $(PAR)
	bitgen -w -m $(BITGEN_OPTIONS) $(PAR)  $(BIT)  $(PCF)

PAR: $(PAR)
$(PAR): $(MAP)
	par $(PAR_OPTIONS) $(MAP) $(PAR) $(PCF)
	trce -o $(TWR) $(TRCE_OPTIONS) $(PAR) $(PCF)

MAP: $(MAP)
$(MAP): $(NGD)
	map $(MAP_OPTIONS) -o $(MAP) $(NGD) $(PCF)

NGD: $(NGD)
$(NGD): $(NGC)
	ngdbuild  -verbose -uc $(UCF) -p $(DEVICE) $(IP_dirs) $(NGC) $(NGD)

NGC : $(NGC)
$(NGC):
	cp -r xpartition.pxml $(ISE_RESULTS_DIR)
	cp -r xpartition.pxml $(SYNTH_RESULTS_DIR)
	xst -ifn $(TARGET).xst

#EDK : $(EDK)
#$(EDK): $(MHS)
#	platgen $(PLATGEN_OPTIONS) $(MHS) 
#	cd $(EDK_RESULTS_DIR)/synthesis && xst -ifn $(PROCESSOR_SUBSYS)_xst.scr -intstyle silent


clean:
	-rm -rf tmp
	-rm -rf xpartition.pxml.old 
	-rm -rf _xmsgs 
	-rm -rf fpga_editor 
	-rm -rf _xmsgs
	-rm -f $(TARGET).lso
	-rm -f $(TARGET).srp
	-rm -f $(TARGET).ibs
	-rm -rf xst
	-rm -f netlist.lst
	-rm -rf xlnx_auto_*
	-rm -rf *.xrpt
	-rm -rf par_usage_statistics.html
	-rm -rf xilinx_device_details.xml
	-rm -rf $(ISE_RESULTS_DIR)/*
clean_all:
	-rm -rf tmp
	-rm -rf xpartition.pxml.old 
	-rm -rf _xmsgs 
	-rm -rf fpga_editor 
	-rm -rf _xmsgs
	-rm -f $(TARGET).lso
	-rm -f $(TARGET).srp
	-rm -f $(TARGET).ibs
	-rm -rf xst
	-rm -f netlist.lst
	-rm -rf xlnx_auto_*
	-rm -rf *.xrpt
	-rm -rf par_usage_statistics.html
	-rm -rf xilinx_device_details.xml
	-rm -rf $(ISE_RESULTS_DIR)/*
	-rm -rf $(EDK_RESULTS_DIR)/*
	-rm -rf synth_results/*

