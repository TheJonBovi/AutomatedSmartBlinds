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

#ifndef _STEPPER_TEST_H    /* Guard against multiple inclusion */
#define _STEPPER_TEST_H

// function to use buttons to test UD motor
void motor_test_UD(void);

// function to use buttons to test UD motor
void motor_test_OC(void);

//function to test both the proxy and stepper motors simultaneously
void proxy_motor_test(void);

//function to test the temperature sensor and close the blinds
//both during high and low temperatures
void temperature_test(void);


#endif /* _STEPPER_TEST_H */

/* *****************************************************************************
 End of File
 */
