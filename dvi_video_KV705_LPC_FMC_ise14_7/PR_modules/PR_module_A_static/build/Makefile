TARGET=FMC_DVIDP_CONFIG_test
DEVICE=xc7k325t-2-ffg900
IP_dir_1=../../PR_module_A_video_softness/synth
Bit_file_ID=0xAAAAAAAA
RANDOM_SEED=55

IP_dirs = -sd $(IP_dir_1)

BITGEN_OPTS_0 = -intstyle ise -w -g DebugBitstream:No -g Binary:no -g CRC:Enable -m
BITGEN_OPTS_1 = -g CclkPin:PullUp -g M0Pin:PullUp -g M1Pin:PullUp -g M2Pin:PullUp -g ProgPin:PullUp
BITGEN_OPTS_2 = -g DonePin:PullUp -g InitPin:Pullup
BITGEN_OPTS_3 = -g TckPin:PullUp -g TdiPin:PullUp -g TdoPin:PullUp -g TmsPin:PullUp
BITGEN_OPTS_4 = -g UnusedPin:PullDown -g compress
BITGEN_OPTS_5 = -g DCIUpdateMode:AsRequired -g StartUpClk:CCLK -g done_cycle:4 -g gts_cycle:5 -g gwe_cycle:6
bitgen_opts_6 = -g lck_cycle:nowait -g security:none -g donepipe:No -g DriveDone:No -g UserID:$(Bit_file_ID)
BITGEN_OPTIONS = $(BITGEN_OPTS_0) $(BITGEN_OPTS_1) $(BITGEN_OPTS_2) $(BITGEN_OPTS_3) $(BITGEN_OPTS_4) $(BITGEN_OPTS_5) $(BITGEN_OPTS_6)


# $(TARGET)_par.mcs: $(TARGET)_par.bit
# 	promgen -w -p mcs -c FF -o $(TARGET)_par -u 0 $(TARGET)_par.bit
# 
# $(TARGET).ibs: $(TARGET)_par.ncd
# 	ibiswriter -intstyle silent -allmodels $(TARGET)_par.ncd $(TARGET).ibs

$(TARGET)_par.bit: $(TARGET)_par.ncd
	bitgen $(BITGEN_OPTIONS) $(TARGET)_par.ncd

$(TARGET)_par.ncd: $(TARGET)_map.ncd
	par -w -ol high $(TARGET)_map.ncd $(TARGET)_par.ncd $(TARGET).pcf

$(TARGET)_map.ncd: $(TARGET).ngd
	map -timing -detail -p $(DEVICE) -t $(RANDOM_SEED) -ol high -pr b -w -o $(TARGET)_map.ncd $(TARGET).ngd $(TARGET).pcf

$(TARGET).ngd:
	cp ../xpartition.pxml .
	ngdbuild -uc ../../../src/$(TARGET).ucf -p $(DEVICE) $(IP_dirs) ../../../build/synth_results/$(TARGET).ngc $(TARGET).ngd

clean:
	-rm -rf dump.xst
	-rm -rf xpartition.pxml.old 
	-rm -rf _xmsgs 
	-rm -rf fpga_editor 
	-rm -rf par_usage_statistics.html
	-rm -f $(TARGET).bld 
	-rm -f $(TARGET).ngd 
	-rm -f $(TARGET).pcf 
	-rm -rf _ngo 
	-rm -r platgen.opt
	-rm *.log 
	-rm *.xml 
	-rm *.twr 
	-rm $(TARGET)_ngd.* 
	-rm $(TARGET)_map.* 
	-rm $(TARGET)_par*.* 
	-rm -rf __xps
	-rm -rf file\ graph
	-rm -rf work
	-rm -rf xlnx_auto_0_xdb
	-rm -rf xst_work_lib
	-rm -f *.xrpt
	-rm -f *.ise
	-rm -f *.ngm
	-rm -f *.ncd
	-rm -f *.ngd
	-rm -f netlist.lst
	-rm -f xpartition.pxml
	-rm -f $(TARGET).srp
	-rm -f $(TARGET).ngc
	-rm -f $(TARGET).lso
	-rm -f $(TARGET).ngr
	-rm -f $(TARGET).twx
	-rm -f $(TARGET)_vhdl.prj
	-rm -rf _xmsgs
	-rm -rf par_usage_statistics.html
