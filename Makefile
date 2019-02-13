Version=0.8

PREFIX = /usr/local

ICONS = \
	$(wildcard icons/*.svg) \
	$(wildcard icons/*.png) \
	$(wildcard logo/*.svg)

BACKGROUNDS = \
	$(wildcard backgrounds/*.jpg) \
	$(wildcard backgrounds/*.png)

install_icons:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/icons/artix
	install -m0644 ${ICONS} $(DESTDIR)$(PREFIX)/share/icons/artix

install_backgrounds:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/backgrounds
	install -m0755 ${BACKGROUNDS} $(DESTDIR)$(PREFIX)/share/backgrounds

install: install_icons install_backgrounds

.PHONY: install
