v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {PSRR- TESTBENCH
} -290 110 0 0 1 1 {}
N -280 -250 -280 -230 {lab=VinP}
N -280 -170 -280 -160 {lab=GND}
N -380 -250 -380 -230 {lab=VinN}
N -380 -170 -380 -160 {lab=GND}
N -380 -120 -380 -100 {lab=Vbn}
N -380 -40 -380 -30 {lab=GND}
N -280 -40 -280 -30 {lab=GND}
N -170 -40 -170 -30 {lab=GND}
N -170 -120 -170 -100 {lab=VDD}
N -280 -120 -280 -100 {lab=Vbp}
N -50 -30 -20 -30 {lab=VinP}
N -50 40 -20 40 {lab=VinN}
N -50 -60 -20 -60 {lab=Vbp}
N -80 -50 -20 -50 {lab=Vbn}
N 50 -80 50 -70 {lab=VDD}
N 170 -10 190 -10 {lab=Vout}
N 170 -10 170 10 {lab=Vout}
N 160 -10 170 -10 {lab=Vout}
N 50 50 50 80 {lab=VSS}
N 170 70 170 80 {lab=GND}
N -470 -40 -470 -30 {lab=GND}
N -470 -120 -470 -100 {lab=VSS}
C {devices/launcher.sym} 330 -60 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {simulator_commands_shown.sym} -140 -240 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOShv.lib mos_tt
"
      }
C {vsource.sym} -280 -200 0 0 {name=VPac value=1.8 savecurrent=false}
C {gnd.sym} -280 -160 0 0 {name=l8 lab=GND}
C {lab_pin.sym} -280 -250 0 0 {name=p10 sig_type=std_logic lab=VinP}
C {vsource.sym} -380 -200 0 1 {name=VNac value=1.8 savecurrent=false}
C {gnd.sym} -380 -160 0 1 {name=l9 lab=GND}
C {lab_pin.sym} -380 -250 0 0 {name=p11 sig_type=std_logic lab=VinN}
C {vsource.sym} -380 -70 0 0 {name=Vbnmos value=1.25 savecurrent=false}
C {gnd.sym} -380 -30 0 0 {name=l10 lab=GND}
C {vsource.sym} -280 -70 0 0 {name=Vbpmos value=0.5 savecurrent=false}
C {gnd.sym} -280 -30 0 0 {name=l11 lab=GND}
C {lab_pin.sym} -280 -120 2 0 {name=p16 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -380 -120 2 0 {name=p15 sig_type=std_logic lab=Vbn}
C {vsource.sym} -170 -70 0 0 {name=VDD value=3.3 savecurrent=false}
C {gnd.sym} -170 -30 0 0 {name=l7 lab=GND
value=3.3}
C {lab_pin.sym} -170 -120 0 0 {name=p9 sig_type=std_logic lab=VDD
value=3.3}
C {foldedOTA.sym} 260 -10 0 0 {name=x1}
C {lab_pin.sym} -50 -30 0 0 {name=p1 sig_type=std_logic lab=VinP}
C {lab_pin.sym} -50 40 0 0 {name=p2 sig_type=std_logic lab=VinN}
C {lab_pin.sym} -50 -60 3 1 {name=p3 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} -80 -50 3 1 {name=p4 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 50 -80 3 1 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 190 -10 0 1 {name=p6 sig_type=std_logic lab=Vout}
C {capa.sym} 170 40 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 170 80 0 0 {name=l2 lab=GND}
C {vsource.sym} -470 -70 0 0 {name=VSSac value="0 ac 1" savecurrent=false}
C {gnd.sym} -470 -30 0 0 {name=l1 lab=GND
value=3.3}
C {lab_pin.sym} -470 -120 0 0 {name=p7 sig_type=std_logic lab=VSS
value="0 ac 1"}
C {lab_pin.sym} 50 80 0 0 {name=p8 sig_type=std_logic lab=VSS
value="0 ac 1"}
C {code.sym} 120 -170 0 0 {name=s1 only_toplevel=false value="
.control
close all
destroy all

ac dec 20 1 200G
let gain_vss_db = db(Vout/v(VSS))
meas ac avss_dc_gain find gain_vss_db at=1

alter VPac ac = 100m
alter VNac ac = -100m
alter VSSac ac = 0
ac dec 20 1 200G
let VinDiff = v(VinP) - v(VinN)
let gain_dm_db = db(Vout/VinDiff)
meas ac adm_dc_gain find gain_dm_db at=1

let psrr_neg_dc = adm_dc_gain - ac1.avss_dc_gain
let psrr_neg_full = gain_dm_db - ac1.gain_vss_db

print adm_dc_gain
print ac1.avss_dc_gain
print psrr_neg_dc

plot ac1.gain_vss_db gain_dm_db
plot psrr_neg_full
.endc
"
}
