# Locate SDL_ttf library
# This module defines
# SDLTTF_LIBRARY, the name of the library to link against
# SDLTTF_FOUND, if false, do not try to link to SDL
# SDLTTF_INCLUDE_DIR, where to find SDL/SDL.h
#
# $SDLDIR is an environment variable that would
# correspond to the ./configure --prefix=$SDLDIR
# used in building SDL.
#
# Created by Eric Wing. This was influenced by the FindSDL.cmake 
# module, but with modifications to recognize OS X frameworks and 
# additional Unix paths (FreeBSD, etc).

# On OSX, this will prefer the Framework version (if found) over others.
# People will have to manually change the cache values of 
# SDLTTF_LIBRARY to override this selection.
FIND_PATH(SDLTTF_INCLUDE_DIR SDL_ttf.h
  ~/Library/Frameworks/SDL_ttf.framework/Headers
  /Library/Frameworks/SDL_ttf.framework/Headers
  $ENV{SDLDIR}/include
  $ENV{SDLTTFDIR}/include
  /usr/include/SDL
  /usr/include/SDL12
  /usr/include/SDL11
  /usr/include
  /usr/local/include/SDL
  /usr/local/include/SDL12
  /usr/local/include/SDL11
  /usr/local/include
  /sw/include
  )
# I'm not sure if I should do a special casing for Apple. It is 
# unlikely that other Unix systems will find the framework path.
# But if they do ([Next|Open|GNU]Step?), 
# do they want the -framework option also?
IF(${SDLTTF_INCLUDE_DIR} MATCHES ".framework")
  SET (SDLTTF_LIBRARY "-framework SDL_ttf" CACHE STRING "SDL_ttf framework for OSX")
ELSE(${SDLTTF_INCLUDE_DIR} MATCHES ".framework")
  FIND_LIBRARY(SDLTTF_LIBRARY 
    NAMES SDL_ttf
    PATHS
    $ENV{SDLDIR}/lib
    $ENV{SDLTTFDIR}/lib
    /usr/lib
    /usr/local/lib
    /sw/lib
    )
ENDIF(${SDLTTF_INCLUDE_DIR} MATCHES ".framework")

SET(SDLTTF_FOUND "NO")
IF(SDLTTF_LIBRARY)
  SET(SDLTTF_FOUND "YES")
ENDIF(SDLTTF_LIBRARY)

