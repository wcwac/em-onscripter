# -*- Makefile -*-
#
# Makefile.Linux - Makefile rules for linux
#

EXESUFFIX = .html
OBJSUFFIX = .o

.SUFFIXES: $(OBJSUFFIX) .cpp .h

TARGET = onscripter$(EXESUFFIX)
EXT_OBJS = 

# mandatory: SDL, SDL_ttf, SDL_image, SDL_mixer, bzip2
DEFS = -DLINUX -DUSE_SDL_RENDERER -DNDEBUG -DWASM
EXT_FLAGS =  -s USE_SDL=2  
EXT_FLAGS += -s USE_SDL_TTF=2
EXT_FLAGS += -s USE_SDL_IMAGE=2    
EXT_FLAGS += -s USE_SDL_MIXER=2
EXT_FLAGS += -s USE_BZIP2=1
EXT_FLAGS += -s SDL2_MIXER_FORMATS='["ogg","mp3"]'
EXT_FLAGS += -s SDL2_IMAGE_FORMATS='["bmp","png","xpm","jpg"]'

# recommended: smpeg
#DEFS += -DUSE_SMPEG
#INCS += `smpeg-config --cflags`

# recommended: OggVorbis 
DEFS += -DUSE_OGG_VORBIS
EXT_FLAGS += -s USE_OGG=1 -s USE_VORBIS=1

# optional: Integer OggVorbis
DEFS += -DUSE_OGG_VORBIS -DINTEGER_OGG_VORBIS

# optional: lua
# DEFS += -DUSE_LUA
# INCS += -I/usr/include/lua5.1
# LIBS += -llua5.1
# EXT_OBJS += LUAHandler$(OBJSUFFIX)

# for emscripten em++
CC = em++
LD = em++ 
LD += -s ASYNCIFY
LD += -s ALLOW_MEMORY_GROWTH=1  
LD += -s ENVIRONMENT=web
LD += --preload-file ./onscripter@/
LD += -o

#CFLAGS = -g -Wall -pipe -c $(INCS) $(DEFS) -s TOTAL_MEMORY=1073741824 -s TOTAL_STACK=268435456 --source-map-base http://localhost:8000/ 
CFLAGS = -std=c++11 -Wall -fomit-frame-pointer -pipe -c $(INCS) $(DEFS) $(EXT_FLAGS) -O3

RM = rm -f

include Makefile.onscripter
