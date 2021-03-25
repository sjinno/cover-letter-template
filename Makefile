default: cover-letter.tex
	mkdir -p build
	xelatex -output-directory=build cover-letter.tex
	mv build/cover-letter.pdf ./


clean:
	rm -rf ./build