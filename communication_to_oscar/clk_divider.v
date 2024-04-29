`timescale 1ns / 1ps



module clk_divider(
    input clk,    // Input clock at 100 MHz
    output reg new_clk = 0  // Output clock at 1 MHz
);

// Define a counter variable
reg [14:0] counter =0;

always @(posedge clk) begin

        // Increment counter
        counter <= counter + 1;
        if (counter == 10000) begin
            // Toggle the clock and reset counter
            new_clk <= ~new_clk;
            counter <= 0;
        end
end

endmodule
