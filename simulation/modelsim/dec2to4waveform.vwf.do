vlog -work work /home/student1/a23das/coe328lab4/simulation/modelsim/dec2to4waveform.vwf.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.dec2to4_vlg_vec_tst
onerror {resume}
add wave {dec2to4_vlg_vec_tst/i1/En}
add wave {dec2to4_vlg_vec_tst/i1/w}
add wave {dec2to4_vlg_vec_tst/i1/w[1]}
add wave {dec2to4_vlg_vec_tst/i1/w[0]}
add wave {dec2to4_vlg_vec_tst/i1/y}
add wave {dec2to4_vlg_vec_tst/i1/y[3]}
add wave {dec2to4_vlg_vec_tst/i1/y[2]}
add wave {dec2to4_vlg_vec_tst/i1/y[1]}
add wave {dec2to4_vlg_vec_tst/i1/y[0]}
run -all
