v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -230 0 -120 0 {lab=0}
N -340 30 -340 100 {lab=#net1}
N -120 30 -120 100 {lab=#net1}
N -230 100 -120 100 {lab=#net1}
N -230 100 -230 150 {lab=#net1}
N -340 100 -230 100 {lab=#net1}
N -230 180 -230 230 {lab=0}
N 430 -300 430 -240 {lab=VDD}
N 690 -300 690 -240 {lab=VDD}
N 430 70 430 100 {lab=#net2}
N 690 70 690 100 {lab=Vout}
N 560 400 690 400 {lab=0}
N 690 340 690 400 {lab=0}
N 430 340 430 400 {lab=0}
N 540 340 650 340 {lab=#net2}
N 430 70 540 70 {lab=#net2}
N 470 340 540 340 {lab=#net2}
N 590 130 650 130 {lab=Vbn}
N 590 120 590 130 {lab=Vbn}
N 560 -20 650 -20 {lab=Vbp}
N 560 -30 560 -20 {lab=Vbp}
N 470 -20 560 -20 {lab=Vbp}
N 470 -240 490 -240 {lab=Vb1}
N -430 180 -270 180 {lab=#net3}
N -380 230 -230 230 {lab=0}
N -550 120 -550 150 {lab=#net3}
N -550 180 -550 230 {lab=0}
N -550 -230 -550 30 {lab=VDD}
N 1140 -190 1140 -180 {lab=Vb1}
N 1140 -300 1140 -240 {lab=VDD}
N 1060 -240 1100 -240 {lab=Vb1}
N 790 -250 790 -240 {lab=Vb1}
N 730 -240 790 -240 {lab=Vb1}
N 1140 -120 1140 -110 {lab=0}
N 560 400 560 410 {lab=0}
N 430 400 560 400 {lab=0}
N 360 130 360 140 {lab=0}
N 360 130 430 130 {lab=0}
N 760 130 760 140 {lab=0}
N 690 130 760 130 {lab=0}
N -230 0 -230 10 {lab=0}
N -340 0 -230 0 {lab=0}
N 560 -320 560 -300 {lab=VDD}
N 430 -300 560 -300 {lab=VDD}
N -380 230 -380 240 {lab=0}
N -550 230 -380 230 {lab=0}
N 370 -20 430 -20 {lab=VDD}
N 690 -20 750 -20 {lab=VDD}
N -550 120 -430 120 {lab=#net3}
N -550 90 -550 120 {lab=#net3}
N -430 120 -430 180 {lab=#net3}
N -510 180 -430 180 {lab=#net3}
N -510 290 -510 310 {lab=VinP}
N -510 370 -510 380 {lab=GND}
N -610 290 -610 310 {lab=VinN}
N -610 370 -610 380 {lab=GND}
N -390 0 -380 0 {lab=VinP}
N -80 0 -60 0 {lab=VinN}
N 470 130 590 130 {lab=Vbn}
N -610 420 -610 440 {lab=Vbn}
N -610 500 -610 510 {lab=GND}
N -510 500 -510 510 {lab=GND}
N 1060 -190 1140 -190 {lab=Vb1}
N 1140 -210 1140 -190 {lab=Vb1}
N 1060 -240 1060 -190 {lab=Vb1}
N 800 70 800 90 {lab=Vout}
N 800 150 800 160 {lab=0}
N 430 160 430 310 {lab=#net4}
N 540 70 540 340 {lab=#net2}
N 430 10 430 70 {lab=#net2}
N 690 10 690 70 {lab=Vout}
N -340 -180 -340 -30 {lab=#net5}
N -340 -180 430 -180 {lab=#net5}
N 430 -180 430 -50 {lab=#net5}
N -120 -160 690 -160 {lab=#net6}
N 430 -210 430 -180 {lab=#net5}
N 690 -160 690 -50 {lab=#net6}
N 690 70 800 70 {lab=Vout}
N 800 70 830 70 {lab=Vout}
N 790 -240 1060 -240 {lab=Vb1}
N 690 160 690 310 {lab=#net7}
N 690 -210 690 -160 {lab=#net6}
N -120 -160 -120 -30 {lab=#net6}
N -400 500 -400 510 {lab=GND}
N -400 420 -400 440 {lab=VDD}
N -510 420 -510 440 {lab=Vbp}
N 560 -300 690 -300 {lab=VDD}
N 690 -300 1140 -300 {lab=VDD}
C {devices/launcher.sym} -90 320 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} -90 380 0 0 {name=h3
descr="annotate OP" 
tclcommand="xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw; set show_hidden_texts 1; xschem annotate_op"
}
C {simulator_commands_shown.sym} -310 -280 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOShv.lib mos_tt
"
      }
C {sg13g2_pr/sg13_hv_nmos.sym} -360 0 0 0 {name=M1
l=1u
w=28u
ng=4
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -100 0 0 1 {name=M2
l=1u
w=28u
ng=4
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -250 180 0 0 {name=M3
l=1u
w=15u
ng=3
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 450 -240 0 1 {name=M4
l=1u
w=14u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 710 -240 0 1 {name=M5
l=1u
w=14u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 450 -20 0 1 {name=M6
l=1u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} 670 -20 0 0 {name=M7
l=1u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 450 130 0 1 {name=M8
l=1u
w=7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 670 130 0 0 {name=M9
l=1u
w=7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 450 340 0 1 {name=M10
l=1u
w=7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 670 340 0 0 {name=M11
l=1u
w=7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {lab_pin.sym} 590 120 2 0 {name=p1 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 560 -30 2 0 {name=p2 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} 490 -240 2 0 {name=p3 sig_type=std_logic lab=Vb1}
C {lab_pin.sym} 790 -250 2 0 {name=p4 sig_type=std_logic lab=Vb1}
C {sg13g2_pr/sg13_hv_nmos.sym} -530 180 0 1 {name=M12
l=1u
w=15u
ng=3
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {isource.sym} -550 60 0 0 {name=I0 value=50u}
C {sg13g2_pr/sg13_hv_pmos.sym} 1120 -240 0 0 {name=M13
l=1u
w=14u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {isource.sym} 1140 -150 0 0 {name=I1 value=50u}
C {gnd.sym} 1140 -110 0 0 {name=l1 lab=0}
C {gnd.sym} 560 410 0 0 {name=l2 lab=0}
C {gnd.sym} 360 140 0 0 {name=l3 lab=0}
C {gnd.sym} 760 140 0 1 {name=l4 lab=0}
C {gnd.sym} -230 10 0 0 {name=l5 lab=0}
C {lab_pin.sym} 560 -320 2 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -550 -230 2 0 {name=p6 sig_type=std_logic lab=VDD}
C {gnd.sym} -380 240 0 0 {name=l6 lab=0}
C {lab_pin.sym} 370 -20 2 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 750 -20 2 0 {name=p8 sig_type=std_logic lab=VDD}
C {vsource.sym} -510 340 0 0 {name=VPac value="1.8 ac 100m" savecurrent=false}
C {gnd.sym} -510 380 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -510 290 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -610 340 0 1 {name=VNac value="1.8 ac -100m" savecurrent=false}
C {gnd.sym} -610 380 0 1 {name=l9 lab=GND}
C {lab_pin.sym} -610 290 0 0 {name=p11 sig_type=std_logic lab=VinN}
C {lab_pin.sym} -390 0 0 0 {name=p12 sig_type=std_logic lab=VinP}
C {lab_pin.sym} -60 0 0 1 {name=p13 sig_type=std_logic lab=VinN}
C {lab_pin.sym} 830 70 2 0 {name=p14 sig_type=std_logic lab=Vout}
C {vsource.sym} -610 470 0 0 {name=Vbnmos value=1.25 savecurrent=false}
C {gnd.sym} -610 510 0 0 {name=l10 lab=GND}
C {vsource.sym} -510 470 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} -510 510 0 0 {name=l11 lab=GND}
C {lab_pin.sym} -510 420 2 0 {name=p16 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -610 420 2 0 {name=p15 sig_type=std_logic lab=Vbn}
C {capa.sym} 800 120 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 800 160 0 0 {name=l12 lab=0}
C {code.sym} 40 120 0 0 {name=s1 only_toplevel=false value="
.include OP-foldedOTA.save
.control
op
write OP-foldedOTA.raw
.endc
"
}
C {sg13g2_pr/annotate_fet_params.sym} -530 -140 0 0 {name=annot1 ref=M1}
C {sg13g2_pr/annotate_fet_params.sym} 230 -80 0 0 {name=annot2 ref=M6}
C {sg13g2_pr/annotate_fet_params.sym} -150 120 0 0 {name=annot3 ref=M3}
C {sg13g2_pr/annotate_fet_params.sym} -730 100 0 0 {name=annot4 ref=M12}
C {sg13g2_pr/annotate_fet_params.sym} 240 -340 0 0 {name=annot5 ref=M4}
C {sg13g2_pr/annotate_fet_params.sym} 860 -210 0 0 {name=annot6 ref=M5}
C {sg13g2_pr/annotate_fet_params.sym} 1220 -300 0 0 {name=annot7 ref=M13}
C {sg13g2_pr/annotate_fet_params.sym} 860 -60 0 0 {name=annot8 ref=M7}
C {sg13g2_pr/annotate_fet_params.sym} 860 130 0 0 {name=annot9 ref=M9}
C {sg13g2_pr/annotate_fet_params.sym} 860 300 0 0 {name=annot10 ref=M11}
C {sg13g2_pr/annotate_fet_params.sym} 230 280 0 0 {name=annot11 ref=M10}
C {sg13g2_pr/annotate_fet_params.sym} 220 100 0 0 {name=annot12 ref=M8}
C {sg13g2_pr/annotate_fet_params.sym} 0 -140 0 0 {name=annot13 ref=M2}
C {vsource.sym} -400 470 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} -400 510 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} -400 420 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
