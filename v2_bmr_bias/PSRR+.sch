v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 510 -200 510 220 {}
L 4 -400 220 510 220 {}
L 4 -400 -200 -400 220 {}
L 4 -400 -200 510 -200 {}
T {PSRR+ TESTBENCH
} -170 240 0 0 1 1 {}
N -30 -40 -30 -20 {lab=VinP}
N -30 40 -30 50 {lab=GND}
N -130 -40 -130 -20 {lab=VinN}
N -130 40 -130 50 {lab=GND}
N 370 -80 370 -70 {lab=GND}
N 370 -170 370 -140 {lab=VDD}
N 280 -60 280 -50 {lab=VDD}
N 280 50 280 60 {lab=GND}
N 150 50 190 50 {lab=#net1}
N 150 50 150 80 {lab=#net1}
N 110 40 190 40 {lab=#net2}
N 110 40 110 80 {lab=#net2}
N 130 140 150 140 {lab=GND}
N 130 140 130 150 {lab=GND}
N 110 140 130 140 {lab=GND}
N 170 -40 190 -40 {lab=VinP}
N 170 0 190 0 {lab=VinN}
N 370 0 370 20 {lab=Vout}
N 370 80 370 90 {lab=GND}
N 370 0 380 0 {lab=Vout}
C {/foss/designs/FOLDED/symbol.sym} 450 0 0 0 {name=x1}
C {vsource.sym} -30 10 0 0 {name=VPac value=1.8 savecurrent=false}
C {gnd.sym} -30 50 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -30 -40 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -130 10 0 1 {name=VNac value=1.8 savecurrent=false}
C {gnd.sym} -130 50 0 1 {name=l9 lab=GND}
C {lab_pin.sym} -130 -40 0 0 {name=p11 sig_type=std_logic lab=VinN}
C {vsource.sym} 110 110 0 1 {name=Vbnmos value=1.25 savecurrent=false}
C {vsource.sym} 150 110 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} 130 150 0 0 {name=l11 lab=GND}
C {vsource.sym} 370 -110 0 0 {name=VDD value="3.3 ac 1" savecurrent=false}
C {gnd.sym} 370 -70 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} 370 -170 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
C {lab_pin.sym} 280 -60 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} 280 60 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 170 -40 0 0 {name=p2 sig_type=std_logic lab=VinP}
C {lab_pin.sym} 170 0 0 0 {name=p3 sig_type=std_logic lab=VinN}
C {capa.sym} 370 50 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 370 90 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 380 0 0 1 {name=p4 sig_type=std_logic lab=Vout}
C {devices/launcher.sym} -110 170 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {code.sym} -320 -40 0 0 {name=s1 only_toplevel=false value="
.control
close all
destroy all

ac dec 20 1 900Meg
let gain_vdd_db = db(Vout/VDD)
meas ac avdd_dc_gain find gain_vdd_db at=1

alter VPac ac = 100m
alter VNac ac = -100m
alter VDD ac = 0
ac dec 20 1 1000G
let VinDiff = v(VinP) - v(VinN)
let gain_dm_db = db(Vout/VinDiff)
meas ac adm_dc_gain find gain_dm_db at=1

let psrr_dc = adm_dc_gain - ac1.avdd_dc_gain
let psrr_full = gain_dm_db - ac1.gain_vdd_db

print adm_dc_gain
print ac1.avdd_dc_gain
print psrr_dc

plot ac1.gain_vdd_db gain_dm_db
plot psrr_full
.endc
"

}
