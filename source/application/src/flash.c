/**
 ** Name
 **   flash.c
 **
 ** Purpose
 **   Flash routines
 **
 ** Revision
 **   28-Aug-2020 (SSB) [] Initial
 **   24-Feb-2021 (SSB) [] Implement basic functionality
 **/

#include "flash.h"

status_t flash_read( void* buff, uint32_t size, uint32_t offset )
{
    status_t ret      = STATUS_ERROR;
    uint32_t location = FLASH_USER_PAGE_ADDR + offset;
    uint32_t i;
    uint8_t* data     = (uint8_t*) buff;

    if ( NULL != data )
    {
        if (( offset + size ) <= FLASH_PAGE_SIZE )
        {
            for ( i = 0; i < size; i++ )
            {
                data[i] = *(volatile uint8_t*)( location + i );
            }

            ret = STATUS_OK;
        }
    }

    return ret;
}

status_t flash_write( void* buff, uint32_t size, uint32_t offset )
{
    status_t               ret  = STATUS_OK;
    HAL_StatusTypeDef      hret = HAL_ERROR;
    FLASH_EraseInitTypeDef erase = {0};
    uint32_t               page_error;
    uint32_t               i = 0;
    uint32_t*              ptr = (uint32_t*)buff;

    erase.TypeErase   = FLASH_TYPEERASE_PAGES;
    erase.PageAddress = FLASH_USER_PAGE_ADDR;
    erase.NbPages     = 1;

    if ( NULL != buff )
    {
        HAL_FLASH_Unlock();

        /* Erase the user page */
        erase.PageAddress = FLASH_USER_PAGE_ADDR;

        hret = HAL_FLASHEx_Erase( &erase, &page_error );

        if (( HAL_OK == hret ) && ( FLASH_PAGE_ERASE_OK == page_error ))
        {
            for ( i = 0; i < size; i += 4 )
            {
                hret |= HAL_FLASH_Program
                            ( FLASH_TYPEPROGRAM_WORD
                            , FLASH_USER_PAGE_ADDR + i
                            , *ptr
                            );
                ptr++;
            }
        }

        HAL_FLASH_Lock();
    }

    if ( HAL_OK != hret )
    {
        ret = STATUS_ERROR;
    }

    return ret;
}

status_t flash_erase( void )
{
    status_t               ret  = STATUS_OK;
    HAL_StatusTypeDef      hret;
    FLASH_EraseInitTypeDef erase = {0};
    uint32_t               page_error;

    erase.TypeErase   = FLASH_TYPEERASE_PAGES;
    erase.PageAddress = FLASH_USER_PAGE_ADDR;
    erase.NbPages     = 1;

    HAL_FLASH_Unlock();

    erase.PageAddress = FLASH_USER_PAGE_ADDR;

    hret = HAL_FLASHEx_Erase( &erase, &page_error );

    HAL_FLASH_Lock();

    if ( HAL_OK != hret )
    {
        ret = STATUS_ERROR;
    }

    return ret;
}
