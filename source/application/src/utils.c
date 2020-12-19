#include "utils.h"

int16_t util_strcmp( uint8_t* s1, uint8_t* s2, uint16_t len )
{
    int16_t retval = (int16_t)0;

    if (( NULL != s1 ) && ( NULL != s2 ))
    {
        while( len )
        {
            len--;
            if (( *s1 != *s2 ) || ( *s1 == (uint8_t)0U )
                               || ( *s2 == (uint8_t)0U ))
            {
                retval = (int16_t)(*s1 - *s2);
                break;
            }
            s1++;
            s2++;
        }
    }

    return retval;
}

void util_memcpy( uint8_t* dest, uint8_t* src, uint16_t len )
{
    uint16_t i;

    if (( NULL != dest ) && ( NULL != src ))
    {
        for ( i = 0; i < len; i++ )
        {
            dest[i] = src[i];
        }
    }
}
