SRCFILES :=  $(wildcard archetypes/**/* assets/**/* content/**/* data/**/* layouts/**/* static/**/*) config.yaml
DEPS := $(wildcard node_modules/**/*)
LFTP := lftp_script.sh

.PHONY: all
all: public

public: $(SRCFILES)
	hugo --minify --cleanDestinationDir --gc

.PHONY: deploy
deploy: public $(LFTP)
	lftp -f lftp_script.sh


.PHONY: clean
clean:
	rm -r hugo_stats.json .hugo_build.lock public/* build.ps1

.PHONY: test
test:
	hugo server
