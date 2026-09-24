v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1230 190 -1230 260 {lab=#net1}
N -1010 190 -1010 260 {lab=#net1}
N -1120 260 -1010 260 {lab=#net1}
N -1120 260 -1120 310 {lab=#net1}
N -1230 260 -1120 260 {lab=#net1}
N -1120 340 -1120 390 {lab=VSS}
N -690 -70 -690 -10 {lab=VDD}
N -560 -70 -430 -70 {lab=VDD}
N -430 -70 -430 -10 {lab=VDD}
N -690 40 -690 80 {lab=#net2}
N -430 60 -430 80 {lab=#net3}
N -1230 40 -690 40 {lab=#net2}
N -690 20 -690 40 {lab=#net2}
N -1230 40 -1230 130 {lab=#net2}
N -1010 60 -1010 130 {lab=#net3}
N -1010 60 -430 60 {lab=#net3}
N -430 20 -430 60 {lab=#net3}
N -690 160 -690 190 {lab=#net4}
N -690 250 -690 300 {lab=#net5}
N -430 160 -430 190 {lab=VOUT}
N -430 250 -430 300 {lab=#net6}
N -430 330 -430 390 {lab=VSS}
N -690 330 -690 390 {lab=VSS}
N -580 330 -470 330 {lab=#net4}
N -690 160 -580 160 {lab=#net4}
N -690 140 -690 160 {lab=#net4}
N -580 160 -580 330 {lab=#net4}
N -650 330 -580 330 {lab=#net4}
N -530 220 -470 220 {lab=Vbn}
N -530 210 -530 220 {lab=Vbn}
N -560 110 -470 110 {lab=Vbp}
N -560 100 -560 110 {lab=Vbp}
N -650 110 -560 110 {lab=Vbp}
N -650 -10 -630 -10 {lab=#net7}
N -1320 340 -1160 340 {lab=#net8}
N -1440 280 -1440 310 {lab=#net8}
N -1440 340 -1440 390 {lab=VSS}
N -190 40 -190 50 {lab=#net7}
N -190 -70 -190 -10 {lab=VDD}
N -380 -70 -190 -70 {lab=VDD}
N -270 -10 -230 -10 {lab=#net7}
N -390 -10 -330 -10 {lab=#net7}
N -190 110 -190 390 {lab=VSS}
N -690 390 -430 390 {lab=VSS}
N -760 220 -760 390 {lab=VSS}
N -760 220 -690 220 {lab=VSS}
N -360 220 -360 390 {lab=VSS}
N -430 220 -360 220 {lab=VSS}
N -1180 160 -1010 160 {lab=VSS}
N -560 -90 -560 -70 {lab=VDD}
N -690 -70 -560 -70 {lab=VDD}
N -1270 390 -1270 400 {lab=VSS}
N -1440 390 -1270 390 {lab=VSS}
N -750 110 -690 110 {lab=VDD}
N -1440 280 -1320 280 {lab=#net8}
N -1440 250 -1440 280 {lab=#net8}
N -1320 280 -1320 340 {lab=#net8}
N -1400 340 -1320 340 {lab=#net8}
N -1280 160 -1270 160 {lab=VinP}
N -970 160 -950 160 {lab=VinN}
N -430 140 -430 160 {lab=VOUT}
N -650 220 -530 220 {lab=Vbn}
N -270 40 -190 40 {lab=#net7}
N -190 20 -190 40 {lab=#net7}
N -270 -10 -270 40 {lab=#net7}
N -330 -10 -270 -10 {lab=#net7}
N -430 160 -250 160 {lab=VOUT}
N -380 -70 -380 110 {lab=VDD}
N -430 -70 -380 -70 {lab=VDD}
N -430 110 -380 110 {lab=VDD}
N -750 -70 -750 110 {lab=VDD}
N -750 -70 -690 -70 {lab=VDD}
N -630 -10 -630 30 {lab=#net7}
N -330 -10 -330 30 {lab=#net7}
N -630 30 -330 30 {lab=#net7}
N -760 390 -690 390 {lab=VSS}
N -430 390 -360 390 {lab=VSS}
N -1120 390 -760 390 {lab=VSS}
N -1180 390 -1120 390 {lab=VSS}
N -1440 -90 -1440 190 {lab=VDD}
N -1240 -120 -1240 -90 {lab=VDD}
N -1440 -90 -1240 -90 {lab=VDD}
N -1240 -90 -560 -90 {lab=VDD}
N -1180 160 -1180 390 {lab=VSS}
N -1230 160 -1180 160 {lab=VSS}
N -1270 390 -1180 390 {lab=VSS}
N -360 390 -190 390 {lab=VSS}
C {sg13g2_pr/sg13_hv_nmos.sym} -1250 160 0 0 {name=M1
l=1u
w=28u
ng=4
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -990 160 0 1 {name=M2
l=1u
w=28u
ng=4
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1140 340 0 0 {name=M3
l=1u
w=15u
ng=3
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -670 -10 0 1 {name=M4
l=1u
w=14u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -410 -10 0 1 {name=M5
l=1u
w=14u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -670 110 0 1 {name=M6
l=1u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_pmos.sym} -450 110 0 0 {name=M7
l=1u
w=2u
ng=1
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -670 220 0 1 {name=M8
l=1u
w=7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -450 220 0 0 {name=M9
l=1u
w=7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -670 330 0 1 {name=M10
l=1u
w=7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -450 330 0 0 {name=M11
l=1u
w=7u
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -1420 340 0 1 {name=M12
l=1u
w=15u
ng=3
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {isource.sym} -1440 220 0 0 {name=I0 value=50u}
C {sg13g2_pr/sg13_hv_pmos.sym} -210 -10 0 0 {name=M13
l=1u
w=14u
ng=2
m=1
model=sg13_hv_pmos
spiceprefix=X
}
C {isource.sym} -190 80 0 0 {name=I1 value=50u}
C {iopin.sym} -1240 -120 0 0 {name=p10 lab=VDD}
C {iopin.sym} -1270 400 1 0 {name=p9 lab=VSS}
C {iopin.sym} -250 160 0 0 {name=p14 lab=VOUT}
C {iopin.sym} -560 100 0 0 {name=p4 lab=Vbp}
C {iopin.sym} -530 210 0 0 {name=p1 lab=Vbn}
C {iopin.sym} -950 160 0 0 {name=p2 lab=VinN}
C {iopin.sym} -1280 160 0 1 {name=p12 lab=VinP}
C {devices/title.sym} -1230 510 0 0 {name=l5 author="(c) 2026 Fares Satouh"}
