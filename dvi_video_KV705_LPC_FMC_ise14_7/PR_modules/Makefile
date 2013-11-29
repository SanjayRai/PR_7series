# Created : 17:0:3, Wed Apr 6, 2011 : Sanjay Rai

ALL:
	cd ../coregen && make
	cd PR_module_A_video_black_and_white/synth && make
	cd PR_module_A_video_bypass/synth && make
	cd PR_module_A_video_color_inv/synth && make
	cd PR_module_A_video_crossover/synth && make
	cd PR_module_A_video_softness/synth && make
	cd ../build && make
	cd PR_module_A_static/build && make
	cd PR_module_A_video_black_and_white/build && make
	cd PR_module_A_video_bypass/build && make
	cd PR_module_A_video_color_inv/build && make
	cd PR_module_A_video_crossover/build && make
	cd PR_module_A_video_softness/build && make

clean:
	cd ../build && make clean
	cd PR_module_A_static/build && make clean
	cd PR_module_A_video_black_and_white/build && make clean
	cd PR_module_A_video_bypass/build && make clean
	cd PR_module_A_video_color_inv/build && make clean
	cd PR_module_A_video_crossover/build && make clean
	cd PR_module_A_video_softness/build && make clean
	-rm PR_BIT_FILES/*.bit
	-rm PR_BIT_FILES/*.log

clean_all:
	cd PR_module_A_video_black_and_white/synth && make clean
	cd PR_module_A_video_bypass/synth && make clean
	cd PR_module_A_video_color_inv/synth && make clean
	cd PR_module_A_video_crossover/synth && make clean
	cd PR_module_A_video_softness/synth && make clean
	cd ../coregen && make clean
	cd ../build && make clean_all
	cd PR_module_A_static/build && make clean
	cd PR_module_A_video_black_and_white/build && make clean
	cd PR_module_A_video_bypass/build && make clean
	cd PR_module_A_video_color_inv/build && make clean
	cd PR_module_A_video_crossover/build && make clean
	cd PR_module_A_video_softness/build && make clean
	-rm PR_BIT_FILES/*.bit
	-rm PR_BIT_FILES/*.log
