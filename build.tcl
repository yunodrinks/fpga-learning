# 非工程模式构建脚本：综合 -> 优化 -> 布局 -> 布线 -> 生成 bitstream
# 用法：vivado -mode batch -source build.tcl

set origin_dir [file normalize [file dirname [info script]]]
set build_dir  "D:/fpga/dec3_8_build"
file mkdir $build_dir
cd $build_dir

read_verilog $origin_dir/dec3_8.v
read_verilog $origin_dir/top.v
read_xdc     $origin_dir/top.xdc

synth_design -top top -part xc7a35tfgg484-2
opt_design
place_design
route_design

report_utilization     -file $build_dir/util.rpt
report_timing_summary  -file $build_dir/timing.rpt
write_bitstream -force $build_dir/top.bit

puts "BUILD_OK: $build_dir/top.bit"
