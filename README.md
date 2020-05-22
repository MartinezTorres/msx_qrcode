# msx_qrcode

Sample program to generate QR codes for MSX.

The entire code for qr generation is in src/qr/qrcodegen.c. It is based on Nayuki's QR code:
[[https://github.com/nayuki/QR-Code-generator]]

However, the source has been modified to remove optional features and options.
It still supports generation of any valid QR code size, but it must be selected at compile time.

To change the selected QR options, you must alter the defines in:
src/qr/qrcodegen.h

The code used to display the QR code in the screen is based on my own library sdcc_msx. 
But the QR code generation does not depend on sdcc_msx.

As convenience, an asm version of the QR code is provided in asm/qrcodegen.asm. 
The provided version uses 5374 bytes of code, and 297 bytes of ram.
