# latexmk самостоятельно анализирует файл,
# проверяет даты изменений необходимых включаемых файлов,
# проверяет наличие bibtex/makeindex команд и, если это надо,
# выполняет все необходимые команды в правильном порядке.

# Название файла по названию каталога с файлами проекта
DOCNAME :='$(shell pwd | rev | cut -d "/" -f 1 | rev)'

XELATEX=xelatex
PDFLATEX=pdflatex
BUILD_DIR="build"

# сборка по-умолчанию
DEFAULTEX=$(XELATEX)

all: $(DEFAULTEX)
	@echo "[*]"
	@echo "[*] Compile $(DOCNAME) with $(DEFAULTEX)."
	@echo "[*]"

pdflatex: $(BUILD_DIR)/$(DOCNAME).pdf

$(BUILD_DIR)/$(DOCNAME).pdf: src/*.tex
	mkdir -p $(BUILD_DIR)
	latexmk -g -pdf main.tex -jobname=$(PDFLATEX)
	mv $(PDFLATEX).pdf $(BUILD_DIR)/$(DOCNAME).pdf

xelatex: $(BUILD_DIR)/$(XELATEX).pdf

$(BUILD_DIR)/$(XELATEX).pdf: src/*.tex
	mkdir -p $(BUILD_DIR)
	latexmk -g -$(XELATEX) main.tex -jobname=$(XELATEX)
	mv $(XELATEX).pdf $(BUILD_DIR)/$(DOCNAME).pdf

clean:
	rm -f src/*.aux *.out *.run.xml *.bbl *.run.xml *.bbl *.aux *.bcf *.blg *.fls *.log *.fdb_latexmk *.toc *.xdv *.nav *.snm

clean_pdf:
	rm -f $(BUILD_DIR)/$(DOCNAME).pdf

clean_all:
	rm -rf src/*.aux *.out *.run.xml *.bbl *.run.xml *.bbl *.aux *.bcf *.blg *.fls *.log *.fdb_latexmk *.toc *.xdv *.nav *.snm build/
