#
#	Makefile
#

PREFIX?= /usr/local

MAN=
BINDIR=$(PREFIX)/sbin
#FILESDIR=$(PREFIX)/lib/iohyve
RCDIR=$(PREFIX)/etc/rc.d
MANDIR=$(PREFIX)/man/man8
MKDIR=mkdir
REMOVE=/bin/rm -f

SCRIPTS=iohyve
SCRIPTSDIR=${PREFIX}/BINDIR
MAN=	$(SCRIPTS).8

${SCRIPTS}:
	@echo Nothing needs to be done for iohyve.

install:: all
	$(MKDIR) -p $(BINDIR)
	$(MKDIR) -p $(RCDIR)
#	$(MKDIR) -p $(FILESDIR)
	$(INSTALL) -c -m $(BINMODE) ${.OBJDIR}/$(SCRIPTS) $(BINDIR)/
#	$(INSTALL) -c ${.OBJDIR}/lib/* $(FILESDIR)/
	$(INSTALL) -c ${.OBJDIR}/rc.d/* $(RCDIR)/
	$(INSTALL) -c $(MAN).gz $(MANDIR)/

deinstall:
	$(REMOVE) $(BINDIR)/$(SCRIPTS)
	$(REMOVE) $(RCDIR)/iohyve
	$(REMOVE) $(MANDIR)/$(MAN).gz

.include <bsd.prog.mk>
