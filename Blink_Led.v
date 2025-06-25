module Project_01 (
    // Module inputs and outputs
    input CLOCK_50,         // 50 MHz clock input
    output [7:0] LEDR       // Output for 8 LEDs
);

// Internal registers
reg [25:0] counter = 0;     // 26-bit counter to create a delay
reg [7:0] led_state = 8'b00000001; // Current state of the LEDs (only LED0 starts ON)

// Always block triggered on the rising edge of the clock
always @(posedge CLOCK_50) begin
    counter <= counter + 1; // Increment the counter every clock cycle

    // When the counter reaches 25 million (approx. 0.5 seconds with 50 MHz clock)
    if (counter >= 26'd25_000_000) begin
        counter <= 0; // Reset the counter

        // Rotate the LED state to the left
        // The lit LED "moves" to the next LED
        led_state <= {led_state[6:0], led_state[7]};
    end
end

// Assign the LED state to the output
assign