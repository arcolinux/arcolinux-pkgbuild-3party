libnautilus_share_la_CFLAGS =				\
	-Wall						\
	-DG_LOG_DOMAIN=\"Nautilus-Share\"		\
	-DDATADIR=\"$(datadir)\"			\
	-I$(top_srcdir)					\
	-I$(top_builddir)				\
	$(WARN_CFLAGS)                                  \
	$(DISABLE_DEPRECATED_CFLAGS)			\
	$(NAUTILUS_CFLAGS)				\
	$(GLIB_CFLAGS)

nautilus_extensiondir=$(NAUTILUS_EXTENSION_DIR)

nautilus_extension_LTLIBRARIES=libnautilus-share.la

libnautilus_share_la_SOURCES =  \
	nautilus-share.c        \
	nautilus-share.h	\
	shares.c		\
	shares.h

libnautilus_share_la_LDFLAGS = -module -avoid-version
libnautilus_share_la_LIBADD  = $(GLIB_LIBS) $(NAUTILUS_LIBS)
