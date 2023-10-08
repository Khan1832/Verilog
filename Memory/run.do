vlog tb_bd.v
vsim tb +testcase=bd_wr_fd_rd
add wave -position insertpoint sim:/tb/dut/*
#do wave.do
run -all

