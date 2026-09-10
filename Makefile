SRCFILES :=  $(wildcard archetypes/**/* assets/**/* content/**/* data/**/* layouts/**/* static/**/*) config.yaml
DEPS := $(wildcard node_modules/**/*) 
LFTP := lftp_script.sh

BASE_URL := https://perso.ens-lyon.fr/vivien.gachet/


.PHONY: all 
all: public 

.PHONY: test
test: public
	hugo server

.PHONY: deploy
deploy: public $(LFTP)
	lftp -f lftp_script.sh

public: $(SRCFILES) $(DEPS) node_modules
	hugo -b $(BASE_URL) --minify --cleanDestinationDir --gc; npx -y pagefind --site public 

node_modules: 
	npm install

.PHONY: superclean
superclean: clean
	rm -rf node_modules

.PHONY: clean
clean:
	hugo mod clean;	rm -rf .hugo_build.lock public resources