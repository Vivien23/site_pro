SRCFILES :=  $(wildcard archetypes/**/* assets/**/* content/**/* data/**/* layouts/**/* static/**/*) config.yaml
DEPS := $(wildcard node_modules/**/*)
LFTP := lftp_script.sh


.PHONY: all 
all: public $(DEPS)

public: $(SRCFILES)
	hugo --minify --cleanDestinationDir --gc

.PHONY: deploy
deploy: public $(LFTP)
	lftp -f lftp_script.sh


.PHONY: clean
clean:
	hugo mod clean
	rm -rf hugo_stats.json .hugo_build.lock public resources

.PHONY: test
test:
	hugo server
