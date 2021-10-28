transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {TopLevel.vho}

vcom -93 -work work {/home/kalp/EE214_Lab/8-Bit_Adder/Testbench.vhdl}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /dut_instance=TopLevel_vhd.sdo -L maxv -L gate_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
