
# Create a new draft
# Usage: make [draft-short-name]

files = $(wildcard *)
reserved = Abandoned Published Tools Makefile index.md README.md _includes _layouts
drafts = $(filter-out $(reserved), $(files))

%::
	cp -a Tools/skel $@
	mv $@/draft-nottingham--00.xml $@/draft-nottingham-$@-00.xml
	sed -i '' -e"s/SHORTNAME/$@/g" \
		$@/draft-nottingham-$@-00.xml
	sed -i '' -e"s/SHORTNAME/$@/g" \
		$@/draft.md

.PHONY: index.md
index.md: $(drafts)
	echo "---\nlayout: front\n---" > $@
	echo '$(foreach draft,$(drafts),\n* [$(draft)]($(draft)))' >> $@