module Blinky (
    input clk100,
    output LD5_R,
    output LD5_G,
    output LD5_B,
    output LD6_R,
    output LD6_G,
    output LD6_B,
    output LD7_R,
    output LD7_G,
    output LD7_B,
    output LD8_R,
    output LD8_G,
    output LD8_B,
);

    reg [11:0] leds = 12'b111111111110;
    assign LD5_R = leds[0];
    assign LD5_G = leds[1];
    assign LD5_B = leds[2];
    assign LD6_R = leds[3];
    assign LD6_G = leds[4];
    assign LD6_B = leds[5];
    assign LD7_R = leds[6];
    assign LD7_G = leds[7];
    assign LD7_B = leds[8];
    assign LD8_R = leds[9];
    assign LD8_G = leds[10];
    assign LD8_B = leds[11];

    reg [26:0] counter = 0;
    reg [26:0] second = 27'd50000000; // Blinks twice per second
    
    always @(posedge clk100) begin
        counter <= counter + 1;
        if(counter == second) begin
            leds <= { leds [10:0], leds[11] };
            counter <= 0;
        end
    end
endmodule


