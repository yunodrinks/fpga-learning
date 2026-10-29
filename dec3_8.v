// dec3_8.v  ---  3-8 译码器（练习骨架）
//
// 规则：in 是几，out 的第几位就是 1（独热码）
//   in = 3'b000  ->  out[0] = 1
//   in = 3'b001  ->  out[1] = 1
//   ...
//   in = 3'b111  ->  out[7] = 1
//
// 你现在要做的事：把下面 8 个分支自己补全
// 写完运行： iverilog -o sim dec3_8.v tb_dec3_8.v
//            vvp sim
// 目标：pass=9 fail=0 ALL PASS

module dec3_8 (
    input  wire [2:0] in,
    output reg  [7:0] out
);

    always @(*) begin
        case (in)
            3'b000: out = 8'b0000_0001;
            3'b001: out = 8'b0000_0010;
            3'b010: out = 8'b0000_0100;
            3'b011: out = 8'b0000_1000;
            3'b100: out = 8'b0001_0000;
            3'b101: out = 8'b0010_0000;
            3'b110: out = 8'b0100_0000;
            3'b111: out = 8'b1000_0000;
            default: out = 8'b0000_0000;
        endcase
    end

endmodule
