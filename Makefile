SRCFILES :=  $(wildcard archetypes/**/* assets/**/* content/**/* data/**/* layouts/**/* static/**/*) config.yaml
MODS := go.mod go.sum
DEPS := $(wildcard node_modules/**/*)
LFTP := lftp_script.sh


.PHONY: all 
all: public $(DEPS) $(MODS)	

public: $(SRCFILES)
	hugo --minify --cleanDestinationDir --gc

.PHONY: deploy
deploy: public $(LFTP)
	lftp -f lftp_script.sh


.PHONY: clean
clean:
	hugo mod clean
	rm -r hugo_stats.json .hugo_build.lock public/* resources/*

.PHONY: test
test:
	hugo server
