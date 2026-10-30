module top(
    input  wire [3:0] key,     // 4个按键 (按下=0, 释放=1)
    output wire [3:0] led      // 4颗LED
);
    wire [7:0] dec_out;
    wire [2:0] in;

    // 按键按下为低电平，取反后送入dec3_8
    assign in = ~key[2:0];

    dec3_8 u_dec (.in(in), .out(dec_out));

    // key[3]做翻页: 0=显示低4位, 1=显示高4位
    assign led = key[3] ? dec_out[7:4] : dec_out[3:0];
endmodule
