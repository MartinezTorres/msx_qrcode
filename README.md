# msx_qrcode

Sample program to generate QR codes for MSX.

The entire code for qr generation is in `src/qr/qrcodegen.c`. It is based on Nayuki's QR code:

https://github.com/nayuki/QR-Code-generator

However, the source has been modified to remove optional features and options.
It still supports generation of any valid QR code size, but it must be selected at compile time.

To change the selected QR options, you must alter the defines in `src/qr/qrcodegen.h`.

The code used to display the QR code in the screen is based on my own library sdcc_msx. 
But the QR code generation does not depend on sdcc_msx.

As convenience, an asm version of the QR code is provided in asm/qrcodegen.asm. 
The provided version uses 5416 bytes of code, and 297 bytes of ram.

An example of use is in:
`src/qr_example.c`, which generates the code in:
`src/qr_example.asm`

The easiest way to use the provided code in assembler is to use the following two calls:

**_qrcodegen** | _
---------|---------------
Function | Generates a QR code that contains the string that starts at address (HL)
Input    | The address of the string to be encoded in (HL). It must be zero terminated.
Output   | None, the QR code is stored in internal memory.

**_qr**  | _
---------|---------------
Function | Reads the pixel value of the last calculated QR code
Input    | H and L contain the x and y coordinate of the QR code, goes from 0 to QSIZE+2, as it adds a 1 pixel white border.
Output   | L is zero if the QR code for the required pixel is black, and non zero is it is white.


Both functions may modify all registers.

##### Information Capacity:

https://www.qrcode.com/en/about/version.html

