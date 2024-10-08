#
# Patched for FreeBSD based on swindlemccoop's patch for OpenBSD.
#
# dwm version
VERSION = 6.3

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

#X11INC = /usr/X11R6/include
#X11LIB = /usr/X11R6/lib
X11INC=/usr/local/include 
X11LIB=/usr/local/lib
# changed for FreeBSD

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/local/include/freetype2
KVMLIB = -lkvm
# changed for FreeBSD

# Uncomment this for the alpha patch and the winicon patch (BAR_ALPHA_PATCH, BAR_WINICON_PATCH)
XRENDER = -lXrender

# Uncomment this for the mdpcontrol patch / MDPCONTROL_PATCH
#MPDCLIENT = -lmpdclient

# Uncomment for the pango patch / BAR_PANGO_PATCH
#PANGOINC = `pkg-config --cflags xft pango pangoxft`
#PANGOLIB = `pkg-config --libs xft pango pangoxft`

# Uncomment for the ipc patch / IPC_PATCH
#YAJLLIBS = -lyajl
#YAJLINC = -I/usr/include/yajl

# Uncomment this for the rounded corners patch / ROUNDED_CORNERS_PATCH
#XEXTLIB = -lXext

# Uncomment this for the swallow patch / SWALLOW_PATCH
XCBLIBS = -lX11-xcb -lxcb -lxcb-res

# This is needed for the winicon and tagpreview patches / BAR_WINICON_PATCH / BAR_TAGPREVIEW_PATCH
#IMLIB2LIBS = -lImlib2

# includes and libs
INCS = -I${X11INC} -I${FREETYPEINC} ${YAJLINC} ${PANGOINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS}  ${XRENDER} ${MPDCLIENT} ${XEXTLIB} ${XCBLIBS} ${KVMLIB} ${PANGOLIB} ${YAJLLIBS} ${IMLIB2LIBS}

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=200809L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
#CFLAGS   = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Wno-unused-function -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = ${LIBS}

# compiler and linker
CC = cc
