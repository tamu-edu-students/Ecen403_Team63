`timescale 1ns / 1ps


module spi_thing(
    input clk_SPI,              // System clock
    input mosi,             // Master Out Slave In data line
    output reg miso,        // Master In Slave Out data line
    input cs,               // Chip Select, active low
     output reg [15:0] data_store  
 //   output reg [15:0] received_data
);
reg [3:0] bit_count =0;  // Counter to keep track of bits received, now counts up to 15
reg [15:0] received_data = 0;
always @(posedge clk_SPI ) begin
    if (cs) begin
        // When chip select is active
        if (bit_count == 15) begin
            // If 16 bits have been received
            data_store <= {received_data[15:0], mosi}; // Include the last bit in the data_store
            bit_count <= 0; // Reset the bit counter
            miso <= mosi; // Echo the last bit received
        end else begin
            received_data <= {received_data[15:0], mosi}; // Shift the incoming bit into the register
            bit_count <= bit_count + 1; // Increment the bit counter
            miso <= mosi; // Echo the incoming bit
        end
    end else begin
        // Reset bit count when chip select is not active
        bit_count <= 0;
        received_data <= 0; // Also reset the received_data register
    end
end

endmodule