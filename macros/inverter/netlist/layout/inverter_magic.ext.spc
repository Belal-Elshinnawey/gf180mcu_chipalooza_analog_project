* NGSPICE file created from inverter.ext - technology: gf180mcuD

.subckt inverter VSS vin VDD vout
X0 vout vin VDD VDD pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X1 vout vin VSS VSS nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X2 VDD vin vout VDD pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X3 VSS vin vout VSS nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X4 vout vin VSS VSS nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X5 vout vin VDD VDD pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X6 VSS vin vout VSS nfet_03v3 ad=2.64p pd=6.64u as=0.52p ps=2.52u w=2u l=2.5u
X7 VDD vin vout VDD pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X8 vout vin VDD VDD pfet_03v3 ad=0.52p pd=2.52u as=2.76p ps=6.76u w=2u l=2.5u
X9 vout vin VDD VDD pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X10 VSS vin vout VSS nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X11 VDD vin vout VDD pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X12 VDD vin vout VDD pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X13 VDD vin vout VDD pfet_03v3 ad=1.3p pd=5.3u as=0.52p ps=2.52u w=2u l=2.5u
X14 vout vin VSS VSS nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X15 VSS vin vout VSS nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X16 vout vin VSS VSS nfet_03v3 ad=0.52p pd=2.52u as=1.22p ps=5.22u w=2u l=2.5u
X17 VSS vin vout VSS nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X18 vout vin VDD VDD pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X19 vout vin VSS VSS nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
.ends

