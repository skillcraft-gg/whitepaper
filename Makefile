SOURCES := \
	00-title.md \
	01-abstract.md \
	02-introduction.md \
	03-problem-and-scope.md \
	04-architecture-overview.md \
	05-evidence-model.md \
	06-loadout-and-skill-composition.md \
	07-claim-and-credential-verification.md \
	08-identifiers-and-contracts.md \
	09-trust-model-and-risks.md \
	11-conclusion.md

ASSETS := \
	pandoc-header.tex \
	skillcraft-logo-black.png

PDF := skillcraft.pdf
HTML := skillcraft.html

PDF_ENGINE := xelatex

all: $(PDF)

build: $(PDF)

$(PDF): $(SOURCES) $(ASSETS)
	 pandoc $(SOURCES) --from=markdown --to=pdf --standalone --toc --pdf-engine=$(PDF_ENGINE) --include-in-header=pandoc-header.tex -o $(PDF)

html: $(HTML)

$(HTML): $(SOURCES)
	 pandoc $(SOURCES) --standalone -t html5 --toc -o $(HTML)

clean:
	rm -f $(PDF) $(HTML)

.PHONY: all build html clean
