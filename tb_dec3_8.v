// tb_dec3_8.v  ---  自检测 testbench
// 8 个正常输入 + 1 个 X 注入（逼出 default 分支）= 9 项检查
// 目标输出：pass=9 fail=0 ALL PASS

`timescale 1ns/1ps

module tb_dec3_8;

    reg  [2:0] in;
    wire [7:0] out;

    integer i;
    integer pass;
    integer fail;

    // 例化被测模块
    dec3_8 dut (
        .in  (in),
        .out (out)
    );

    initial begin
        pass = 0;
        fail = 0;

        // ---- 1~8 项：穷举 8 个正常输入 ----
        for (i = 0; i < 8; i = i + 1) begin
            in = i[2:0];
            #1;
            if (out === (8'b1 << i[2:0])) begin
                pass = pass + 1;
                $display("PASS  in=%b  out=%b", in, out);
            end else begin
                fail = fail + 1;
                $display("FAIL  in=%b  out=%b  exp=%b", in, out, (8'b1 << i[2:0]));
            end
        end

        // ---- 第 9 项：强行喂 X，验证 default 分支 ----
        in = 3'bxxx;
        #1;
        if (out === 8'b0000_0000) begin
            pass = pass + 1;
            $display("PASS  default branch  out=%b", out);
        end else begin
            fail = fail + 1;
            $display("FAIL  default branch  out=%b  exp=00000000", out);
        end

        $display("pass=%0d fail=%0d", pass, fail);
        if (fail == 0 && pass == 9) $display("ALL PASS");
        $finish;
    end

endmodule
