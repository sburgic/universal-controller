/**
 ** Name
 **   main.h
 **
 ** Purpose
 **   Main application definitions
 **
 ** Revision
 **   30-Aug-2020 (SSB) [] Initial
 **/

#ifndef __MAIN_H__
#define __MAIN_H__

#define APP_VER_MAJOR 1
#define APP_VER_MINOR 0
#define APP_VER_PATCH 0

#define STRINGIFY_TMP(s) # s
#define STRINGIFY(s)     STRINGIFY_TMP(s)

#define APP_SW_VERSION "SW ver."STRINGIFY(APP_VER_MAJOR)"."\
                       STRINGIFY(APP_VER_MINOR)"."STRINGIFY(APP_VER_PATCH)""

#endif /* __MAIN_H__ */
