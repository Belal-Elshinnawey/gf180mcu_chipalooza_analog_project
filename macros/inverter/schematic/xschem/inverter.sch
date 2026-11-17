v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 120 -10 120 130 {lab=vout}
N 40 -40 80 -40 {lab=vin}
N 40 -40 40 160 {lab=vin}
N 40 160 80 160 {lab=vin}
N 120 -130 120 -70 {lab=VDD}
N 120 -40 150 -40 {lab=VDD}
N 150 -100 150 -40 {lab=VDD}
N 120 -100 150 -100 {lab=VDD}
N 120 160 140 160 {lab=VSS}
N 140 160 140 220 {lab=VSS}
N 120 220 140 220 {lab=VSS}
N 120 190 120 220 {lab=VSS}
N 120 220 120 250 {lab=VSS}
C {gf180mcu_fd_pr/pfet_03v3.sym} 100 -40 0 0 {name=M1
L=2.5u
W=20u
nf=10
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {gf180mcu_fd_pr/nfet_03v3.sym} 100 160 0 0 {name=M2
L=2.5u
W=20u
nf=10
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {iopin.sym} 120 -130 0 0 {name=p1 lab=VDD}
C {iopin.sym} 120 250 0 0 {name=p2 lab=VSS}
C {ipin.sym} 40 60 0 0 {name=p3 lab=vin}
C {opin.sym} 120 60 0 0 {name=p4 lab=vout}
