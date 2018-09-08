.PHONY: stage1 stage2 stage3 clean_stage1 clean_stage2 clean_stage3 koreader clean 

stage1:
	./make-base.sh
	
stage2: stage1
	docker build -t prstux .
	
stage3: final_root.tar

final_root.tar: stage2 koreader
	./make-rootfs.sh	

clean_stage1:
	docker rmi prstux-base

clean_stage2:
	docker rmi prstux

clean_stage3:
	rm -rf final_root.tar

koreader:
ifeq (,$(wildcard ./koreader-sony-prstux-*.zip))
	# retrieve latest release of koreader for PRSTUX 
	curl --silent "https://api.github.com/repos/koreader/koreader/releases/latest" | fgrep download_url | fgrep koreader-sony-prstux | sed -r 's|[^:]+: "(.+)"|\1|g' | xargs wget
endif

all: stage3

clean: clean_stage3


