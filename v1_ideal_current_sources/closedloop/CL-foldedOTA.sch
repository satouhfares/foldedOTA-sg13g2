v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {CLOSED-LOOP TESTBENCH — Unity-Gain Buffer
} -590 140 0 0 1 1 {}
N -490 -110 -490 -90 {lab=VinP}
N -490 -30 -490 -20 {lab=GND}
N -380 -110 -380 -90 {lab=Vbn}
N -380 -30 -380 -20 {lab=GND}
N -280 -30 -280 -20 {lab=GND}
N -170 -30 -170 -20 {lab=GND}
N -170 -110 -170 -90 {lab=VDD}
N -280 -110 -280 -90 {lab=Vbp}
N -50 -20 -20 -20 {lab=VinP}
N -50 50 -20 50 {lab=Vout}
N -50 -50 -20 -50 {lab=Vbp}
N -80 -40 -20 -40 {lab=Vbn}
N 50 -70 50 -60 {lab=VDD}
N 240 -0 270 0 {lab=Vout}
N 170 0 170 20 {lab=Vout}
N 160 0 170 0 {lab=Vout}
N 50 60 50 90 {lab=GND}
N 170 80 170 90 {lab=GND}
N 240 -0 240 120 {lab=Vout}
N 170 0 240 -0 {lab=Vout}
N -50 120 240 120 {lab=Vout}
N -50 50 -50 120 {lab=Vout}
C {devices/launcher.sym} 310 -100 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {simulator_commands_shown.sym} -140 -230 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOShv.lib mos_tt
"
      }
C {vsource.sym} -490 -60 0 0 {name=VPac value="1.8 ac 100m" savecurrent=false}
C {gnd.sym} -490 -20 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -490 -110 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -380 -60 0 0 {name=Vbnmos value=1.25 savecurrent=false}
C {gnd.sym} -380 -20 0 0 {name=l10 lab=GND}
C {vsource.sym} -280 -60 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} -280 -20 0 0 {name=l11 lab=GND}
C {lab_pin.sym} -280 -110 2 0 {name=p16 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -380 -110 2 0 {name=p15 sig_type=std_logic lab=Vbn}
C {vsource.sym} -170 -60 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} -170 -20 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} -170 -110 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
C {foldedOTA.sym} 260 0 0 0 {name=x1}
C {lab_pin.sym} -50 -20 0 0 {name=p1 sig_type=std_logic lab=VinP}
C {lab_pin.sym} -50 -50 3 1 {name=p3 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -80 -40 3 1 {name=p4 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 50 -70 3 1 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} 50 90 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 270 0 0 1 {name=p6 sig_type=std_logic lab=Vout}
C {capa.sym} 170 50 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 170 90 0 0 {name=l2 lab=GND}
C {code.sym} 110 -150 0 0 {name=s1 only_toplevel=false value="
.control
destroy all
ac dec 20 1 900Meg
run

let gain_db    = db(Vout/VinP)
let gain_phase = phase(Vout/VinP)*180/PI

save all

meas ac dc_gain_cl find gain_db at=1
meas ac f3db_cl    when gain_db='dc_gain_cl-3'
meas ac gpeak      max  gain_db

plot gain_db    ylabel 'Gain (dB)'   xlog title 'Closed-Loop Gain'
plot gain_phase ylabel 'Phase (deg)' xlog title 'Closed-Loop Phase'

echo
echo '================ CLOSED-LOOP AC SUMMARY ================'
print dc_gain_cl
print f3db_cl
print gpeak
echo '=========================================================='

.endc
"}
