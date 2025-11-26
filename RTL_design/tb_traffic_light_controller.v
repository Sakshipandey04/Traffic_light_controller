module tb_traffic_light_controller;

    reg clk;
    reg rst;

    wire ns_red, ns_yellow, ns_green;
    wire ew_red, ew_yellow, ew_green;

    traffic_light_controller #(
        .CLOCK_FREQ_HZ(10),
        .GREEN_TIME_S(1),
        .YELLOW_TIME_S(1)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .ns_red(ns_red),
        .ns_yellow(ns_yellow),
        .ns_green(ns_green),
        .ew_red(ew_red),
        .ew_yellow(ew_yellow),
        .ew_green(ew_green)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #50;
        rst = 0;
        #2000;
        $stop;
    end

endmodule