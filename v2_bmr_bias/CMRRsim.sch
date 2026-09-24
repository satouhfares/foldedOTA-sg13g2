v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 540 -200 540 220 {}
L 4 -370 220 540 220 {}
L 4 -370 -200 -370 220 {}
L 4 -370 -200 540 -200 {}
T {CMRR TESTBENCH
} -130 240 0 0 1 1 {}
N 0 -40 0 -20 {lab=VinP}
N 0 40 0 50 {lab=GND}
N -100 -40 -100 -20 {lab=VinN}
N -100 40 -100 50 {lab=GND}
N 400 -80 400 -70 {lab=GND}
N 400 -170 400 -140 {lab=VDD}
N 310 -60 310 -50 {lab=VDD}
N 310 50 310 60 {lab=GND}
N 180 50 220 50 {lab=#net1}
N 180 50 180 80 {lab=#net1}
N 140 40 220 40 {lab=#net2}
N 140 40 140 80 {lab=#net2}
N 160 140 180 140 {lab=GND}
N 160 140 160 150 {lab=GND}
N 140 140 160 140 {lab=GND}
N 200 -40 220 -40 {lab=VinP}
N 200 0 220 0 {lab=VinN}
N 400 0 400 20 {lab=Vout}
N 400 80 400 90 {lab=GND}
N 400 0 410 0 {lab=Vout}
C {/foss/designs/FOLDED/symbol.sym} 480 0 0 0 {name=x1}
C {vsource.sym} 0 10 0 0 {name=VPac value="1.8 ac 100m" savecurrent=false}
C {gnd.sym} 0 50 0 0 {name=l8 lab=GND}
C {lab_pin.sym} 0 -40 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -100 10 0 1 {name=VNac value="1.8 ac 100m" savecurrent=false}
C {gnd.sym} -100 50 0 1 {name=l9 lab=GND}
C {lab_pin.sym} -100 -40 0 0 {name=p11 sig_type=std_logic lab=VinN}
C {vsource.sym} 140 110 0 1 {name=Vbnmos value=1.25 savecurrent=false}
C {vsource.sym} 180 110 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} 160 150 0 0 {name=l11 lab=GND}
C {vsource.sym} 400 -110 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} 400 -70 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} 400 -170 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
C {lab_pin.sym} 310 -60 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} 310 60 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 200 -40 0 0 {name=p2 sig_type=std_logic lab=VinP}
C {lab_pin.sym} 200 0 0 0 {name=p3 sig_type=std_logic lab=VinN}
C {capa.sym} 400 50 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 400 90 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 410 0 0 1 {name=p4 sig_type=std_logic lab=Vout}
C {devices/launcher.sym} -80 170 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {code.sym} -320 -50 0 0 {name=s1 only_toplevel=false value="
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
