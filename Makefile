Version=0.7

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

install_backgrounds:
	install -dm0755 $(DESTDIR)$(PREFIX)/share/backgrounds
	install -m0755 ${BACKGROUNDS} $(DESTDIR)$(PREFIX)/share/backgrounds

uninstall_icons:
	for f in ${ICONS}; do rm -f $(DESTDIR)$(PREFIX)/share/icons/artix/$$f; done

uninstall_backgrounds:
	for f in ${BACKGROUNDS}; do rm -f $(DESTDIR)$(PREFIX)/share/backgrounds/$$f; done

install: install_icons install_backgrounds

uninstall: uninstall_icons uninstall_backgrounds

dist:
	git archive --format=tar --prefix=artwork-$(Version)/ $(Version) | gzip -9 > artwork-$(Version).tar.gz
	gpg --detach-sign --use-agent artwork-$(Version).tar.gz

.PHONY: install uninstall dist
