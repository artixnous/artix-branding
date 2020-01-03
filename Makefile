Version=0.8.6

PREFIX = /usr/local

ICONS = \
	$(wildcard icons/*.svg) \
	$(wildcard icons/*.png)

BACKGROUNDS = \
	$(wildcard backgrounds/*.jpg) \
	$(wildcard backgrounds/*.png)

install_icons:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/icons/artix
	install -m0644 ${ICONS} $(DESTDIR)$(PREFIX)/share/icons/artix

install_logo:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps
	install -m0644 icons/logo.svg $(DESTDIR)$(PREFIX)/share/icons/hicolor/scalable/apps/artixlinux-logo.svg

install_backgrounds:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/backgrounds
	install -m0755 ${BACKGROUNDS} $(DESTDIR)$(PREFIX)/share/backgrounds
	install -dm0755 $(DESTDIR)$(PREFIX)/share/gnome-background-properties
	install -m0755 backgrounds/artix.xml $(DESTDIR)$(PREFIX)/share/gnome-background-properties/artix.xml

install: install_icons install_logo install_backgrounds

.PHONY: install install_icons install_logo install_backgrounds
