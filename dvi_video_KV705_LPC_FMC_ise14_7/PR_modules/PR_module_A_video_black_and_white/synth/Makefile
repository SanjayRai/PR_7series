TARGET=video_filter_PR
DEVICE=xc7k325t-2-ffg900
RANDOM_SEED=55


$(TARGET).ngc:
	xst -ifn $(TARGET).xst -intstyle silent

clean:
	-rm -rf xst
	-rm -rf dump.xst
	-rm -rf _xmsgs
	-rm *.log 
	-rm *.xml 
	-rm -rf file\ graph
	-rm -rf work
	-rm -rf xlnx_auto_0_xdb
	-rm -rf xst_work_lib
	-rm -f *.xrpt
	-rm -f *.ise
	-rm -f $(TARGET).srp
	-rm -f $(TARGET).ngc
	-rm -f $(TARGET).lso
	-rm -f $(TARGET).ngr
	-rm -f $(TARGET).twx
	-rm -f $(TARGET)_vhdl.prj
