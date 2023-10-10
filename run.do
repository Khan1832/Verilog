vlog tb.v
vsim tb +seed=123456789
add wave -position insertpoint sim:/tb/dut/*
run -all
