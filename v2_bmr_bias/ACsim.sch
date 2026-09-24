v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 140 -200 140 220 {}
L 4 -770 220 140 220 {}
L 4 -770 -200 -770 220 {}
L 4 -770 -200 140 -200 {}
T {AC RESPONSE TESTBENCH
} -650 230 0 0 1 1 {}
N -400 -40 -400 -20 {lab=VinP}
N -400 40 -400 50 {lab=GND}
N -500 -40 -500 -20 {lab=VinN}
N -500 40 -500 50 {lab=GND}
N 0 -80 0 -70 {lab=GND}
N 0 -170 0 -140 {lab=VDD}
N -90 -60 -90 -50 {lab=VDD}
N -90 50 -90 60 {lab=GND}
N -220 50 -180 50 {lab=#net1}
N -220 50 -220 80 {lab=#net1}
N -260 40 -180 40 {lab=#net2}
N -260 40 -260 80 {lab=#net2}
N -240 140 -220 140 {lab=GND}
N -240 140 -240 150 {lab=GND}
N -260 140 -240 140 {lab=GND}
N -200 -40 -180 -40 {lab=VinP}
N -200 -0 -180 0 {lab=VinN}
N -0 0 0 20 {lab=Vout}
N 0 80 0 90 {lab=GND}
N 0 0 10 -0 {lab=Vout}
C {/foss/designs/FOLDED/symbol.sym} 80 0 0 0 {name=x1}
C {vsource.sym} -400 10 0 0 {name=VPac value="1.8 ac 100m" savecurrent=false}
C {gnd.sym} -400 50 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -400 -40 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -500 10 0 1 {name=VNac value="1.8 ac -100m" savecurrent=false}
C {gnd.sym} -500 50 0 1 {name=l9 lab=GND}
C {lab_pin.sym} -500 -40 0 0 {name=p11 sig_type=std_logic lab=VinN}
C {vsource.sym} -260 110 0 1 {name=Vbnmos value=1.25 savecurrent=false}
C {vsource.sym} -220 110 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} -240 150 0 0 {name=l11 lab=GND}
C {vsource.sym} 0 -110 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} 0 -70 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} 0 -170 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
C {lab_pin.sym} -90 -60 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} -90 60 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -200 -40 0 0 {name=p2 sig_type=std_logic lab=VinP}
C {lab_pin.sym} -200 0 0 0 {name=p3 sig_type=std_logic lab=VinN}
C {capa.sym} 0 50 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 0 90 0 0 {name=l2 lab=GND}
C {code.sym} -720 -50 0 0 {name=s1 only_toplevel=false value="
.control
destroy all

ac dec 20 1 100Meg
run

let VinDiff = v(VinP) - v(VinN)
let gain_db = db(Vout/VinDiff)
let gain_phase = phase(Vout/VinDiff)*180/PI

save all

meas ac dc_gain      find gain_db at=1
meas ac f3db         when gain_db='dc_gain-3'
meas ac gbw          when gain_db=0
meas ac phase_at_gbw find gain_phase when gain_db=0
let phase_margin = 180 + phase_at_gbw

plot gain_db
plot gain_phase
plot gain_db gain_phase
 
print dc_gain
print f3db
print gbw
print phase_margin
.endc
"
}
C {lab_pin.sym} 10 0 0 1 {name=p4 sig_type=std_logic lab=Vout}
C {devices/launcher.sym} -480 170 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
