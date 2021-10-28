transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/kalp/EE214_Lab/Multiplier/DUT.vhdl}
vcom -93 -work work {/home/kalp/EE214_Lab/Multiplier/gates.vhdl}
vcom -93 -work work {/home/kalp/EE214_Lab/Multiplier/Multiplier.vhdl}

vcom -93 -work work {/home/kalp/EE214_Lab/Multiplier/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
