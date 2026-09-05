v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {CMRR TESTBENCH
} -290 130 0 0 1 1 {}
N -290 -260 -290 -240 {lab=VinP}
N -290 -180 -290 -170 {lab=GND}
N -390 -260 -390 -240 {lab=VinN}
N -390 -180 -390 -170 {lab=GND}
N -390 -130 -390 -110 {lab=Vbn}
N -390 -50 -390 -40 {lab=GND}
N -290 -50 -290 -40 {lab=GND}
N -180 -50 -180 -40 {lab=GND}
N -180 -130 -180 -110 {lab=VDD}
N -290 -130 -290 -110 {lab=Vbp}
N -60 -40 -30 -40 {lab=VinP}
N -60 30 -30 30 {lab=VinN}
N -60 -70 -30 -70 {lab=Vbp}
N -90 -60 -30 -60 {lab=Vbn}
N 40 -90 40 -80 {lab=VDD}
N 160 -20 180 -20 {lab=Vout}
N 160 -20 160 0 {lab=Vout}
N 150 -20 160 -20 {lab=Vout}
N 40 40 40 70 {lab=GND}
N 160 60 160 70 {lab=GND}
C {devices/launcher.sym} 320 -70 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {simulator_commands_shown.sym} -150 -250 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOShv.lib mos_tt
"
      }
C {vsource.sym} -290 -210 0 0 {name=VPac value="1.8 ac 100m" savecurrent=false}
C {gnd.sym} -290 -170 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -290 -260 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -390 -210 0 1 {name=VNac value="1.8 ac 100m" savecurrent=false}
C {gnd.sym} -390 -170 0 1 {name=l9 lab=GND}
C {lab_pin.sym} -390 -260 0 0 {name=p11 sig_type=std_logic lab=VinN}
C {vsource.sym} -390 -80 0 0 {name=Vbnmos value=1.25 savecurrent=false}
C {gnd.sym} -390 -40 0 0 {name=l10 lab=GND}
C {vsource.sym} -290 -80 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} -290 -40 0 0 {name=l11 lab=GND}
C {lab_pin.sym} -290 -130 2 0 {name=p16 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -390 -130 2 0 {name=p15 sig_type=std_logic lab=Vbn}
C {vsource.sym} -180 -80 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} -180 -40 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} -180 -130 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
C {foldedOTA.sym} 250 -20 0 0 {name=x1}
C {lab_pin.sym} -60 -40 0 0 {name=p1 sig_type=std_logic lab=VinP}
C {lab_pin.sym} -60 30 0 0 {name=p2 sig_type=std_logic lab=VinN}
C {lab_pin.sym} -60 -70 3 1 {name=p3 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -90 -60 3 1 {name=p4 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 40 -90 3 1 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} 40 70 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 180 -20 0 1 {name=p6 sig_type=std_logic lab=Vout}
C {capa.sym} 160 30 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 160 70 0 0 {name=l2 lab=GND}
C {code.sym} 120 -190 0 0 {name=s1 only_toplevel=false value="
.control
close all
destroy all

ac dec 20 1 500Meg
let gain_cm_db = db(Vout/VinP)
meas ac acm_dc_gain find gain_cm_db at=1

alter VNac ac = -100m
ac dec 20 1 200G
let VinDiff = v(VinP) - v(VinN)
let gain_dm_db = db(Vout/VinDiff)
meas ac adm_dc_gain find gain_dm_db at=1

let cmrr_dc   = adm_dc_gain - ac1.acm_dc_gain
let cmrr_full = gain_dm_db  - ac1.gain_cm_db

echo
echo '================ CMRR RESULTS ================'
print adm_dc_gain
print ac1.acm_dc_gain
print cmrr_dc
echo '================================================'

* --- plots ---
plot ac1.gain_cm_db gain_dm_db ylabel 'Gain (dB)' xlog title 'Common-Mode vs Differential Gain'
plot cmrr_full ylabel 'CMRR (dB)' xlog title 'CMRR vs Frequency'

.endc
"
}
