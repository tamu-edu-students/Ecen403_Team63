module to_oscar(
    output reg we,
    output reg reset,
    output reg ldac,
    input new_clk,
    output reg [15:0] to_daq,
    //input  activate,
    input [15:0] data_store,
    input cs
    );
    reg [15:0] ram[65534:0];
    integer count = 0;
    integer addr = 100;
    integer i = 0;
    initial begin
    we <=0;
    reset <=0;
    ldac <=0;
    count <=0;
//    ram[0] = 16'h0001; // Initialize address 0 with hex value 0001
//    ram[1] = 16'h5555; // Initialize address 1 with hex value 0002
//    ram[2] = 16'hAAAA; // Initialize address 2 with hex value 0003
//    ram[3] = 16'hCCCC; // Initialize address 3 with hex value 0004
//    ram[4] = 16'hFFFF; // Initialize address 4 with hex value 0005

//sin
    for (i = 0; i < addr; i = i + 1) begin
        ram[i] = 16'h8000 + $rtoi($sin(2 * 3.14159 * i / addr) * 32767);
    end
// triangle wave 
//    // Generate the upward slope
//    for (i = 0; i < addr/2; i = i + 1) begin
//        ram[i] = (16'hFFFF / (addr/2)) * i;
//    end
//    // Generate the downward slope
//    for (i = addr/2; i < addr; i = i + 1) begin
//        ram[i] = 16'hFFFF - (16'hFFFF / (addr/2)) * (i - addr/2);
//    end
    // The rest of the ram will be initialized to 0 by default
    // sawtooth
//        for (i = 0; i < addr; i = i + 1) begin
//        ram[i] = (16'hFFFF / addr) * i;
//    end
//    for (i=0; i<addr/2; i=i+1) begin
//       ram[i] = 16'h8000;
//    end
//    for (i=addr/2; i<addr; i=i+1) begin
//       ram[i] = 16'hAAAA;
//    end
        
end
    
always @ (posedge new_clk) begin

        we <=0;
        reset <=1;
        ldac <=1;
        to_daq <= ram[count];
        if(count < addr) begin
            count <= count +1;
        end 
        else if(count == addr) begin
            count <=1;  
        end
end
    
    
    
    
endmodule