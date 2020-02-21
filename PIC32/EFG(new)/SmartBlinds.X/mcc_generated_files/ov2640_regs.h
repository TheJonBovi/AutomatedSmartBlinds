/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef __OV2640_REGS_H
#define __OV2640_REGS_H

#include <xc.h>

struct sensor_reg {
	uint16_t reg;
	uint16_t val;
};

#define OV2640_CHIPID_HIGH 	0x0A
#define OV2640_CHIPID_LOW 	0x0B

#endif // __OV2640_REGS_H