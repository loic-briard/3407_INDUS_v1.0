#include "TCPIP Stack/TCPIP.h"
#include "HardwareProfile.h"    // si utilisé dans ton projet
#include "02_Constantes.h"
#include "03_Variables.h"
void Delay_10_microS(void);

// Déplace ici tout le contenu de ton InitializeBoard() d?origine.
// J?ai juste enlevé le mot-clé static pour l?exposer.
void InitializeBoard(void)
{
    // === Colle ici l?implémentation originale ===
    // (ADC config, UART config, U1BRG=25, SPI CS, XEEInit/SPIFlashInit, etc.)
    // Ton code original n?a pas besoin de changer.
}
#ifndef FCY
  // Fosc = 32 MHz -> Fcy = 16 MHz (exemple courant avec PRIPLL sur quartz 8 MHz x4)
  #define FCY 16000000UL
#endif
#include <libpic30.h>   // pour __delay32()

void Delay_10_microS(void)
{
    // 10 µs * FCY cycles/s = FCY * 10e-6 cycles
    __delay32((FCY / 100000) ); // = FCY * 10e-6
}
