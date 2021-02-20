/**
 ** Name
 **   utils.h
 **
 ** Purpose
 **   Utilities
 **
 ** Revision
 **   02-Jan-2021 (SSB) [] Initial
 **/

#include "ptypes.h"

int16_t util_strcmp( uint8_t* s1, uint8_t* s2, uint16_t len );
void util_memcpy( uint8_t* dest, uint8_t* src, uint16_t len );
int16_t util_atoi( uint8_t* str );
void util_reverse( uint8_t* s, uint32_t s_len );
uint32_t util_itoa( int32_t n, uint8_t* s, uint32_t s_max );
uint16_t util_strnlen( const uint8_t* s, uint16_t len );
int16_t util_find_char( uint8_t* str, uint16_t len, uint8_t ch );
void util_memset( void* buff, uint8_t data, uint16_t len );
