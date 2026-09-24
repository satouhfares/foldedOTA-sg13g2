v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {AC RESPONSE TESTBENCH
} -180 160 0 0 1 1 {}
N -180 -230 -180 -210 {lab=VinP}
N -180 -150 -180 -140 {lab=GND}
N -280 -230 -280 -210 {lab=VinN}
N -280 -150 -280 -140 {lab=GND}
N -280 -100 -280 -80 {lab=Vbn}
N -280 -20 -280 -10 {lab=GND}
N -180 -20 -180 -10 {lab=GND}
N -70 -20 -70 -10 {lab=GND}
N -70 -100 -70 -80 {lab=VDD}
N -180 -100 -180 -80 {lab=Vbp}
N 50 -10 80 -10 {lab=VinP}
N 50 60 80 60 {lab=VinN}
N 50 -40 80 -40 {lab=Vbp}
N 20 -30 80 -30 {lab=Vbn}
N 150 -60 150 -50 {lab=VDD}
N 270 10 290 10 {lab=Vout}
N 270 10 270 30 {lab=Vout}
N 260 10 270 10 {lab=Vout}
N 150 70 150 100 {lab=GND}
N 270 90 270 100 {lab=GND}
C {devices/launcher.sym} 430 -40 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {simulator_commands_shown.sym} -40 -220 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOShv.lib mos_sf
"
      }
C {vsource.sym} -180 -180 0 0 {name=VPac value="1.8 ac 100m" savecurrent=false}
C {gnd.sym} -180 -140 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -180 -230 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -280 -180 0 1 {name=VNac value="1.8 ac -100m" savecurrent=false}
C {gnd.sym} -280 -140 0 1 {name=l9 lab=GND}
C {lab_pin.sym} -280 -230 0 0 {name=p11 sig_type=std_logic lab=VinN}
C {vsource.sym} -280 -50 0 0 {name=Vbnmos value=1.25 savecurrent=false}
C {gnd.sym} -280 -10 0 0 {name=l10 lab=GND}
C {vsource.sym} -180 -50 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} -180 -10 0 0 {name=l11 lab=GND}
C {lab_pin.sym} -180 -100 2 0 {name=p16 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -280 -100 2 0 {name=p15 sig_type=std_logic lab=Vbn}
C {vsource.sym} -70 -50 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} -70 -10 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} -70 -100 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
C {code.sym} 340 -180 0 0 {name=s1 only_toplevel=false value="
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
C {foldedOTA.sym} 360 10 0 0 {name=x1}
C {lab_pin.sym} 50 -10 0 0 {name=p1 sig_type=std_logic lab=VinP}
C {lab_pin.sym} 50 60 0 0 {name=p2 sig_type=std_logic lab=VinN}
C {lab_pin.sym} 50 -40 3 1 {name=p3 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} 20 -30 3 1 {name=p4 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 150 -60 3 1 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} 150 100 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 290 10 0 1 {name=p6 sig_type=std_logic lab=Vout}
C {capa.sym} 270 60 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 270 100 0 0 {name=l2 lab=GND}
