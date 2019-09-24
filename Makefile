
PREFIX = /usr/local

con: con.sh con.awk con.tsv
	cat con.sh > $@
	echo 'exit 0' >> $@
	echo "#EOF" >> $@
	tar cz con.awk con.tsv >> $@
	chmod +x $@

test: con.sh
	shellcheck -s sh con.sh

clean:
	rm -f con

install: con
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f con $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/con

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/con

.PHONY: test clean install uninstall
