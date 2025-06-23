module Project_01 (

// O projeto é um blink de LED

    input CLOCK_50,
    output [7:0] LEDR
);

reg [25:0] counter = 0;
reg [7:0] led_state = 8'b00000001;

always @(posedge CLOCK_50) begin
    counter <= counter + 1;
    if (counter >= 26'd25_000_000) begin
        counter <= 0;
        led_state <= {led_state[6:0], led_state[7]};
    end
end

assign LEDR = led_state;

endmodule
