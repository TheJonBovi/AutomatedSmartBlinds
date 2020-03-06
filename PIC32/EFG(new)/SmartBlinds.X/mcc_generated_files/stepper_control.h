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

#ifndef _STEPPER_CONTROL_H    /* Guard against multiple inclusion */
#define _STEPPER_CONTROL_H

// function to use buttons to test UD motor
void motor_test_UD(void);

// function to use buttons to test UD motor
void motor_test_OC(void);

//function to control both the proxy and stepper motors simultaneously
void proxy_motor_control(void);

//function to control temperature sensor and close the blinds
//both during high and low temperatures
void temperature_control(void);

// function to control gas sensor alarm
void gas_control(void);

//function to control based on incoming requests from the web server and
//execute said requests
void call_control(void);


#endif /* _STEPPER_CONTROL_H */

/* *****************************************************************************
 End of File
 */
