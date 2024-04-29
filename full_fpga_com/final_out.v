`timescale 1ns / 1ps


module final_out(
    output reg we,
    output reg reset,
    output reg ldac,
    input new_clk,
    input clk,
    output reg [15:0] to_daq,
    input  activate,
    input [15:0] data_store,
    input cs
    );
    
    reg [15:0] ram[65534:0];
    integer count = 0;
    integer addr = 0;
    integer count_store =0;
    initial begin
    we <=0;
    reset <=0;
    ldac <=0;
    count <=0;
    count_store <=0;
    ram[0] = 16'h0000; // Initialize address 0 with hex value 0001
    ram[1] = 16'h5555; // Initialize address 1 with hex value 0002
    ram[2] = 16'hAAAA; // Initialize address 2 with hex value 0003
    //ram[3] = 16'hCCCC; // Initialize address 3 with hex value 0004
    //ram[4] = 16'hFFFF; // Initialize address 4 with hex value 0005
    // The rest of the ram will be initialized to 0 by default
end
    
    always @(posedge clk) begin
    
 //   if (cs == 1)begin
    if(count_store >16) begin
        ram[addr] <= data_store;
        addr <=addr +1; 
        count_store <= 0 ;
       end
          count_store <= count_store +1;
//        end


end
always @ (posedge new_clk) begin

        we <=0;
        reset <=1;
        ldac <=1;
        if(count < addr) begin
            to_daq <= ram[count];
            count <= count +1;
        end 
        else if(count == addr) begin
            to_daq <= ram[count];
            count <=0;  
        end

end
    
    
    
    
endmodule
