  @ECHO OFF
REM -- Automates cygwin installation
 
SETLOCAL
 
REM -- Change to the directory of the executing batch file
CD %~dp0
 
REM -- Configure our paths
SET SITE=http://cygwin.mirrors.pair.com/
SET LOCALDIR=%CD%
SET ROOTDIR=C:/cygwin
 
REM -- These are the packages we will install (in addition to the default packages)
SET PACKAGES=mintty,wget,ctags,diffutils,git,git-completion,git-svn,stgit,mercurial
SET PACKAGES=%PACKAGES%,gcc4,make,automake,autoconf,readline,libncursesw-devel,libiconv
SET PACKAGES=%PACKAGES%,lua,python,ruby
 
REM -- Do it!
ECHO *** INSTALLING DEFAULT PACKAGES
setup -q -d -D -L -X -s %SITE% -l "%LOCALDIR%" -R "%ROOTDIR%"
ECHO.
ECHO.
ECHO *** INSTALLING CUSTOM PACKAGES
setup -q -d -D -L -X -s %SITE% -l "%LOCALDIR%" -R "%ROOTDIR%" -P %PACKAGES%
 
REM -- Show what we did
ECHO.
ECHO.
ECHO cygwin installation updated
ECHO  - %PACKAGES%
ECHO.
 
ENDLOCAL
 
PAUSE
EXIT /B 0
