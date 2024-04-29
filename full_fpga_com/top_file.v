`timescale 1ns / 1ps


module top_file(
    input clk,
    output we,
    output reset,
    output ldac,
    output [15:0] to_daq,
   // input activate,
    input mosi,
    output miso,
    input cs,
    input clk_SPI


    );
    final_out fo(
    .we(we),
    .reset(reset),
    .ldac(ldac),
    .to_daq(to_daq),
    .new_clk(new_clk),
    .clk(clk_SPI), //switch to slck
    //.activate(activate),
    .data_store(data_store)
    
    );
    clk_divider clkd(
    .clk(clk),
    .new_clk(new_clk)
    );
    
    spi_thing spit(
    .clk_SPI(clk_SPI),              // System clock
    .mosi(mosi),             // Master Out Slave In data line
    .miso(miso),        // Master In Slave Out data line
    .cs(cs),               // Chip Select, active low
    .data_store(data_store) 
    );
    
    
endmodule
