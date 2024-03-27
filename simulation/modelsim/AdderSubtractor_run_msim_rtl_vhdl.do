transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Users/Asronic/Desktop/university/Term 6/Logic Circuit LAB/FullAdder4bit/AdderSubtractor.vhd}
vcom -2008 -work work {C:/Users/Asronic/Desktop/university/Term 6/Logic Circuit LAB/FullAdder4bit/FullAdder.vhd}

