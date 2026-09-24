v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -400 10 -400 50 {lab=VDD}
N 30 440 30 450 {lab=GND}
N 30 360 30 380 {lab=VDD}
N -90 330 -60 330 {lab=0}
N -90 430 -90 440 {lab=0}
N -150 180 -150 210 {lab=#net1}
N -300 180 -300 210 {lab=#net2}
N -300 80 -300 130 {lab=VDD}
N -200 130 -190 130 {lab=#net1}
N -150 80 -150 130 {lab=VDD}
N -200 180 -150 180 {lab=#net1}
N -150 160 -150 180 {lab=#net1}
N -300 160 -300 180 {lab=#net2}
N -400 330 -400 390 {lab=0}
N -90 10 -90 50 {lab=VDD}
N -350 240 -350 330 {lab=#net3}
N -260 130 -200 130 {lab=#net1}
N -240 80 -150 80 {lab=VDD}
N -350 180 -300 180 {lab=#net2}
N -90 360 -90 370 {lab=#net4}
N -230 280 -150 280 {lab=0}
N -300 240 -300 280 {lab=0}
N -150 240 -150 280 {lab=0}
N -230 280 -230 290 {lab=0}
N -300 280 -230 280 {lab=0}
N -200 130 -200 180 {lab=#net1}
N -240 10 -240 80 {lab=VDD}
N -300 80 -240 80 {lab=VDD}
N -90 240 -90 300 {lab=#net5}
N -110 240 -90 240 {lab=#net5}
N -90 80 -90 240 {lab=#net5}
N -240 10 -90 10 {lab=VDD}
N -350 240 -340 240 {lab=#net3}
N -360 330 -350 330 {lab=#net3}
N -360 50 -350 50 {lab=#net2}
N -400 10 -240 10 {lab=VDD}
N -400 80 -400 240 {lab=#net3}
N -350 50 -130 50 {lab=#net2}
N -400 240 -400 300 {lab=#net3}
N -400 240 -350 240 {lab=#net3}
N -350 330 -130 330 {lab=#net3}
N -350 50 -350 180 {lab=#net2}
N -240 -10 -240 10 {lab=VDD}
C {simulator_commands_shown.sym} 130 -40 0 0 {
name=Libs_Ngspice1
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOShv.lib mos_tt
"
      }
C {gnd.sym} -400 390 0 0 {name=l1 lab=0}
C {vsource.sym} 30 410 0 1 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} 30 450 0 1 {name=l2 lab=GND}
C {lab_pin.sym} 30 360 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {sg13g2_pr/annotate_fet_params.sym} 0 200 0 0 {name=annot1 ref=M1}
C {sg13g2_pr/annotate_fet_params.sym} -10 0 0 0 {name=annot4 ref=M4}
C {gnd.sym} -90 440 0 0 {name=l4 lab=0}
C {res.sym} -90 400 0 0 {name=R1
value=8.64k
footprint=1206
device=resistor
m=1}
C {sg13g2_pr/annotate_fet_params.sym} -590 220 0 0 {name=annot2 ref=M2}
C {sg13g2_pr/sg13_hv_nmos.sym} -110 330 0 0 {name=M1
l=1u
w=15u
ng=2
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -380 330 0 1 {name=M2
l=1u
w=3.75u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} -230 290 0 1 {name=l3 lab=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -380 50 0 1 {name=M3
l=1u
w=3.5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -110 50 0 0 {name=M4
l=1u
w=3.5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -130 240 0 1 {name=M5
l=1u
w=3.75u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -320 240 0 0 {name=M6
l=1u
w=3.75u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -170 130 0 0 {name=M7
l=1u
w=3.5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -280 130 0 1 {name=M8
l=1u
w=3.5u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/annotate_fet_params.sym} -590 0 0 0 {name=annot5 ref=M3}
C {lab_pin.sym} -240 -10 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {gnd.sym} -60 330 0 0 {name=l5 lab=0}
C {devices/launcher.sym} -260 380 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} -260 440 0 0 {name=h3
descr="annotate OP" 
tclcommand="xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw; set show_hidden_texts 1; xschem annotate_op"
}
C {code.sym} 110 120 0 0 {name=s1 only_toplevel=false value="

.control
op
write BMR12u5.save
dc vdd 0 4 10m
let id1=@n.xm1.nsg13_hv_nmos[ids]
let id2=@n.xm2.nsg13_hv_nmos[ids]
plot id1 id2
.endc
"}
C {code_shown.sym} 270 240 0 0 {name=s2 only_toplevel=false value="
.save @n.xm1.nsg13_hv_nmos[ids]
.save @n.xm2.nsg13_hv_nmos[ids]
"}
