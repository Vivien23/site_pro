SRCFILES :=  $(wildcard archetypes/**/* assets/**/* config/**/* content/**/* data/**/* i18n/**/* layouts/**/* themes/**/* )
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
	rm -r public resources

.PHONY: test
test:
	hugo