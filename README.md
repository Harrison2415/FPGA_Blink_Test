# 🔦 Project: LED Blinker with DE2-115 (FPGA)

This project implements a simple binary counter using the **Terasic DE2-115** board equipped with an **Altera Cyclone IV (EP4CE115F29C7)** FPGA.  
The goal is to blink the red LEDs on the board (`LEDR[7:0]`) based on a 50 MHz internal clock, creating a Scanner effect.

## 🧠 How It Works

The Verilog code uses a 26-bit counter that increments on every pulse of the 50 MHz clock.  
The most significant bits of the counter are connected to the LEDs, causing them to blink in sequence — producing a **visual cascade effect**.
