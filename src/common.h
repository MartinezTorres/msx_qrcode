#pragma once

// If DEBUG is defined, the function debugBorder changes the border color, otherwise it does nothing.
#define DEBUG TRUE 

#include <msxhal.h>
#include <tms99X8.h>

#include <rand.h>

////////////////////////////////////////////////////////////////////////
// GRAPHICS
#include <graphics/graphics.h>


////////////////////////////////////////////////////////////////////////
// QR CODE GENERATOR
#include <qr/qrcodegen.h>

////////////////////////////////////////////////////////////////////////
// COMMON UTILITIES
extern uint8_t scratchpad[256];
