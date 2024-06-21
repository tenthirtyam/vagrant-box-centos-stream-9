.PHONY: build clean upload cilocal

build:
	./scripts/build_box.sh

clean:
	find . -type d -name "output" -exec rm -rf {} \;

upload:
	./scripts/upload_artifact.sh

cilocal: clean build upload
