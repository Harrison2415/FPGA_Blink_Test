module led_blink (
    input CLOCK_50,          // Clock de 50 MHz
    output [7:0] LEDR        // LEDs vermelhos
);

reg [25:0] counter = 0;
reg [7:0] led_state = 8'b00000001;

always @(posedge CLOCK_50) begin
    counter <= counter + 1;

    if (counter >= 26'd25_000_000) begin
        counter <= 0;
        led_state <= {led_state[6:0], led_state[7]}; // rotaciona bits
    end
end

assign LEDR = led_state;

endmodule
