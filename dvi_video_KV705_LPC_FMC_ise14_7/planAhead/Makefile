# Created : 13:18:43, Tue Oct 2, 2012 : Sanjay Rai

# Description : Makefile to run smartXplorer for FMC_DVIDP_CONFIG_test :: xc7k325t-2-ffg900 
# Usage : make 
# Usage : make clean 

.PHONY: clean

planahead.log : pa.tcl
	planAhead -source pa.tcl

clean:
	-rm -rf .Xil-PlanAhead* 
	-rm -rf .HDI* 
	-rm -rf planAhead* 
	-rm -rf .compxlib.log
	-rm -rf *.log
	-rm -rf _xmsgs 
	-rm -rf .Xil
