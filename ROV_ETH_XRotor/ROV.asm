_init_LEVI:
;ROV.c,320 :: 		void init_LEVI()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,322 :: 		pwm_period = PWM_TIM4_Init(50);
MOVS	R0, #50
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;ROV.c,325 :: 		PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PB9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PB9+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;ROV.c,327 :: 		}
L_end_init_LEVI:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_LEVI
_init_DESNI:
;ROV.c,332 :: 		void init_DESNI()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,334 :: 		pwm_period = PWM_TIM3_Init(50);
MOVS	R0, #50
BL	_PWM_TIM3_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;ROV.c,337 :: 		PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PB0);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH3_PB0+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH3_PB0+0)
MOVS	R0, #2
BL	_PWM_TIM3_Start+0
;ROV.c,339 :: 		}
L_end_init_DESNI:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_DESNI
_init_THRUSTER:
;ROV.c,344 :: 		void init_THRUSTER()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,346 :: 		pwm_period = PWM_TIM4_Init(50);
MOVS	R0, #50
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;ROV.c,349 :: 		PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PB8+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PB8+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;ROV.c,351 :: 		}
L_end_init_THRUSTER:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_THRUSTER
_init_SVETLO:
;ROV.c,355 :: 		void init_SVETLO()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,357 :: 		pwm_period = PWM_TIM9_Init(50);
MOVS	R0, #50
BL	_PWM_TIM9_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;ROV.c,360 :: 		PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVS	R0, #0
BL	_PWM_TIM9_Start+0
;ROV.c,362 :: 		}
L_end_init_SVETLO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_SVETLO
_init_P2Click:
;ROV.c,369 :: 		void init_P2Click(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,371 :: 		GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_11);
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;ROV.c,376 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
;ROV.c,375 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #773
;ROV.c,373 :: 		SPI2_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #3
;ROV.c,376 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
BL	_SPI2_Init_Advanced+0
;ROV.c,378 :: 		}
L_end_init_P2Click:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_P2Click
_Napred:
;ROV.c,388 :: 		void Napred(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,393 :: 		LEVI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV.c,395 :: 		DESNI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV.c,397 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV.c,402 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #2650
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,404 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;ROV.c,406 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,409 :: 		}
L_end_Napred:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Napred
_Nazad:
;ROV.c,413 :: 		void Nazad(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,415 :: 		LEVI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV.c,417 :: 		DESNI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV.c,419 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV.c,422 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #2310
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,424 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;ROV.c,426 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,430 :: 		}
L_end_Nazad:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Nazad
_Levo:
;ROV.c,434 :: 		void Levo(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,436 :: 		LEVI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV.c,438 :: 		DESNI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV.c,440 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV.c,444 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #2650
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,446 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;ROV.c,448 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,452 :: 		}
L_end_Levo:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Levo
_Desno:
;ROV.c,456 :: 		void Desno(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,458 :: 		LEVI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV.c,460 :: 		DESNI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV.c,462 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV.c,465 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #2310
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,467 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;ROV.c,469 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,473 :: 		}
L_end_Desno:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Desno
_Zaron:
;ROV.c,477 :: 		void Zaron(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,479 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV.c,481 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV.c,483 :: 		THRUSTER=ZARON;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV.c,487 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #2453
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,489 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;ROV.c,491 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,495 :: 		}
L_end_Zaron:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Zaron
_Izron:
;ROV.c,500 :: 		void Izron(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,502 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV.c,504 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV.c,506 :: 		THRUSTER=IZRON;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV.c,510 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #2453
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,512 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;ROV.c,514 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,518 :: 		}
L_end_Izron:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Izron
_Stop:
;ROV.c,522 :: 		void Stop(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,524 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV.c,526 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV.c,528 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV.c,531 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #2453
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,533 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;ROV.c,535 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,539 :: 		}
L_end_Stop:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Stop
_Svetlo_ON:
;ROV.c,545 :: 		void Svetlo_ON() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,547 :: 		SVETLO = UKLJUCENO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_SVETLO+0)
MOVT	R0, #hi_addr(_SVETLO+0)
STRH	R1, [R0, #0]
;ROV.c,552 :: 		PWM_TIM9_Set_Duty(SVETLO,_PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R0, #2650
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM9_Set_Duty+0
;ROV.c,554 :: 		}
L_end_Svetlo_ON:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Svetlo_ON
_Svetlo_OFF:
;ROV.c,558 :: 		void Svetlo_OFF(){
;ROV.c,560 :: 		SVETLO = ISKLJUCENO;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SVETLO+0)
MOVT	R0, #hi_addr(_SVETLO+0)
STRH	R1, [R0, #0]
;ROV.c,562 :: 		}
L_end_Svetlo_OFF:
BX	LR
; end of _Svetlo_OFF
_MSS5803_Reset:
;ROV.c,577 :: 		void MSS5803_Reset(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,578 :: 		Chip_Select = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;ROV.c,579 :: 		SPI2_Write(MS5803_CMD_RESET);
MOVS	R0, #30
BL	_SPI2_Write+0
;ROV.c,580 :: 		Delay_ms(5);
MOVW	R7, #53390
MOVT	R7, #3
NOP
NOP
L_MSS5803_Reset0:
SUBS	R7, R7, #1
BNE	L_MSS5803_Reset0
NOP
NOP
NOP
;ROV.c,581 :: 		Chip_Select = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;ROV.c,583 :: 		}
L_end_MSS5803_Reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MSS5803_Reset
_Read_MSS5803_ReadCoefficient:
;ROV.c,586 :: 		unsigned Read_MSS5803_ReadCoefficient(char index){
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;ROV.c,587 :: 		unsigned int result = 0;
;ROV.c,588 :: 		Chip_Select = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV.c,589 :: 		SPI2_Read(MS5803_CMD_PROM_RD + (index*2));
LSLS	R1, R0, #1
SXTH	R1, R1
; index end address is: 0 (R0)
ADDS	R1, #160
UXTH	R0, R1
BL	_SPI2_Read+0
;ROV.c,590 :: 		result=SPI2_read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
;ROV.c,591 :: 		result=result << 8;
LSLS	R1, R0, #8
; result start address is: 16 (R4)
UXTH	R4, R1
;ROV.c,592 :: 		result |= SPI2_Read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
ORR	R3, R4, R0, LSL #0
; result end address is: 16 (R4)
;ROV.c,593 :: 		Chip_Select = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV.c,595 :: 		return result;
UXTH	R0, R3
;ROV.c,596 :: 		}
L_end_Read_MSS5803_ReadCoefficient:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Read_MSS5803_ReadCoefficient
_MS5803_CRC4:
;ROV.c,601 :: 		char MS5803_CRC4(unsigned int n_prom[]){
; n_rem start address is: 0 (R0)
;ROV.c,607 :: 		n_rem = 0x00;
MOVS	R0, #0
;ROV.c,608 :: 		crc_read = sensorCoefficients[7];
MOVW	R2, #lo_addr(ROV_sensorCoefficients+14)
MOVT	R2, #hi_addr(ROV_sensorCoefficients+14)
; crc_read start address is: 12 (R3)
LDRH	R3, [R2, #0]
;ROV.c,609 :: 		sensorCoefficients[7] = ( 0xFF00 & ( sensorCoefficients[7] ) );
MOV	R1, R2
LDRH	R1, [R1, #0]
AND	R1, R1, #65280
STRH	R1, [R2, #0]
;ROV.c,610 :: 		for (cnt = 0; cnt < 16; cnt++) {
; cnt start address is: 4 (R1)
MOVS	R1, #0
SXTH	R1, R1
; n_rem end address is: 0 (R0)
; cnt end address is: 4 (R1)
; crc_read end address is: 12 (R3)
UXTH	R4, R0
SXTH	R0, R1
L_MS5803_CRC42:
; cnt start address is: 0 (R0)
; crc_read start address is: 12 (R3)
; n_rem start address is: 16 (R4)
CMP	R0, #16
IT	GE
BGE	L_MS5803_CRC43
;ROV.c,612 :: 		if ( cnt%2 == 1 ) n_rem ^= (unsigned short) ( ( sensorCoefficients[cnt>>1] ) & 0x00FF );
MOVS	R2, #2
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
SXTH	R1, R1
CMP	R1, #1
IT	NE
BNE	L_MS5803_CRC45
ASRS	R1, R0, #1
SXTH	R1, R1
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(ROV_sensorCoefficients+0)
MOVT	R1, #hi_addr(ROV_sensorCoefficients+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
AND	R1, R1, #255
UXTB	R1, R1
EORS	R4, R1
UXTH	R4, R4
IT	AL
BAL	L_MS5803_CRC46
L_MS5803_CRC45:
;ROV.c,614 :: 		else n_rem ^= (unsigned short) ( sensorCoefficients[cnt>>1] >> 8 );
ASRS	R1, R0, #1
SXTH	R1, R1
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(ROV_sensorCoefficients+0)
MOVT	R1, #hi_addr(ROV_sensorCoefficients+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
LSRS	R1, R1, #8
UXTB	R1, R1
EOR	R1, R4, R1, LSL #0
; n_rem end address is: 16 (R4)
; n_rem start address is: 8 (R2)
UXTH	R2, R1
; n_rem end address is: 8 (R2)
UXTH	R4, R2
L_MS5803_CRC46:
;ROV.c,615 :: 		for ( n_bit = 8; n_bit > 0; n_bit-- ) {
; n_rem start address is: 16 (R4)
; n_bit start address is: 8 (R2)
MOVS	R2, #8
; crc_read end address is: 12 (R3)
; n_rem end address is: 16 (R4)
; n_bit end address is: 8 (R2)
; cnt end address is: 0 (R0)
L_MS5803_CRC47:
; n_bit start address is: 8 (R2)
; n_rem start address is: 16 (R4)
; crc_read start address is: 12 (R3)
; cnt start address is: 0 (R0)
CMP	R2, #0
IT	LS
BLS	L_MS5803_CRC48
;ROV.c,616 :: 		if ( n_rem & ( 0x8000 ) ) {
AND	R1, R4, #32768
UXTH	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_MS5803_CRC410
;ROV.c,617 :: 		n_rem = ( n_rem << 1 ) ^ 0x3000;
LSLS	R4, R4, #1
UXTH	R4, R4
; n_rem end address is: 16 (R4)
EOR	R4, R4, #12288
UXTH	R4, R4
; n_rem start address is: 16 (R4)
;ROV.c,618 :: 		}
IT	AL
BAL	L_MS5803_CRC411
L_MS5803_CRC410:
;ROV.c,620 :: 		n_rem = ( n_rem << 1 );
LSLS	R4, R4, #1
UXTH	R4, R4
; n_rem end address is: 16 (R4)
;ROV.c,621 :: 		}
L_MS5803_CRC411:
;ROV.c,615 :: 		for ( n_bit = 8; n_bit > 0; n_bit-- ) {
; n_rem start address is: 16 (R4)
SUBS	R2, R2, #1
UXTB	R2, R2
;ROV.c,622 :: 		}
; n_bit end address is: 8 (R2)
IT	AL
BAL	L_MS5803_CRC47
L_MS5803_CRC48:
;ROV.c,610 :: 		for (cnt = 0; cnt < 16; cnt++) {
ADDS	R0, R0, #1
SXTH	R0, R0
;ROV.c,623 :: 		}
; cnt end address is: 0 (R0)
IT	AL
BAL	L_MS5803_CRC42
L_MS5803_CRC43:
;ROV.c,625 :: 		n_rem = ( 0x000F & ( n_rem >> 12 ) );
LSRS	R1, R4, #12
UXTH	R1, R1
; n_rem end address is: 16 (R4)
AND	R2, R1, #15
;ROV.c,626 :: 		sensorCoefficients[7] = crc_read;
MOVW	R1, #lo_addr(ROV_sensorCoefficients+14)
MOVT	R1, #hi_addr(ROV_sensorCoefficients+14)
STRH	R3, [R1, #0]
; crc_read end address is: 12 (R3)
;ROV.c,628 :: 		return ( n_rem ^ 0x00 );
UXTB	R0, R2
;ROV.c,630 :: 		}
L_end_MS5803_CRC4:
BX	LR
; end of _MS5803_CRC4
_MS5803_Cmd_Adc:
;ROV.c,634 :: 		unsigned long MS5803_Cmd_Adc(char cmd){
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R4, R0
; cmd end address is: 0 (R0)
; cmd start address is: 16 (R4)
;ROV.c,635 :: 		unsigned long result = 0;
;ROV.c,636 :: 		unsigned long returnedData = 0;
;ROV.c,638 :: 		Chip_Select=0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV.c,639 :: 		SPI2_Write(MS5803_CMD_ADC_CONV + cmd);
ADDW	R1, R4, #64
UXTH	R0, R1
BL	_SPI2_Write+0
;ROV.c,640 :: 		switch (cmd & 0x0f) {
AND	R1, R4, #15
UXTB	R1, R1
; cmd end address is: 16 (R4)
IT	AL
BAL	L_MS5803_Cmd_Adc12
;ROV.c,641 :: 		case MS5803_CMD_ADC_256 : Delay_us(900); break;
L_MS5803_Cmd_Adc14:
MOVW	R7, #44998
MOVT	R7, #0
NOP
NOP
L_MS5803_Cmd_Adc15:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc15
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV.c,642 :: 		case MS5803_CMD_ADC_512 : Delay_ms(3);   break;
L_MS5803_Cmd_Adc17:
MOVW	R7, #18926
MOVT	R7, #2
NOP
NOP
L_MS5803_Cmd_Adc18:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc18
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV.c,643 :: 		case MS5803_CMD_ADC_1024: Delay_ms(4);   break;
L_MS5803_Cmd_Adc20:
MOVW	R7, #3390
MOVT	R7, #3
NOP
NOP
L_MS5803_Cmd_Adc21:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc21
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV.c,644 :: 		case MS5803_CMD_ADC_2048: Delay_ms(8);   break;
L_MS5803_Cmd_Adc23:
MOVW	R7, #6782
MOVT	R7, #6
NOP
NOP
L_MS5803_Cmd_Adc24:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc24
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV.c,645 :: 		case MS5803_CMD_ADC_4096: Delay_ms(14);  break;
L_MS5803_Cmd_Adc26:
MOVW	R7, #44638
MOVT	R7, #10
NOP
NOP
L_MS5803_Cmd_Adc27:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc27
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV.c,647 :: 		}
L_MS5803_Cmd_Adc12:
CMP	R1, #0
IT	EQ
BEQ	L_MS5803_Cmd_Adc14
CMP	R1, #2
IT	EQ
BEQ	L_MS5803_Cmd_Adc17
CMP	R1, #4
IT	EQ
BEQ	L_MS5803_Cmd_Adc20
CMP	R1, #6
IT	EQ
BEQ	L_MS5803_Cmd_Adc23
CMP	R1, #8
IT	EQ
BEQ	L_MS5803_Cmd_Adc26
L_MS5803_Cmd_Adc13:
;ROV.c,648 :: 		Chip_Select = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV.c,649 :: 		Delay_ms(3);
MOVW	R7, #18926
MOVT	R7, #2
NOP
NOP
L_MS5803_Cmd_Adc29:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc29
NOP
NOP
NOP
;ROV.c,650 :: 		Chip_Select = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV.c,651 :: 		SPI2_Read(MS5803_CMD_ADC_READ);
MOVS	R0, #0
BL	_SPI2_Read+0
;ROV.c,652 :: 		returnedData = SPI2_Read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
; returnedData start address is: 0 (R0)
;ROV.c,653 :: 		result = (returnedData << 16);
LSLS	R4, R0, #16
; returnedData end address is: 0 (R0)
; result start address is: 16 (R4)
;ROV.c,654 :: 		returnedData = SPI2_Read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
; returnedData start address is: 0 (R0)
;ROV.c,655 :: 		result = result + (returnedData << 8);
LSLS	R1, R0, #8
; returnedData end address is: 0 (R0)
ADDS	R4, R4, R1
;ROV.c,656 :: 		returnedData = SPI2_Read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
; returnedData start address is: 0 (R0)
;ROV.c,657 :: 		result = result + returnedData;
ADDS	R3, R4, R0
; result end address is: 16 (R4)
; returnedData end address is: 0 (R0)
;ROV.c,658 :: 		Chip_Select = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV.c,660 :: 		return result;
MOV	R0, R3
;ROV.c,661 :: 		}
L_end_MS5803_Cmd_Adc:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MS5803_Cmd_Adc
_MS5803_Init:
;ROV.c,665 :: 		char MS5803_Init() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;ROV.c,667 :: 		int i = 0;
;ROV.c,668 :: 		MSS5803_Reset();
BL	_MSS5803_Reset+0
;ROV.c,669 :: 		for ( i = 0; i < 8; i++ ){
; i start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
; i end address is: 20 (R5)
L_MS5803_Init31:
; i start address is: 20 (R5)
CMP	R5, #8
IT	GE
BGE	L_MS5803_Init32
;ROV.c,670 :: 		sensorCoefficients[ i ] = Read_MSS5803_ReadCoefficient( i );
LSLS	R1, R5, #1
MOVW	R0, #lo_addr(ROV_sensorCoefficients+0)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
UXTB	R0, R5
BL	_Read_MSS5803_ReadCoefficient+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;ROV.c,669 :: 		for ( i = 0; i < 8; i++ ){
ADDS	R5, R5, #1
SXTH	R5, R5
;ROV.c,671 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_MS5803_Init31
L_MS5803_Init32:
;ROV.c,672 :: 		p_crc = sensorCoefficients[ 7 ];
MOVW	R0, #lo_addr(ROV_sensorCoefficients+14)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+14)
; p_crc start address is: 20 (R5)
LDRH	R5, [R0, #0]
;ROV.c,673 :: 		n_crc = MS5803_CRC4( sensorCoefficients );
MOVW	R0, #lo_addr(ROV_sensorCoefficients+0)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+0)
BL	_MS5803_CRC4+0
; n_crc start address is: 0 (R0)
;ROV.c,676 :: 		asm nop
NOP
;ROV.c,680 :: 		if(p_crc!=n_crc){
CMP	R5, R0
IT	EQ
BEQ	L_MS5803_Init34
; p_crc end address is: 20 (R5)
; n_crc end address is: 0 (R0)
;ROV.c,681 :: 		return FALSE;
MOVS	R0, #0
IT	AL
BAL	L_end_MS5803_Init
;ROV.c,682 :: 		}
L_MS5803_Init34:
;ROV.c,686 :: 		return TRUE;
MOVS	R0, #1
;ROV.c,688 :: 		}
L_end_MS5803_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _MS5803_Init
_MS5803_Read_Sensor:
;ROV.c,692 :: 		void MS5803_Read_Sensor() {
SUB	SP, SP, #24
STR	LR, [SP, #0]
;ROV.c,693 :: 		q1 = MS5803_Cmd_Adc(MS5803_CMD_ADC_D1 + MS5803_CMD_ADC_4096);
MOVS	R0, #8
BL	_MS5803_Cmd_Adc+0
MOVW	R1, #lo_addr(ROV_q1+0)
MOVT	R1, #hi_addr(ROV_q1+0)
STR	R1, [SP, #20]
STR	R0, [R1, #0]
;ROV.c,694 :: 		q2 = MS5803_Cmd_Adc(MS5803_CMD_ADC_D2 + MS5803_CMD_ADC_4096);
MOVS	R0, #24
BL	_MS5803_Cmd_Adc+0
MOVW	R1, #lo_addr(ROV_q2+0)
MOVT	R1, #hi_addr(ROV_q2+0)
STR	R0, [R1, #0]
;ROV.c,697 :: 		asm nop
NOP
;ROV.c,700 :: 		deltaTemp = q2 - sensorCoefficients[5] * pow( 2, 8 );
VMOV.F32	S1, #8
VMOV.F32	S0, #2
BL	_pow+0
MOVW	R0, #lo_addr(ROV_sensorCoefficients+10)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+10)
LDRH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(ROV_q2+0)
MOVT	R0, #hi_addr(ROV_q2+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S0, S0
VSUB.F32	S0, S0, S1
VMOV	R0, S0
BL	__FloatToSignedLongLong+0
MOVW	R2, #lo_addr(_deltaTemp+0)
MOVT	R2, #hi_addr(_deltaTemp+0)
STR	R2, [SP, #16]
STRD	R0, R1, [R2, #0]
;ROV.c,701 :: 		sensorOffset = sensorCoefficients[2] * pow( 2, 16 ) + ( (long long)deltaTemp * sensorCoefficients[4] ) / pow( 2, 7 );
VMOV.F32	S1, #16
VMOV.F32	S0, #2
BL	_pow+0
MOVW	R0, #lo_addr(ROV_sensorCoefficients+4)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+4)
LDRH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [SP, #12]
MOVW	R0, #lo_addr(ROV_sensorCoefficients+8)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+8)
LDRH	R4, [R0, #0]
MOVS	R5, #0
MOVW	R0, #lo_addr(_deltaTemp+0)
MOVT	R0, #hi_addr(_deltaTemp+0)
LDRD	R2, R3, [R0, #0]
UMULL	R0, R1, R2, R4
MLA	R1, R3, R4, R1
MLA	R1, R2, R5, R1
STRD	R0, R1, [SP, #4]
VMOV.F32	S1, #7
VMOV.F32	S0, #2
BL	_pow+0
LDRD	R0, R1, [SP, #4]
VSTR	#1, S0, [SP, #4]
BL	__SignedLongLongToFloat+0
VMOV	S0, R0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S0, S1
VLDR	#1, S0, [SP, #12]
VADD.F32	S0, S0, S1
MOVW	R0, #lo_addr(ROV_sensorOffset+0)
MOVT	R0, #hi_addr(ROV_sensorOffset+0)
VSTR	#1, S0, [R0, #0]
;ROV.c,702 :: 		sensitivity = sensorCoefficients[1] * pow( 2, 15 ) + ( (long long)deltaTemp * sensorCoefficients[3] ) / pow( 2, 8 );
VMOV.F32	S1, #15
VMOV.F32	S0, #2
BL	_pow+0
MOVW	R0, #lo_addr(ROV_sensorCoefficients+2)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+2)
LDRH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [SP, #12]
MOVW	R0, #lo_addr(ROV_sensorCoefficients+6)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+6)
LDRH	R4, [R0, #0]
MOVS	R5, #0
MOVW	R0, #lo_addr(_deltaTemp+0)
MOVT	R0, #hi_addr(_deltaTemp+0)
LDRD	R2, R3, [R0, #0]
UMULL	R0, R1, R2, R4
MLA	R1, R3, R4, R1
MLA	R1, R2, R5, R1
STRD	R0, R1, [SP, #4]
VMOV.F32	S1, #8
VMOV.F32	S0, #2
BL	_pow+0
LDRD	R0, R1, [SP, #4]
VSTR	#1, S0, [SP, #4]
BL	__SignedLongLongToFloat+0
VMOV	S0, R0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S0, S1
VLDR	#1, S0, [SP, #12]
VADD.F32	S1, S0, S1
MOVW	R0, #lo_addr(ROV_sensitivity+0)
MOVT	R0, #hi_addr(ROV_sensitivity+0)
VSTR	#1, S1, [R0, #0]
;ROV.c,705 :: 		P =(((( q1 * sensitivity ) / pow( 2, 21 ) - sensorOffset) / pow( 2, 15 )) / 10);
LDR	R0, [SP, #20]
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S0, S0
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
VMOV.F32	S1, #21
VMOV.F32	S0, #2
BL	_pow+0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(ROV_sensorOffset+0)
MOVT	R0, #hi_addr(ROV_sensorOffset+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [SP, #4]
VMOV.F32	S1, #15
VMOV.F32	S0, #2
BL	_pow+0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S1, S0
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(ROV_P+0)
MOVT	R0, #hi_addr(ROV_P+0)
VSTR	#1, S0, [R0, #0]
;ROV.c,706 :: 		T = ( 2000 + ((long long)deltaTemp * sensorCoefficients[6] ) / pow( 2, 23))/100;
MOVW	R0, #lo_addr(ROV_sensorCoefficients+12)
MOVT	R0, #hi_addr(ROV_sensorCoefficients+12)
LDRH	R4, [R0, #0]
MOVS	R5, #0
LDR	R0, [SP, #16]
LDRD	R2, R3, [R0, #0]
UMULL	R0, R1, R2, R4
MLA	R1, R3, R4, R1
MLA	R1, R2, R5, R1
STRD	R0, R1, [SP, #4]
VMOV.F32	S1, #23
VMOV.F32	S0, #2
BL	_pow+0
LDRD	R0, R1, [SP, #4]
VSTR	#1, S0, [SP, #4]
BL	__SignedLongLongToFloat+0
VMOV	S0, R0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17658
VMOV	S0, R0
VADD.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(ROV_T+0)
MOVT	R0, #hi_addr(ROV_T+0)
VSTR	#1, S0, [R0, #0]
;ROV.c,709 :: 		}
L_end_MS5803_Read_Sensor:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _MS5803_Read_Sensor
_ADC:
;ROV.c,717 :: 		void ADC (){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV.c,718 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;ROV.c,719 :: 		ADC1_Init ();
BL	_ADC1_Init+0
;ROV.c,722 :: 		}
L_end_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ADC
_SPI_Ethernet_UserTCP:
;ROV.c,741 :: 		TEthPktFlags *flags) {
; Port start address is: 8 (R2)
SUB	SP, SP, #24
STR	LR, [SP, #0]
; Port end address is: 8 (R2)
; Port start address is: 8 (R2)
; flags start address is: 16 (R4)
LDR	R4, [SP, #24]
; flags end address is: 16 (R4)
;ROV.c,744 :: 		unsigned int    len = 0 ;
MOVW	R4, #0
STRH	R4, [SP, #8]
;ROV.c,749 :: 		if(Port != 80) {
CMP	R2, #80
IT	EQ
BEQ	L_SPI_Ethernet_UserTCP36
; Port end address is: 8 (R2)
;ROV.c,750 :: 		return(0) ;
MOVS	R0, #0
IT	AL
BAL	L_end_SPI_Ethernet_UserTCP
;ROV.c,751 :: 		}
L_SPI_Ethernet_UserTCP36:
;ROV.c,754 :: 		for(i = 0 ; i < 10 ; i++) {
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
UXTH	R1, R2
L_SPI_Ethernet_UserTCP37:
; i start address is: 4 (R1)
CMP	R1, #10
IT	CS
BCS	L_SPI_Ethernet_UserTCP38
;ROV.c,755 :: 		akcija[i] = SPI_Ethernet_getByte() ;
MOVW	R4, #lo_addr(_akcija+0)
MOVT	R4, #hi_addr(_akcija+0)
ADDS	R4, R4, R1
STR	R4, [SP, #20]
STRH	R1, [SP, #4]
BL	_SPI_Ethernet_getByte+0
LDRH	R1, [SP, #4]
LDR	R4, [SP, #20]
STRB	R0, [R4, #0]
;ROV.c,754 :: 		for(i = 0 ; i < 10 ; i++) {
ADDS	R4, R1, #1
; i end address is: 4 (R1)
; i start address is: 8 (R2)
UXTH	R2, R4
;ROV.c,756 :: 		}
UXTH	R1, R2
; i end address is: 8 (R2)
IT	AL
BAL	L_SPI_Ethernet_UserTCP37
L_SPI_Ethernet_UserTCP38:
;ROV.c,757 :: 		akcija[i] = 0 ;
; i start address is: 4 (R1)
MOVW	R4, #lo_addr(_akcija+0)
MOVT	R4, #hi_addr(_akcija+0)
ADDS	R5, R4, R1
; i end address is: 4 (R1)
MOVS	R4, #0
STRB	R4, [R5, #0]
;ROV.c,760 :: 		if(memcmp(akcija, httpMethod, 5)) {
MOVS	R2, #5
SXTH	R2, R2
MOVW	R1, #lo_addr(_httpMethod+0)
MOVT	R1, #hi_addr(_httpMethod+0)
MOVW	R0, #lo_addr(_akcija+0)
MOVT	R0, #hi_addr(_akcija+0)
BL	_memcmp+0
CMP	R0, #0
IT	EQ
BEQ	L_SPI_Ethernet_UserTCP40
;ROV.c,761 :: 		return(0) ;
MOVS	R0, #0
IT	AL
BAL	L_end_SPI_Ethernet_UserTCP
;ROV.c,762 :: 		}
L_SPI_Ethernet_UserTCP40:
;ROV.c,766 :: 		if(akcija[5] == 's') {
MOVW	R4, #lo_addr(_akcija+5)
MOVT	R4, #hi_addr(_akcija+5)
LDRB	R4, [R4, #0]
CMP	R4, #115
IT	NE
BNE	L_SPI_Ethernet_UserTCP41
;ROV.c,768 :: 		len = putConstString(httpHeader) ;
MOVW	R0, #lo_addr(_httpHeader+0)
MOVT	R0, #hi_addr(_httpHeader+0)
BL	_SPI_Ethernet_putConstString+0
STRH	R0, [SP, #8]
;ROV.c,769 :: 		len += putConstString(httpMimeTypeScript);
MOVW	R0, #lo_addr(_httpMimeTypeScript+0)
MOVT	R0, #hi_addr(_httpMimeTypeScript+0)
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,776 :: 		len += putConstString("var PORTE=") ;
MOVW	R4, #lo_addr(?lstr_3_ROV+0)
MOVT	R4, #hi_addr(?lstr_3_ROV+0)
MOV	R0, R4
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,777 :: 		WordToStr(GPIOE_ODR >> 8, dyna) ;
MOVW	R4, #lo_addr(GPIOE_ODR+0)
MOVT	R4, #hi_addr(GPIOE_ODR+0)
LDR	R4, [R4, #0]
LSRS	R4, R4, #8
MOVW	R1, #lo_addr(_dyna+0)
MOVT	R1, #hi_addr(_dyna+0)
UXTH	R0, R4
BL	_WordToStr+0
;ROV.c,778 :: 		len += putString(dyna) ;
MOVW	R0, #lo_addr(_dyna+0)
MOVT	R0, #hi_addr(_dyna+0)
BL	_SPI_Ethernet_putString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,779 :: 		len += putConstString(";") ;
MOVW	R4, #lo_addr(?lstr_4_ROV+0)
MOVT	R4, #hi_addr(?lstr_4_ROV+0)
MOV	R0, R4
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,782 :: 		IntToStr(dubina, dyna) ;
MOVW	R4, #lo_addr(_dubina+0)
MOVT	R4, #hi_addr(_dubina+0)
LDR	R4, [R4, #0]
MOVW	R1, #lo_addr(_dyna+0)
MOVT	R1, #hi_addr(_dyna+0)
SXTH	R0, R4
BL	_IntToStr+0
;ROV.c,783 :: 		len += putConstString("var dub=") ;
MOVW	R4, #lo_addr(?lstr_5_ROV+0)
MOVT	R4, #hi_addr(?lstr_5_ROV+0)
MOV	R0, R4
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,784 :: 		len += putString(dyna) ;
MOVW	R0, #lo_addr(_dyna+0)
MOVT	R0, #hi_addr(_dyna+0)
BL	_SPI_Ethernet_putString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,785 :: 		len += putConstString(";") ;
MOVW	R4, #lo_addr(?lstr_6_ROV+0)
MOVT	R4, #hi_addr(?lstr_6_ROV+0)
MOV	R0, R4
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,788 :: 		IntToStr( temperatura, dyna) ;
MOVW	R4, #lo_addr(_temperatura+0)
MOVT	R4, #hi_addr(_temperatura+0)
LDR	R4, [R4, #0]
MOVW	R1, #lo_addr(_dyna+0)
MOVT	R1, #hi_addr(_dyna+0)
SXTH	R0, R4
BL	_IntToStr+0
;ROV.c,789 :: 		len += putConstString("var TEMP= ") ;
MOVW	R4, #lo_addr(?lstr_7_ROV+0)
MOVT	R4, #hi_addr(?lstr_7_ROV+0)
MOV	R0, R4
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,790 :: 		len += putString(dyna) ;
MOVW	R0, #lo_addr(_dyna+0)
MOVT	R0, #hi_addr(_dyna+0)
BL	_SPI_Ethernet_putString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,791 :: 		len += putConstString(";") ;
MOVW	R4, #lo_addr(?lstr_8_ROV+0)
MOVT	R4, #hi_addr(?lstr_8_ROV+0)
MOV	R0, R4
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,792 :: 		}
IT	AL
BAL	L_SPI_Ethernet_UserTCP42
L_SPI_Ethernet_UserTCP41:
;ROV.c,794 :: 		else if(akcija[5] == 'b') {
MOVW	R4, #lo_addr(_akcija+5)
MOVT	R4, #hi_addr(_akcija+5)
LDRB	R4, [R4, #0]
CMP	R4, #98
IT	NE
BNE	L_SPI_Ethernet_UserTCP43
;ROV.c,795 :: 		unsigned long   bitMask = 0 ;
;ROV.c,797 :: 		if(isdigit(akcija[6])) {
MOVW	R4, #lo_addr(_akcija+6)
MOVT	R4, #hi_addr(_akcija+6)
LDRB	R4, [R4, #0]
UXTB	R0, R4
BL	_isdigit+0
CMP	R0, #0
IT	EQ
BEQ	L_SPI_Ethernet_UserTCP44
;ROV.c,798 :: 		bitMask = akcija[6] - '0' ;
MOVW	R4, #lo_addr(_akcija+6)
MOVT	R4, #hi_addr(_akcija+6)
LDRB	R4, [R4, #0]
SUBS	R4, #48
SXTH	R4, R4
STR	R4, [SP, #12]
;ROV.c,800 :: 		if (bitMask == 8) {
LDR	R4, [SP, #12]
CMP	R4, #8
IT	NE
BNE	L_SPI_Ethernet_UserTCP45
;ROV.c,801 :: 		len += putConstString(KAMERA) ;
MOVW	R4, #lo_addr(_KAMERA+0)
MOVT	R4, #hi_addr(_KAMERA+0)
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,803 :: 		}
L_SPI_Ethernet_UserTCP45:
;ROV.c,823 :: 		if (bitMask == 0) {
LDR	R4, [SP, #12]
CMP	R4, #0
IT	NE
BNE	L_SPI_Ethernet_UserTCP46
;ROV.c,825 :: 		Napred();
BL	_Napred+0
;ROV.c,830 :: 		}
L_SPI_Ethernet_UserTCP46:
;ROV.c,835 :: 		if (bitMask == 4) {
LDR	R4, [SP, #12]
CMP	R4, #4
IT	NE
BNE	L_SPI_Ethernet_UserTCP47
;ROV.c,837 :: 		Nazad();
BL	_Nazad+0
;ROV.c,841 :: 		}
L_SPI_Ethernet_UserTCP47:
;ROV.c,846 :: 		if (bitMask == 2) {
LDR	R4, [SP, #12]
CMP	R4, #2
IT	NE
BNE	L_SPI_Ethernet_UserTCP48
;ROV.c,848 :: 		Levo();
BL	_Levo+0
;ROV.c,852 :: 		}
L_SPI_Ethernet_UserTCP48:
;ROV.c,857 :: 		if (bitMask == 3) {
LDR	R4, [SP, #12]
CMP	R4, #3
IT	NE
BNE	L_SPI_Ethernet_UserTCP49
;ROV.c,859 :: 		Desno();
BL	_Desno+0
;ROV.c,863 :: 		}
L_SPI_Ethernet_UserTCP49:
;ROV.c,868 :: 		if (bitMask == 6) {
LDR	R4, [SP, #12]
CMP	R4, #6
IT	NE
BNE	L_SPI_Ethernet_UserTCP50
;ROV.c,870 :: 		Zaron();
BL	_Zaron+0
;ROV.c,874 :: 		}
L_SPI_Ethernet_UserTCP50:
;ROV.c,879 :: 		if (bitMask == 5) {
LDR	R4, [SP, #12]
CMP	R4, #5
IT	NE
BNE	L_SPI_Ethernet_UserTCP51
;ROV.c,881 :: 		Izron();
BL	_Izron+0
;ROV.c,885 :: 		}
L_SPI_Ethernet_UserTCP51:
;ROV.c,890 :: 		if (bitMask == 1) {
LDR	R4, [SP, #12]
CMP	R4, #1
IT	NE
BNE	L_SPI_Ethernet_UserTCP52
;ROV.c,892 :: 		Stop();
BL	_Stop+0
;ROV.c,896 :: 		}
L_SPI_Ethernet_UserTCP52:
;ROV.c,902 :: 		if (bitMask == 7) {
LDR	R4, [SP, #12]
CMP	R4, #7
IT	NE
BNE	L_SPI_Ethernet_UserTCP53
;ROV.c,904 :: 		Svetlo_ON();
BL	_Svetlo_ON+0
;ROV.c,908 :: 		}
L_SPI_Ethernet_UserTCP53:
;ROV.c,920 :: 		bitMask = 1 << (bitMask + 8);
LDR	R4, [SP, #12]
ADDW	R5, R4, #8
MOVS	R4, #1
SXTH	R4, R4
LSLS	R4, R5
SXTH	R4, R4
STR	R4, [SP, #12]
;ROV.c,921 :: 		GPIOE_ODR ^= bitMask ;
LDR	R5, [SP, #12]
MOVW	R4, #lo_addr(GPIOE_ODR+0)
MOVT	R4, #hi_addr(GPIOE_ODR+0)
LDR	R4, [R4, #0]
EOR	R5, R4, R5, LSL #0
MOVW	R4, #lo_addr(GPIOE_ODR+0)
MOVT	R4, #hi_addr(GPIOE_ODR+0)
STR	R5, [R4, #0]
;ROV.c,923 :: 		}
L_SPI_Ethernet_UserTCP44:
;ROV.c,924 :: 		}
L_SPI_Ethernet_UserTCP43:
L_SPI_Ethernet_UserTCP42:
;ROV.c,926 :: 		if(len == 0) {
LDRH	R4, [SP, #8]
CMP	R4, #0
IT	NE
BNE	L_SPI_Ethernet_UserTCP54
;ROV.c,927 :: 		len =  putConstString(httpHeader) ;
MOVW	R0, #lo_addr(_httpHeader+0)
MOVT	R0, #hi_addr(_httpHeader+0)
BL	_SPI_Ethernet_putConstString+0
STRH	R0, [SP, #8]
;ROV.c,928 :: 		len += putConstString(httpMimeTypeHTML);
MOVW	R0, #lo_addr(_httpMimeTypeHTML+0)
MOVT	R0, #hi_addr(_httpMimeTypeHTML+0)
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,929 :: 		len += putConstString(GlavnaStranica) ;
MOVW	R4, #lo_addr(_GlavnaStranica+0)
MOVT	R4, #hi_addr(_GlavnaStranica+0)
LDR	R4, [R4, #0]
MOV	R0, R4
BL	_SPI_Ethernet_putConstString+0
LDRH	R4, [SP, #8]
ADDS	R4, R4, R0
STRH	R4, [SP, #8]
;ROV.c,932 :: 		}
L_SPI_Ethernet_UserTCP54:
;ROV.c,934 :: 		return(len) ;
LDRH	R0, [SP, #8]
;ROV.c,935 :: 		}
L_end_SPI_Ethernet_UserTCP:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _SPI_Ethernet_UserTCP
_SPI_Ethernet_UserUDP:
;ROV.c,946 :: 		TEthPktFlags *flags) {
; flags start address is: 16 (R4)
LDR	R4, [SP, #0]
; flags end address is: 16 (R4)
;ROV.c,948 :: 		return 0;
MOVS	R0, #0
;ROV.c,951 :: 		}
L_end_SPI_Ethernet_UserUDP:
BX	LR
; end of _SPI_Ethernet_UserUDP
_main:
;ROV.c,972 :: 		void main(){
;ROV.c,985 :: 		init_LEVI();
BL	_init_LEVI+0
;ROV.c,986 :: 		PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,987 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main55:
SUBS	R7, R7, #1
BNE	L_main55
NOP
NOP
NOP
;ROV.c,995 :: 		init_DESNI();
BL	_init_DESNI+0
;ROV.c,996 :: 		PWM_TIM3_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM3_Set_Duty+0
;ROV.c,997 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main57:
SUBS	R7, R7, #1
BNE	L_main57
NOP
NOP
NOP
;ROV.c,1005 :: 		init_THRUSTER();
BL	_init_THRUSTER+0
;ROV.c,1006 :: 		PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM4_Set_Duty+0
;ROV.c,1007 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main59:
SUBS	R7, R7, #1
BNE	L_main59
NOP
NOP
NOP
;ROV.c,1013 :: 		init_SVETLO();
BL	_init_SVETLO+0
;ROV.c,1018 :: 		init_P2Click();
BL	_init_P2Click+0
;ROV.c,1025 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_LOW);
MOVW	R1, #255
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;ROV.c,1026 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;ROV.c,1027 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_HIGH);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;ROV.c,1032 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;ROV.c,1031 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #772
;ROV.c,1029 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER  | _SPI_8_BIT |
MOVS	R0, #1
;ROV.c,1032 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;ROV.c,1035 :: 		SPI_Ethernet_Init(MAC, IP, Spi_Ethernet_FULLDUPLEX) ;
MOVS	R2, #1
MOVW	R1, #lo_addr(_IP+0)
MOVT	R1, #hi_addr(_IP+0)
MOVW	R0, #lo_addr(_MAC+0)
MOVT	R0, #hi_addr(_MAC+0)
BL	_SPI_Ethernet_Init+0
;ROV.c,1040 :: 		ADC();
BL	_ADC+0
;ROV.c,1044 :: 		while(1) {
L_main61:
;ROV.c,1053 :: 		SPI_Ethernet_doPacket() ;
BL	_SPI_Ethernet_doPacket+0
;ROV.c,1056 :: 		}
IT	AL
BAL	L_main61
;ROV.c,1059 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
