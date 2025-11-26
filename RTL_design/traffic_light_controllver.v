
//module name: traffic_light_controller

module traffic_light_controller #(
    parameter CLOCK_FREQ_HZ = 100000000,   // 100  MHz clock
    parameter GREEN_TIME_S  = 10,         // Green duration in seconds
    parameter YELLOW_TIME_S = 3           // Yellow duration in seconds
)
(
    input  wire clk,
    input  wire rst,
//ns output
    output reg ns_red,
    output reg ns_yellow,
    output reg ns_green,
//ew output
    output reg ew_red,
    output reg ew_yellow,
    output reg ew_green
);

   
    parameter S_NS_GREEN  = 2'b00;
    parameter S_NS_YELLOW = 2'b01;
    parameter S_EW_GREEN  = 2'b10;
    parameter S_EW_YELLOW = 2'b11;

    reg [1:0] state;

  
    reg [31:0] counter;

    localparam NS_GREEN_MAX  = CLOCK_FREQ_HZ * GREEN_TIME_S;
    localparam NS_YELLOW_MAX = CLOCK_FREQ_HZ * YELLOW_TIME_S;
    localparam EW_GREEN_MAX  = CLOCK_FREQ_HZ * GREEN_TIME_S;
    localparam EW_YELLOW_MAX = CLOCK_FREQ_HZ * YELLOW_TIME_S;

    // State control
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state   <= S_NS_GREEN;
            counter <= 0;
        end else begin
            case (state)

                S_NS_GREEN: begin
                    if (counter >= NS_GREEN_MAX - 1) begin
                        state   <= S_NS_YELLOW;
                        counter <= 0;
                    end else
                        counter <= counter + 1;
                end

                S_NS_YELLOW: begin
                    if (counter >= NS_YELLOW_MAX - 1) begin
                        state   <= S_EW_GREEN;
                        counter <= 0;
                    end else
                        counter <= counter + 1;
                end

                S_EW_GREEN: begin
                    if (counter >= EW_GREEN_MAX - 1) begin
                        state   <= S_EW_YELLOW;
                        counter <= 0;
                    end else
                        counter <= counter + 1;
                end

                S_EW_YELLOW: begin
                    if (counter >= EW_YELLOW_MAX - 1) begin
                        state   <= S_NS_GREEN;
                        counter <= 0;
                    end else
                        counter <= counter + 1;
                end

                default: begin
                    state <= S_NS_GREEN;
                    counter <= 0;
                end

            endcase
        end
    end

    // output logic 
    always @(*) begin
        // by default OFF
        ns_red    = 0;
        ns_yellow = 0;
        ns_green  = 0;
        ew_red    = 0;
        ew_yellow = 0;
        ew_green  = 0;

        case(state)
            S_NS_GREEN: begin
                ns_green = 1;
                ew_red   = 1;
            end

            S_NS_YELLOW: begin
                ns_yellow = 1;
                ew_red    = 1;
            end

            S_EW_GREEN: begin
                ew_green = 1;
                ns_red   = 1;
            end

            S_EW_YELLOW: begin
                ew_yellow = 1;
                ns_red    = 1;
            end
        endcase
    end

endmodule
