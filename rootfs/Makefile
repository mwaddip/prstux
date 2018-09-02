.PHONY: stage1 stage2 stage3 clean_stage1 clean_stage2 clean_stage3 clean

stage1:
	./make-base.sh
	
stage2: stage1
	docker build -t prstux .
	
stage3: final_root.tar

final_root.tar: stage2
	./make-rootfs.sh	

clean_stage1:
	docker rmi prstux-base

clean_stage2:
	docker rmi prstux

clean_stage3:
	rm -rf final_root.tar

all: stage3

clean: clean_stage3
