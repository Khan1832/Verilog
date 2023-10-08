vlog tb_bd.v
vsim tb +testcase=  //testcase name
add wave -position insertpoint sim:/tb/dut/*
#do wave.do
run -all

