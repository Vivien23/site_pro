SRCFILES :=  $(wildcard archetypes/**/* assets/**/* config/**/* content/**/* data/**/* themes/**/*)
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
	rm -r public