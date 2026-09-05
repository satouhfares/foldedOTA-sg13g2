v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {PSRR+ TESTBENCH
} -290 120 0 0 1 1 {}
N -280 -240 -280 -220 {lab=VinP}
N -280 -160 -280 -150 {lab=GND}
N -380 -240 -380 -220 {lab=VinN}
N -380 -160 -380 -150 {lab=GND}
N -380 -110 -380 -90 {lab=Vbn}
N -380 -30 -380 -20 {lab=GND}
N -280 -30 -280 -20 {lab=GND}
N -170 -30 -170 -20 {lab=GND}
N -170 -110 -170 -90 {lab=VDD}
N -280 -110 -280 -90 {lab=Vbp}
N -50 -20 -20 -20 {lab=VinP}
N -50 50 -20 50 {lab=VinN}
N -50 -50 -20 -50 {lab=Vbp}
N -80 -40 -20 -40 {lab=Vbn}
N 50 -70 50 -60 {lab=VDD}
N 170 0 190 0 {lab=Vout}
N 170 0 170 20 {lab=Vout}
N 160 0 170 0 {lab=Vout}
N 50 60 50 90 {lab=GND}
N 170 80 170 90 {lab=GND}
C {devices/launcher.sym} 330 -50 0 0 {name=h1
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
C {vsource.sym} -280 -190 0 0 {name=VPac value=1.8 savecurrent=false}
C {gnd.sym} -280 -150 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -280 -240 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -380 -190 0 1 {name=VNac value=1.8 savecurrent=false}
C {gnd.sym} -380 -150 0 1 {name=l9 lab=GND}
C {lab_pin.sym} -380 -240 0 0 {name=p11 sig_type=std_logic lab=VinN}
C {vsource.sym} -380 -60 0 0 {name=Vbnmos value=1.25 savecurrent=false}
C {gnd.sym} -380 -20 0 0 {name=l10 lab=GND}
C {vsource.sym} -280 -60 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} -280 -20 0 0 {name=l11 lab=GND}
C {lab_pin.sym} -280 -110 2 0 {name=p16 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -380 -110 2 0 {name=p15 sig_type=std_logic lab=Vbn}
C {vsource.sym} -170 -60 0 0 {name=VDD value="3.3 ac 1" savecurrent=false}
C {gnd.sym} -170 -20 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} -170 -110 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
C {foldedOTA.sym} 260 0 0 0 {name=x1}
C {lab_pin.sym} -50 -20 0 0 {name=p1 sig_type=std_logic lab=VinP}
C {lab_pin.sym} -50 50 0 0 {name=p2 sig_type=std_logic lab=VinN}
C {lab_pin.sym} -50 -50 3 1 {name=p3 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -80 -40 3 1 {name=p4 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 50 -70 3 1 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} 50 90 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 190 0 0 1 {name=p6 sig_type=std_logic lab=Vout}
C {capa.sym} 170 50 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 170 90 0 0 {name=l2 lab=GND}
C {code.sym} 270 -190 0 0 {name=s1 only_toplevel=false value="
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
