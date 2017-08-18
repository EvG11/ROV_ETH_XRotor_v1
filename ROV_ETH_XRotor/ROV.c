/*
                ---- MikroROV ---


  * autor Milos Petakovic
  *   TRECA VERZIJA PROGRAMA

  * Test konfiguracija:
                        * MCU: STM32F407VG
                        * Dev.Board: Clicker2 for STM32
                        * Oscillator: PLL_25_to_150 MHz

        Moduli:
                * 3x XROTOR-ESC

                * ETH click ( ENC 28J60)

                * Pressure 2 click

                * Senzor vode




                * Svetlo HALOGEN 50W

                        *( prekidac PWM + IRF 540 N 100V 33A LL N-MOSFET )



________________________________________________________________________________
________________________________________________________________________________


* SW: MikroC PRO for ARM v5.1.0




||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||




*Potreban kabl za vezu :

                         * Clicker & ETH Click   <----> PC

                            *4 ZICE  odnosno 2 upletene parice



*Ako se koristi i usb web camera:

                          * UTP CAT 5E kabl  8 zica odnosno 4 upletene parice

                          2-parice za vezu

                          2-parice za video prenos



////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////



               -  Program - ETH ROV Control -


 *Omogucava :
             *Upravljanje iz web pretrazivaca

                             - BlackBerry Browser

                             -  Mozilla Firefox   ver. 54.0.1(64-bit)

      *Komande se mogu zadavati putem:

                                 -  mobilnog telefona



                                 -  klikom PC misa













**************************************************************************
**************************************************************************
**************************************************************************/




#define TRUE 1
#define FALSE 0

#define MS5803_CMD_RESET      (0x1E)
#define MS5803_CMD_ADC_READ   (0x00)
#define MS5803_CMD_ADC_CONV   (0x40)
#define MS5803_CMD_ADC_D1     (0x00)
#define MS5803_CMD_ADC_D2     (0x10)
#define MS5803_CMD_ADC_256    (0x00)
#define MS5803_CMD_ADC_512    (0x02)
#define MS5803_CMD_ADC_1024   (0x04)
#define MS5803_CMD_ADC_2048   (0x06)
#define MS5803_CMD_ADC_4096   (0x08)
#define MS5803_CMD_PROM_RD    (0xA0)

#define MS5803_I2C_ADDRESS    (0x77)






  #define  INIT  0x993
  #define  NAPRED  2650

  #define  NAZAD  2310
  #define LEVO    2650

  #define DESNO   2310
  #define  ZARON  2650

  #define  IZRON  2310
  #define  STOP  0x995

  #define UKLJUCENO 2650
  #define ISKLJUCENO 0




#define Spi_Ethernet_FULLDUPLEX     0x01


//*****************************************************************************



//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//-------------------------- ETH konfiguracija ---------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------



sfr sbit SPI_Ethernet_Rst at GPIOE_ODR.B7;    //mikroBUS 1
sfr sbit SPI_Ethernet_CS  at GPIOE_ODR.B8;   //mikroBUS 1



typedef struct {
  unsigned canCloseTCP: 1;
  unsigned isBroadcast: 1;


} TEthPktFlags;


const unsigned char httpHeader[] = "HTTP/1.1 200 OK\nContent-type: ";//HTTP hd
const unsigned char httpMimeTypeHTML[] = "text/html\n\n";           // HTML MIME
const unsigned char httpMimeTypeScript[] = "text/plain\n\n";       //TXT MIME
unsigned char httpMethod[] = "GET /";





unsigned char   MAC [6] = {0x00, 0x14, 0xA5, 0x76, 0x19, 0x3f};   // MAC adresa

unsigned char   IP[4]  = {192, 168,  1,107 };           // IP adresa

unsigned char   gwIpAddr[4]  = {192, 168,  1,  1 };
unsigned char   ipMask[4]    = {255, 255, 255,  0 };




unsigned char   akcija [5];
unsigned char   dyna[30];


unsigned long   temperatura = 0;
unsigned long   dubina = 0;









//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------  KONTROLNA WEB STRANICA -----------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------


const code   char    *GlavnaStranica=
"<meta http-equiv=\"refresh\" content=\"6;url=http://192.168.1.107\">\
<html><head><title>PODMORNICA</title><style>\
#a{position:absolute;top:120; right:120;}\
#s{position:absolute;top:145;right:120;}\
#d{position:absolute;top:145;right:150;}\
#f{position:absolute;top:145;right:85;}\
#g{position:absolute;top:170;right:120;}\
#h{position:absolute;top:190;right:165;}\
#j{position:absolute;top:190;right:40;}\
#k{position:absolute;top:90;right:40;}\
#l{position:absolute;top:50;right:40;}\
</style></head><body bgcolor="" #b30000"">\
<h1><center>PODMORNICA KONTROLA</center></h1>\
<script src=/s></script>\
<button onclick=""window.location.href='/b0'"" id=""a"">&uarr;</button><br><br>\
<button onclick=""window.location.href='/b1'"" id=""s"">&Chi;</button><br><br>\
<button onclick=""window.location.href='/b2'"" id=""d"">&larr;</button><br><br>\
<button onclick=""window.location.href='/b3'"" id=""f"">&rarr;</button><br><br>\
<button onclick=""window.location.href='/b4'"" id=""g"">&darr;</button><br><br>\
<button onclick=""window.location.href='/b5'"" id=""h"">IZRON</button><br><br>\
<button onclick=""window.location.href='/b6'"" id=""j"">ZARON</button><br><br>\
DUBINA:<script>document.write(dub) </script>  cm<br><br>\
TEMPERATURA VODE: <script>document.write(TEMP) </script> &#8451;\
<button onclick=""window.location.href='/b8'"" id=""l"">&#128247;</button><br><br>\
<button onclick=""window.location.href='/b7'"" id=""k"">&#x1f4a1;</button><br><br>";


 const code   char    *KAMERA =
"<body>\
<video id=""v""></video><script>\
;(function(){function userMedia(){return navigator.getUserMedia = navigator.getUserMedia ||\
navigator.webkitGetUserMedia ||navigator.mozGetUserMedia ||navigator.msGetUserMedia || null;}\
if( userMedia() ){var constraints = {video: true,audio:false};\
var media = navigator.getUserMedia(constraints, function(stream){var v = document.getElementById('v');\
var url = window.URL || window.webkitURL;v.src = url ? url.createObjectURL(stream) : stream;v.play();}\
, function(error){console.log(""ERROR"");console.log(error);});} else {console.log(""KO"");}})();</script>\
</body> \
" ;





#define putConstString  SPI_Ethernet_putConstString




unsigned int pwm_period,Y,al;

unsigned int LEVI,DESNI,THRUSTER,SVETLO;

char stanje;

sbit Chip_Select at GPIOE_ODR.B11;

//----------Pressure 2 click
static unsigned int   sensorCoefficients[8];
static unsigned long  q1           = 0;
static unsigned long  q2           = 0;
long long             deltaTemp    = 0;
static float          P = 0, T = 0;
static float          sensorOffset = 0;
static float          sensitivity  = 0;
unsigned long value = 0;
unsigned long value_old = 0;
unsigned long temp;
char temperature_value_string[11];
char pressure_value_string[11];
int TK=23;
//-------------Pressure 2 click end------------






//******************************************************************************

//********************************FUNKCIJE**************************************

//******************************************************************************


  //3x PWM za MOTORE (Levi,Desni,Thruster)

  // ADC za senzore vode i voltmetar



  // Pressure 2 click






//******************************************************************************


//--------------------------------LEVI------------------------------------------


void init_LEVI()
{
     pwm_period = PWM_TIM4_Init(50);


     PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);

}

//--------------------------------DESNI-----------------------------------------


void init_DESNI()
{
     pwm_period = PWM_TIM3_Init(50);


     PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PB0);

}

//--------------------------------THRUSTER--------------------------------------


void init_THRUSTER()
{
     pwm_period = PWM_TIM4_Init(50);


     PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);

}

//-----------------------------------SVETLO-------------------------------------

void init_SVETLO()
{
     pwm_period = PWM_TIM9_Init(50);


     PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);

}



//-----------------------------------P2Click------------------------------------


 void init_P2Click(){

  GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_11);

  SPI2_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER | _SPI_8_BIT |
                          _SPI_CLK_IDLE_LOW | _SPI_SECOND_CLK_EDGE_TRANSITION |
                _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI2_PB13_14_15);

}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//------------------------------K R E T A NJ E----------------------------------
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~funkcije~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


void Napred(){




       LEVI=NAPRED;

       DESNI=NAPRED;

       THRUSTER=STOP;




       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);


  }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Nazad(){

       LEVI=NAZAD;

       DESNI=NAZAD;

       THRUSTER=STOP;


       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);



  }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Levo(){

       LEVI=LEVO;

       DESNI=DESNO;

       THRUSTER=STOP;



       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);



   }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Desno(){

       LEVI=DESNO;

       DESNI=LEVO;

       THRUSTER=STOP;


       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);



   }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Zaron(){

       LEVI=STOP;

       DESNI=STOP;

       THRUSTER=ZARON;



       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);



  }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


void Izron(){

       LEVI=STOP;

       DESNI=STOP;

       THRUSTER=IZRON;



       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);



  }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Stop(){

       LEVI=STOP;

       DESNI=STOP;

       THRUSTER=STOP;


       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);



   }


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


void Svetlo_ON() {

    SVETLO = UKLJUCENO;




       PWM_TIM9_Set_Duty(SVETLO,_PWM_NON_INVERTED, _PWM_CHANNEL1);

   }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Svetlo_OFF(){

     SVETLO = ISKLJUCENO;

   }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





////////////////////////////////////////////////////////////////////////////////
////////////////////////// Pressure 2 click   start  ///////////////////////////
////////////////////////////////////////////////////////////////////////////////




void MSS5803_Reset(){
  Chip_Select = 0;
  SPI2_Write(MS5803_CMD_RESET);
  Delay_ms(5);
  Chip_Select = 1;

}


unsigned Read_MSS5803_ReadCoefficient(char index){
  unsigned int result = 0;
  Chip_Select = 0;
  SPI2_Read(MS5803_CMD_PROM_RD + (index*2));
  result=SPI2_read(0x00);
  result=result << 8;
  result |= SPI2_Read(0x00);
  Chip_Select = 1;

  return result;
}




char MS5803_CRC4(unsigned int n_prom[]){
  int cnt;
  unsigned int n_rem;
  unsigned int crc_read;
  unsigned char  n_bit;

  n_rem = 0x00;
  crc_read = sensorCoefficients[7];
  sensorCoefficients[7] = ( 0xFF00 & ( sensorCoefficients[7] ) );
  for (cnt = 0; cnt < 16; cnt++) {

  if ( cnt%2 == 1 ) n_rem ^= (unsigned short) ( ( sensorCoefficients[cnt>>1] ) & 0x00FF );

   else n_rem ^= (unsigned short) ( sensorCoefficients[cnt>>1] >> 8 );
   for ( n_bit = 8; n_bit > 0; n_bit-- ) {
     if ( n_rem & ( 0x8000 ) ) {
        n_rem = ( n_rem << 1 ) ^ 0x3000;
      }
     else {
        n_rem = ( n_rem << 1 );
      }
    }
  }

  n_rem = ( 0x000F & ( n_rem >> 12 ) );
  sensorCoefficients[7] = crc_read;

  return ( n_rem ^ 0x00 );

}



unsigned long MS5803_Cmd_Adc(char cmd){
  unsigned long result = 0;
  unsigned long returnedData = 0;

  Chip_Select=0;
  SPI2_Write(MS5803_CMD_ADC_CONV + cmd);
  switch (cmd & 0x0f) {
    case MS5803_CMD_ADC_256 : Delay_us(900); break;
    case MS5803_CMD_ADC_512 : Delay_ms(3);   break;
    case MS5803_CMD_ADC_1024: Delay_ms(4);   break;
    case MS5803_CMD_ADC_2048: Delay_ms(8);   break;
    case MS5803_CMD_ADC_4096: Delay_ms(14);  break;

  }
  Chip_Select = 1;
  Delay_ms(3);
  Chip_Select = 0;
  SPI2_Read(MS5803_CMD_ADC_READ);
  returnedData = SPI2_Read(0x00);
  result = (returnedData << 16);
  returnedData = SPI2_Read(0x00);
  result = result + (returnedData << 8);
  returnedData = SPI2_Read(0x00);
  result = result + returnedData;
  Chip_Select = 1;

  return result;
}



char MS5803_Init() {
  unsigned char p_crc, n_crc;
  int i = 0;
  MSS5803_Reset();
  for ( i = 0; i < 8; i++ ){
    sensorCoefficients[ i ] = Read_MSS5803_ReadCoefficient( i );
  }
  p_crc = sensorCoefficients[ 7 ];
  n_crc = MS5803_CRC4( sensorCoefficients );


  asm nop



  if(p_crc!=n_crc){
    return FALSE;
  }

  else{

    return TRUE;
  }
}



void MS5803_Read_Sensor() {
  q1 = MS5803_Cmd_Adc(MS5803_CMD_ADC_D1 + MS5803_CMD_ADC_4096);
  q2 = MS5803_Cmd_Adc(MS5803_CMD_ADC_D2 + MS5803_CMD_ADC_4096);


  asm nop


  deltaTemp = q2 - sensorCoefficients[5] * pow( 2, 8 );
  sensorOffset = sensorCoefficients[2] * pow( 2, 16 ) + ( (long long)deltaTemp * sensorCoefficients[4] ) / pow( 2, 7 );
  sensitivity = sensorCoefficients[1] * pow( 2, 15 ) + ( (long long)deltaTemp * sensorCoefficients[3] ) / pow( 2, 8 );


P =(((( q1 * sensitivity ) / pow( 2, 21 ) - sensorOffset) / pow( 2, 15 )) / 10);
T = ( 2000 + ((long long)deltaTemp * sensorCoefficients[6] ) / pow( 2, 23))/100;


}


////////////////////////////////////////////////////////////////////////////////
////////////////////////// Pressure 2 click   end //////////////////////////////
////////////////////////////////////////////////////////////////////////////////


void ADC (){
    ADC_Set_Input_Channel(_ADC_CHANNEL_3);
    ADC1_Init ();


}





//==============================================================================
//==================      POCETAK ISPITIVANJA USLOVA     =======================
//==============================================================================




#define putString  SPI_Ethernet_putString

unsigned int  SPI_Ethernet_UserTCP(unsigned char *remoteHost,
                                   unsigned int remotePort,
                                   unsigned int Port,
                                   unsigned int reqLength,
                                   TEthPktFlags *flags) {


  unsigned int    len = 0 ;
  unsigned int    i ;



  if(Port != 80) {
    return(0) ;
  }


  for(i = 0 ; i < 10 ; i++) {
    akcija[i] = SPI_Ethernet_getByte() ;
  }
  akcija[i] = 0 ;
  i = 0;

  if(memcmp(akcija, httpMethod, 5)) {
    return(0) ;
  }



  if(akcija[5] == 's') {

    len = putConstString(httpHeader) ;
    len += putConstString(httpMimeTypeScript);





    // PORTE
    len += putConstString("var PORTE=") ;
    WordToStr(GPIOE_ODR >> 8, dyna) ;
    len += putString(dyna) ;
    len += putConstString(";") ;


    IntToStr(dubina, dyna) ;
    len += putConstString("var dub=") ;
    len += putString(dyna) ;
    len += putConstString(";") ;


    IntToStr( temperatura, dyna) ;
    len += putConstString("var TEMP= ") ;
    len += putString(dyna) ;
    len += putConstString(";") ;
  }

  else if(akcija[5] == 'b') {
    unsigned long   bitMask = 0 ;

    if(isdigit(akcija[6])) {
      bitMask = akcija[6] - '0' ;

      if (bitMask == 8) {
          len += putConstString(KAMERA) ;

          }






//==============================================================================
//==================      POCETAK ISPITIVANJA USLOVA     =======================
//==============================================================================








//============================ N A P R E D =====================================

         if (bitMask == 0) {

              Napred();




                         }


//============================ N A Z A D  ======================================

        if (bitMask == 4) {

              Nazad();



          }


//============================ L E V O =========================================

          if (bitMask == 2) {

               Levo();



          }


//============================ D E S N O =======================================

          if (bitMask == 3) {

               Desno();



          }


//============================ Z A R O N =======================================

          if (bitMask == 6) {

               Zaron();



          }


//============================ I Z R O N =======================================

         if (bitMask == 5) {

              Izron();



          }


//============================  STOPIRA MOTORE  ================================

          if (bitMask == 1) {

               Stop();



          }


//==============================================================================

           //ukljuceno svetlo
          if (bitMask == 7) {

               Svetlo_ON();



          }






//==================  D U B I N A    &   T E M P E R A T U R A  ================




      bitMask = 1 << (bitMask + 8);
      GPIOE_ODR ^= bitMask ;

    }
  }

  if(len == 0) {
    len =  putConstString(httpHeader) ;
    len += putConstString(httpMimeTypeHTML);
    len += putConstString(GlavnaStranica) ;


  }

  return(len) ;
}






unsigned int  SPI_Ethernet_UserUDP(unsigned char *remoteHost,
                                   unsigned int remotePort,
                                   unsigned int destPort,
                                   unsigned int reqLength,
                                    TEthPktFlags *flags) {

   return 0;


}

//==============================================================================
//=========================== KRAJ ISPITIVANJA USLOVA ==========================
//==============================================================================





//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//******************** G L A V N I   P R O G R A M *****************************
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>




void main(){






//------------------------------------------------------------------------------
//----------------------- init FUNKCIJA i ESC modula ---------------------------
//------------------------------------------------------------------------------



init_LEVI();
PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL4);
                    Delay_ms(2000);


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




init_DESNI();
PWM_TIM3_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
                   Delay_ms(2000);



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



init_THRUSTER();
PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
                    Delay_ms(2000);



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

init_SVETLO();


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  init_P2Click();

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




  GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_LOW);
  GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);
  GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_HIGH);

SPI3_Init_Advanced(_SPI_FPCLK_DIV4, _SPI_MASTER  | _SPI_8_BIT |
                     _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
                     &_GPIO_MODULE_SPI3_PC10_11_12);


SPI_Ethernet_Init(MAC, IP, Spi_Ethernet_FULLDUPLEX) ;




ADC();



  while(1) {








    SPI_Ethernet_doPacket() ;


}


  }



////////////////////////////////////////////////////////////////////////////////
//
//                           - K R A J -
//
////////////////////////////////////////////////////////////////////////////////