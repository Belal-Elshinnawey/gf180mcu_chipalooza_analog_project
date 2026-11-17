* NGSPICE file created from slot_1.ext - technology: gf180mcuD

.subckt pfet a_538_0# a_5370_0# a_3058_n60# a_1746_0# a_3662_n60# a_3558_0# a_2350_0#
+ a_4162_0# a_4266_n60# a_642_n60# a_38_n60# a_n92_0# a_4870_n60# a_1246_n60# a_1142_0#
+ a_1850_n60# a_5474_n60# w_n264_n198# a_2954_0# a_4766_0# a_2454_n60#
X0 a_4766_0# a_4266_n60# a_4162_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X1 a_4162_0# a_3662_n60# a_3558_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X2 a_1142_0# a_642_n60# a_538_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X3 a_3558_0# a_3058_n60# a_2954_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X4 a_2954_0# a_2454_n60# a_2350_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X5 w_n264_n198# a_5474_n60# a_5370_0# w_n264_n198# pfet_03v3 ad=2.76p pd=6.76u as=0.52p ps=2.52u w=2u l=2.5u
X6 a_2350_0# a_1850_n60# a_1746_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X7 a_1746_0# a_1246_n60# a_1142_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X8 a_538_0# a_38_n60# a_n92_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=1.3p ps=5.3u w=2u l=2.5u
X9 a_5370_0# a_4870_n60# a_4766_0# w_n264_n198# pfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
.ends

.subckt nfet a_538_0# a_5370_0# a_3058_n60# a_1746_0# a_3662_n60# a_3558_0# a_2350_0#
+ a_4162_0# a_4266_n60# a_642_n60# a_38_n60# a_n84_0# a_4870_n60# a_5974_0# a_1246_n60#
+ a_1142_0# a_1850_n60# a_5474_n60# a_2954_0# a_4766_0# a_2454_n60#
X0 a_4162_0# a_3662_n60# a_3558_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X1 a_1142_0# a_642_n60# a_538_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X2 a_3558_0# a_3058_n60# a_2954_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X3 a_2954_0# a_2454_n60# a_2350_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X4 a_5974_0# a_5474_n60# a_5370_0# a_5974_0# nfet_03v3 ad=2.64p pd=6.64u as=0.52p ps=2.52u w=2u l=2.5u
X5 a_2350_0# a_1850_n60# a_1746_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X6 a_1746_0# a_1246_n60# a_1142_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X7 a_538_0# a_38_n60# a_n84_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=1.22p ps=5.22u w=2u l=2.5u
X8 a_5370_0# a_4870_n60# a_4766_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
X9 a_4766_0# a_4266_n60# a_4162_0# a_5974_0# nfet_03v3 ad=0.52p pd=2.52u as=0.52p ps=2.52u w=2u l=2.5u
.ends

.subckt inverter vin VDD vout VSS
Xpfet_0 vout vout vin vout vin VDD VDD vout vin vin vin VDD vin vin VDD vin vin VDD
+ vout VDD vin pfet
Xnfet_0 vout vout vin vout vin VSS VSS vout vin vin vin VSS vin VSS vin VSS vin vin
+ vout VSS vin nfet
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__fillcap_8 VDD VSS VNW VPW
X0 VDD a_572_375# a_484_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X1 a_572_375# a_484_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X2 a_124_375# a_36_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X3 VDD a_124_375# a_36_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__fillcap_64 VDD VSS VNW VPW
X0 a_4604_375# a_4516_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X1 VDD a_572_375# a_484_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X2 VDD a_2364_375# a_2276_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X3 a_4156_375# a_4068_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X4 a_5500_375# a_5412_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X5 a_572_375# a_484_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X6 VDD a_5052_375# a_4964_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X7 VDD a_6844_375# a_6756_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X8 VDD a_1916_375# a_1828_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X9 a_124_375# a_36_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X10 a_5052_375# a_4964_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X11 a_1916_375# a_1828_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X12 VDD a_4604_375# a_4516_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X13 a_1468_375# a_1380_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X14 a_2812_375# a_2724_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X15 VDD a_3260_375# a_3172_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X16 a_2364_375# a_2276_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X17 a_5948_375# a_5860_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X18 VDD a_2812_375# a_2724_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X19 a_3260_375# a_3172_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X20 VDD a_1020_375# a_932_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X21 VDD a_5500_375# a_5412_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X22 a_6844_375# a_6756_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X23 a_6396_375# a_6308_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X24 VDD a_6396_375# a_6308_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X25 VDD a_1468_375# a_1380_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X26 VDD a_4156_375# a_4068_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X27 VDD a_5948_375# a_5860_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X28 VDD a_124_375# a_36_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X29 a_3708_375# a_3620_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X30 VDD a_3708_375# a_3620_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X31 a_1020_375# a_932_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__fillcap_4 VDD VSS VNW VPW
X0 a_124_375# a_36_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X1 VDD a_124_375# a_36_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__dffq_1 VDD Q CLK VSS D VNW VPW
X0 VSS CLK a_36_151# VPW nfet_05v0 ad=0.1053p pd=0.925u as=0.1782p ps=1.69u w=0.405u l=0.6u
X1 Q a_2304_115# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=0.6u
X2 a_2304_115# a_2011_527# VSS VPW nfet_05v0 ad=0.176p pd=1.68u as=0.142p ps=1.14u w=0.4u l=0.6u
X3 a_1004_159# D a_836_159# VPW nfet_05v0 ad=0.207p pd=1.51u as=43.2f ps=0.6u w=0.36u l=0.6u
X4 a_1004_159# D a_880_527# VNW pfet_05v0 ad=0.1872p pd=1.4u as=54f ps=0.66u w=0.36u l=0.5u
X5 a_2011_527# a_36_151# a_1376_115# VNW pfet_05v0 ad=0.1665p pd=1.285u as=0.1791p ps=1.355u w=0.36u l=0.5u
X6 a_2296_527# a_448_472# a_2011_527# VNW pfet_05v0 ad=50.4f pd=0.64u as=0.1665p ps=1.285u w=0.36u l=0.5u
X7 a_1376_115# a_1004_159# VDD VNW pfet_05v0 ad=0.1791p pd=1.355u as=0.1044p ps=0.94u w=0.36u l=0.5u
X8 VDD CLK a_36_151# VNW pfet_05v0 ad=0.2249p pd=1.385u as=0.3806p ps=2.61u w=0.865u l=0.5u
X9 VSS a_1376_115# a_1328_159# VPW nfet_05v0 ad=0.2637p pd=1.825u as=43.2f ps=0.6u w=0.36u l=0.6u
X10 a_2011_527# a_448_472# a_1376_115# VPW nfet_05v0 ad=93.59999f pd=0.88u as=93.59999f ps=0.88u w=0.36u l=0.6u
X11 a_448_472# a_36_151# VDD VNW pfet_05v0 ad=0.3806p pd=2.61u as=0.2249p ps=1.385u w=0.865u l=0.5u
X12 Q a_2304_115# VDD VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=0.5u
X13 a_1376_115# a_1004_159# VSS VPW nfet_05v0 ad=93.59999f pd=0.88u as=0.2637p ps=1.825u w=0.36u l=0.6u
X14 VSS a_2304_115# a_2256_159# VPW nfet_05v0 ad=0.142p pd=1.14u as=43.2f ps=0.6u w=0.36u l=0.6u
X15 a_836_159# a_36_151# VSS VPW nfet_05v0 ad=43.2f pd=0.6u as=0.1584p ps=1.6u w=0.36u l=0.6u
X16 a_448_472# a_36_151# VSS VPW nfet_05v0 ad=0.1782p pd=1.69u as=0.1053p ps=0.925u w=0.405u l=0.6u
X17 a_2256_159# a_36_151# a_2011_527# VPW nfet_05v0 ad=43.2f pd=0.6u as=93.59999f ps=0.88u w=0.36u l=0.6u
X18 a_880_527# a_448_472# VDD VNW pfet_05v0 ad=54f pd=0.66u as=0.4554p ps=3.25u w=0.36u l=0.5u
X19 a_1348_527# a_36_151# a_1004_159# VNW pfet_05v0 ad=43.2f pd=0.6u as=0.1872p ps=1.4u w=0.36u l=0.5u
X20 a_1328_159# a_448_472# a_1004_159# VPW nfet_05v0 ad=43.2f pd=0.6u as=0.207p ps=1.51u w=0.36u l=0.6u
X21 VDD a_1376_115# a_1348_527# VNW pfet_05v0 ad=0.1044p pd=0.94u as=43.2f ps=0.6u w=0.36u l=0.5u
X22 VDD a_2304_115# a_2296_527# VNW pfet_05v0 ad=0.23p pd=1.54u as=50.4f ps=0.64u w=0.36u l=0.5u
X23 a_2304_115# a_2011_527# VDD VNW pfet_05v0 ad=0.352p pd=2.48u as=0.23p ps=1.54u w=0.8u l=0.5u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__nand4_4 A3 A4 VDD VSS ZN A1 A2 VNW VPW
X0 ZN A2 VDD VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X1 VDD A1 ZN VNW pfet_05v0 ad=0.4056p pd=1.805u as=0.2197p ps=1.365u w=0.845u l=0.5u
X2 ZN A3 VDD VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.3718p ps=2.57u w=0.845u l=0.5u
X3 a_244_68# A3 a_36_68# VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.3608p ps=2.52u w=0.82u l=0.6u
X4 VSS A4 a_244_68# VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.1312p ps=1.14u w=0.82u l=0.6u
X5 a_1468_68# A4 VSS VPW nfet_05v0 ad=0.1517p pd=1.19u as=0.2132p ps=1.34u w=0.82u l=0.6u
X6 VDD A4 ZN VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X7 a_1866_68# A2 a_1662_68# VPW nfet_05v0 ad=0.1517p pd=1.19u as=0.1722p ps=1.24u w=0.82u l=0.6u
X8 ZN A4 VDD VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X9 ZN A1 VDD VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.4056p ps=1.805u w=0.845u l=0.5u
X10 a_3276_68# A1 ZN VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.4161p ps=1.905u w=0.82u l=0.6u
X11 a_652_68# A4 VSS VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.2132p ps=1.34u w=0.82u l=0.6u
X12 a_36_68# A3 a_652_68# VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.1312p ps=1.14u w=0.82u l=0.6u
X13 VDD A2 ZN VNW pfet_05v0 ad=0.3718p pd=2.57u as=0.2197p ps=1.365u w=0.845u l=0.5u
X14 VDD A3 ZN VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X15 VSS A4 a_1060_68# VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.1312p ps=1.14u w=0.82u l=0.6u
X16 ZN A3 VDD VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X17 a_2372_68# A1 ZN VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.4161p ps=1.905u w=0.82u l=0.6u
X18 a_36_68# A2 a_2372_68# VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.1312p ps=1.14u w=0.82u l=0.6u
X19 ZN A1 VDD VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.4056p ps=1.805u w=0.845u l=0.5u
X20 a_1060_68# A3 a_36_68# VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.2132p ps=1.34u w=0.82u l=0.6u
X21 VDD A2 ZN VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X22 VDD A4 ZN VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X23 ZN A2 VDD VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X24 ZN A1 a_2780_68# VPW nfet_05v0 ad=0.4161p pd=1.905u as=0.1312p ps=1.14u w=0.82u l=0.6u
X25 a_2780_68# A2 a_36_68# VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.2132p ps=1.34u w=0.82u l=0.6u
X26 ZN A4 VDD VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X27 VDD A1 ZN VNW pfet_05v0 ad=0.4056p pd=1.805u as=0.2197p ps=1.365u w=0.845u l=0.5u
X28 a_36_68# A2 a_3276_68# VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.1312p ps=1.14u w=0.82u l=0.6u
X29 VDD A3 ZN VNW pfet_05v0 ad=0.2197p pd=1.365u as=0.2197p ps=1.365u w=0.845u l=0.5u
X30 a_1662_68# A3 a_1468_68# VPW nfet_05v0 ad=0.1722p pd=1.24u as=0.1517p ps=1.19u w=0.82u l=0.6u
X31 ZN A1 a_1866_68# VPW nfet_05v0 ad=0.4161p pd=1.905u as=0.1517p ps=1.19u w=0.82u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__fillcap_32 VDD VSS VNW VPW
X0 VDD a_572_375# a_484_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X1 VDD a_2364_375# a_2276_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X2 a_572_375# a_484_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X3 VDD a_1916_375# a_1828_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X4 a_124_375# a_36_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X5 a_1916_375# a_1828_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X6 a_1468_375# a_1380_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X7 a_2812_375# a_2724_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X8 VDD a_3260_375# a_3172_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X9 a_2364_375# a_2276_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X10 VDD a_2812_375# a_2724_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X11 a_3260_375# a_3172_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X12 VDD a_1020_375# a_932_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X13 VDD a_1468_375# a_1380_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X14 VDD a_124_375# a_36_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X15 a_1020_375# a_932_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__buf_2 VSS Z I VDD VNW VPW
X0 Z a_36_68# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.4941p ps=2.03u w=1.22u l=0.5u
X1 VSS I a_36_68# VPW nfet_05v0 ad=0.2911p pd=1.53u as=0.3608p ps=2.52u w=0.82u l=0.6u
X2 Z a_36_68# VSS VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.2911p ps=1.53u w=0.82u l=0.6u
X3 VDD I a_36_68# VNW pfet_05v0 ad=0.4941p pd=2.03u as=0.5368p ps=3.32u w=1.22u l=0.5u
X4 VSS a_36_68# Z VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.2132p ps=1.34u w=0.82u l=0.6u
X5 VDD a_36_68# Z VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.3782p ps=1.84u w=1.22u l=0.5u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__fillcap_16 VDD VSS VNW VPW
X0 VDD a_572_375# a_484_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X1 a_572_375# a_484_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X2 a_124_375# a_36_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X3 a_1468_375# a_1380_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
X4 VDD a_1020_375# a_932_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X5 VDD a_1468_375# a_1380_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X6 VDD a_124_375# a_36_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.5368p ps=3.32u w=1.22u l=1u
X7 a_1020_375# a_932_472# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.3608p ps=2.52u w=0.82u l=1u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__nor2_4 VDD VSS ZN A1 A2 VNW VPW
X0 a_1140_472# A2 VDD VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.4392p ps=1.94u w=1.22u l=0.5u
X1 ZN A1 VSS VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.1469p ps=1.085u w=0.565u l=0.6u
X2 ZN A1 a_1140_472# VNW pfet_05v0 ad=0.4392p pd=1.94u as=0.3172p ps=1.74u w=1.22u l=0.5u
X3 ZN A2 VSS VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.2486p ps=2.01u w=0.565u l=0.6u
X4 a_1588_472# A1 ZN VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.4392p ps=1.94u w=1.22u l=0.5u
X5 VDD A2 a_1588_472# VNW pfet_05v0 ad=0.5978p pd=3.42u as=0.3172p ps=1.74u w=1.22u l=0.5u
X6 ZN A1 VSS VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.1469p ps=1.085u w=0.565u l=0.6u
X7 a_244_472# A2 VDD VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.5978p ps=3.42u w=1.22u l=0.5u
X8 ZN A1 a_244_472# VNW pfet_05v0 ad=0.4392p pd=1.94u as=0.3172p ps=1.74u w=1.22u l=0.5u
X9 a_692_472# A1 ZN VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.4392p ps=1.94u w=1.22u l=0.5u
X10 VSS A2 ZN VPW nfet_05v0 ad=0.2486p pd=2.01u as=0.1469p ps=1.085u w=0.565u l=0.6u
X11 VDD A2 a_692_472# VNW pfet_05v0 ad=0.4392p pd=1.94u as=0.3172p ps=1.74u w=1.22u l=0.5u
X12 VSS A1 ZN VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.1469p ps=1.085u w=0.565u l=0.6u
X13 VSS A2 ZN VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.1469p ps=1.085u w=0.565u l=0.6u
X14 VSS A1 ZN VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.1469p ps=1.085u w=0.565u l=0.6u
X15 ZN A2 VSS VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.1469p ps=1.085u w=0.565u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__and2_1 VDD VSS Z A1 A2 VNW VPW
X0 VDD A2 a_36_159# VNW pfet_05v0 ad=0.40575p pd=2.055u as=0.156p ps=1.12u w=0.6u l=0.5u
X1 Z a_36_159# VDD VNW pfet_05v0 ad=0.5346p pd=3.31u as=0.40575p ps=2.055u w=1.215u l=0.5u
X2 Z a_36_159# VSS VPW nfet_05v0 ad=0.3586p pd=2.51u as=0.23405p ps=1.555u w=0.815u l=0.6u
X3 VSS A2 a_244_159# VPW nfet_05v0 ad=0.23405p pd=1.555u as=58.39999f ps=0.685u w=0.365u l=0.6u
X4 a_244_159# A1 a_36_159# VPW nfet_05v0 ad=58.39999f pd=0.685u as=0.1606p ps=1.61u w=0.365u l=0.6u
X5 a_36_159# A1 VDD VNW pfet_05v0 ad=0.156p pd=1.12u as=0.264p ps=2.08u w=0.6u l=0.5u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__xor2_1 VDD VSS Z A1 A2 VNW VPW
X0 a_728_472# a_56_604# VDD VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.4005p ps=2.12u w=1.22u l=0.5u
X1 Z A1 a_728_472# VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.3172p ps=1.74u w=1.22u l=0.5u
X2 VSS A1 a_56_604# VPW nfet_05v0 ad=0.218p pd=1.52u as=93.59999f ps=0.88u w=0.36u l=0.6u
X3 a_728_472# A2 Z VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.3172p ps=1.74u w=1.22u l=0.5u
X4 Z a_56_604# VSS VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.218p ps=1.52u w=0.82u l=0.6u
X5 VSS A2 a_952_68# VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.1312p ps=1.14u w=0.82u l=0.6u
X6 a_244_604# A2 a_56_604# VNW pfet_05v0 ad=0.1456p pd=1.08u as=0.2464p ps=2u w=0.56u l=0.5u
X7 a_56_604# A2 VSS VPW nfet_05v0 ad=93.59999f pd=0.88u as=0.1584p ps=1.6u w=0.36u l=0.6u
X8 a_952_68# A1 Z VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.2132p ps=1.34u w=0.82u l=0.6u
X9 VDD A1 a_244_604# VNW pfet_05v0 ad=0.4005p pd=2.12u as=0.1456p ps=1.08u w=0.56u l=0.5u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__nor2_1 VDD VSS ZN A1 A2 VNW VPW
X0 ZN A1 a_224_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.4087p ps=1.89u w=1.22u l=0.5u
X1 VSS A1 ZN VPW nfet_05v0 ad=0.2486p pd=2.01u as=0.1469p ps=1.085u w=0.565u l=0.6u
X2 a_224_472# A2 VDD VNW pfet_05v0 ad=0.4087p pd=1.89u as=0.5368p ps=3.32u w=1.22u l=0.5u
X3 ZN A2 VSS VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.2486p ps=2.01u w=0.565u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__nand3_1 A3 VDD VSS ZN A1 A2 VNW VPW
X0 ZN A1 a_455_68# VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.1722p ps=1.24u w=0.82u l=0.6u
X1 ZN A3 VDD VNW pfet_05v0 ad=0.2561p pd=1.505u as=0.4334p ps=2.85u w=0.985u l=0.5u
X2 VDD A2 ZN VNW pfet_05v0 ad=0.2561p pd=1.505u as=0.2561p ps=1.505u w=0.985u l=0.5u
X3 ZN A1 VDD VNW pfet_05v0 ad=0.4334p pd=2.85u as=0.2561p ps=1.505u w=0.985u l=0.5u
X4 a_271_68# A3 VSS VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.3608p ps=2.52u w=0.82u l=0.6u
X5 a_455_68# A2 a_271_68# VPW nfet_05v0 ad=0.1722p pd=1.24u as=0.1312p ps=1.14u w=0.82u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__buf_4 Z I VDD VSS VNW VPW
X0 Z a_224_472# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X1 Z a_224_472# VSS VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.2132p ps=1.34u w=0.82u l=0.6u
X2 VDD a_224_472# Z VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.3782p ps=1.84u w=1.22u l=0.5u
X3 a_224_472# I VSS VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.3608p ps=2.52u w=0.82u l=0.6u
X4 VDD I a_224_472# VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X5 Z a_224_472# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X6 VDD a_224_472# Z VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X7 VSS a_224_472# Z VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.2132p ps=1.34u w=0.82u l=0.6u
X8 VSS a_224_472# Z VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.2132p ps=1.34u w=0.82u l=0.6u
X9 a_224_472# I VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.5368p ps=3.32u w=1.22u l=0.5u
X10 VSS I a_224_472# VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.2132p ps=1.34u w=0.82u l=0.6u
X11 Z a_224_472# VSS VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.2132p ps=1.34u w=0.82u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__nor2_2 VDD VSS ZN A1 A2 VNW VPW
X0 a_672_472# A1 ZN VNW pfet_05v0 ad=0.4087p pd=1.89u as=0.3477p ps=1.79u w=1.22u l=0.5u
X1 ZN A1 VSS VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.1469p ps=1.085u w=0.565u l=0.6u
X2 ZN A1 a_234_472# VNW pfet_05v0 ad=0.3477p pd=1.79u as=0.3782p ps=1.84u w=1.22u l=0.5u
X3 VSS A1 ZN VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.1469p ps=1.085u w=0.565u l=0.6u
X4 a_234_472# A2 VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.5368p ps=3.32u w=1.22u l=0.5u
X5 VDD A2 a_672_472# VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.4087p ps=1.89u w=1.22u l=0.5u
X6 VSS A2 ZN VPW nfet_05v0 ad=0.2486p pd=2.01u as=0.1469p ps=1.085u w=0.565u l=0.6u
X7 ZN A2 VSS VPW nfet_05v0 ad=0.1469p pd=1.085u as=0.2486p ps=2.01u w=0.565u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__mux2_2 S VDD VSS Z I0 I1 VNW VPW
X0 a_1152_472# S a_124_24# VNW pfet_05v0 ad=0.1464p pd=1.46u as=0.3172p ps=1.74u w=1.22u l=0.5u
X1 a_692_68# I1 VSS VPW nfet_05v0 ad=98.39999f pd=1.06u as=0.2132p ps=1.34u w=0.82u l=0.6u
X2 a_124_24# S a_692_68# VPW nfet_05v0 ad=0.2132p pd=1.34u as=98.39999f ps=1.06u w=0.82u l=0.6u
X3 Z a_124_24# VSS VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.3608p ps=2.52u w=0.82u l=0.6u
X4 a_848_380# S VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.2132p ps=1.34u w=0.82u l=0.6u
X5 VDD a_124_24# Z VNW pfet_05v0 ad=0.4392p pd=1.94u as=0.3477p ps=1.79u w=1.22u l=0.5u
X6 VDD I0 a_1152_472# VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.1464p ps=1.46u w=1.22u l=0.5u
X7 a_692_472# I1 VDD VNW pfet_05v0 ad=0.4758p pd=2u as=0.4392p ps=1.94u w=1.22u l=0.5u
X8 a_848_380# S VDD VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.3172p ps=1.74u w=1.22u l=0.5u
X9 Z a_124_24# VDD VNW pfet_05v0 ad=0.3477p pd=1.79u as=0.5368p ps=3.32u w=1.22u l=0.5u
X10 VSS I0 a_1084_68# VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.1968p ps=1.3u w=0.82u l=0.6u
X11 a_1084_68# a_848_380# a_124_24# VPW nfet_05v0 ad=0.1968p pd=1.3u as=0.2132p ps=1.34u w=0.82u l=0.6u
X12 VSS a_124_24# Z VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.2132p ps=1.34u w=0.82u l=0.6u
X13 a_124_24# a_848_380# a_692_472# VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.4758p ps=2u w=1.22u l=0.5u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__nand2_1 VDD VSS ZN A1 A2 VNW VPW
X0 ZN A2 VDD VNW pfet_05v0 ad=0.2938p pd=1.65u as=0.4972p ps=3.14u w=1.13u l=0.5u
X1 ZN A1 a_245_68# VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.1312p ps=1.14u w=0.82u l=0.6u
X2 VDD A1 ZN VNW pfet_05v0 ad=0.4972p pd=3.14u as=0.2938p ps=1.65u w=1.13u l=0.5u
X3 a_245_68# A2 VSS VPW nfet_05v0 ad=0.1312p pd=1.14u as=0.3608p ps=2.52u w=0.82u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__clkbuf_16 VDD VSS Z I VNW VPW
X0 VSS I a_224_552# VPW nfet_05v0 ad=0.1053p pd=0.925u as=0.1053p ps=0.925u w=0.405u l=0.6u
X1 VSS a_224_552# Z VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X2 a_224_552# I VDD VNW pfet_05v0 ad=0.2542p pd=1.44u as=0.2542p ps=1.44u w=0.82u l=0.5u
X3 Z a_224_552# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X4 Z a_224_552# VSS VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X5 VDD a_224_552# Z VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X6 VDD a_224_552# Z VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X7 Z a_224_552# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X8 a_224_552# I VDD VNW pfet_05v0 ad=0.2542p pd=1.44u as=0.3608p ps=2.52u w=0.82u l=0.5u
X9 VDD a_224_552# Z VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X10 Z a_224_552# VSS VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X11 VSS a_224_552# Z VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X12 VSS a_224_552# Z VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X13 VDD a_224_552# Z VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.3782p ps=1.84u w=1.22u l=0.5u
X14 Z a_224_552# VSS VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X15 VSS I a_224_552# VPW nfet_05v0 ad=0.1053p pd=0.925u as=0.1782p ps=1.69u w=0.405u l=0.6u
X16 a_224_552# I VDD VNW pfet_05v0 ad=0.2542p pd=1.44u as=0.2542p ps=1.44u w=0.82u l=0.5u
X17 a_224_552# I VSS VPW nfet_05v0 ad=0.1053p pd=0.925u as=0.1053p ps=0.925u w=0.405u l=0.6u
X18 VSS a_224_552# Z VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X19 Z a_224_552# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.428p ps=2.02u w=1.22u l=0.5u
X20 VDD I a_224_552# VNW pfet_05v0 ad=0.2542p pd=1.44u as=0.2542p ps=1.44u w=0.82u l=0.5u
X21 Z a_224_552# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X22 Z a_224_552# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X23 VSS I a_224_552# VPW nfet_05v0 ad=0.1053p pd=0.925u as=0.1053p ps=0.925u w=0.405u l=0.6u
X24 VDD a_224_552# Z VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X25 Z a_224_552# VSS VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X26 VSS a_224_552# Z VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X27 VSS a_224_552# Z VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X28 VDD I a_224_552# VNW pfet_05v0 ad=0.428p pd=2.02u as=0.2542p ps=1.44u w=0.82u l=0.5u
X29 Z a_224_552# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X30 a_224_552# I VSS VPW nfet_05v0 ad=0.1782p pd=1.69u as=0.1053p ps=0.925u w=0.405u l=0.6u
X31 Z a_224_552# VSS VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X32 VSS a_224_552# Z VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X33 Z a_224_552# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X34 VSS a_224_552# Z VPW nfet_05v0 ad=0.2134p pd=1.85u as=0.1261p ps=1.005u w=0.485u l=0.6u
X35 VDD I a_224_552# VNW pfet_05v0 ad=0.2542p pd=1.44u as=0.2542p ps=1.44u w=0.82u l=0.5u
X36 VDD a_224_552# Z VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X37 VDD a_224_552# Z VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X38 Z a_224_552# VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X39 a_224_552# I VDD VNW pfet_05v0 ad=0.2542p pd=1.44u as=0.2542p ps=1.44u w=0.82u l=0.5u
X40 a_224_552# I VSS VPW nfet_05v0 ad=0.1053p pd=0.925u as=0.1053p ps=0.925u w=0.405u l=0.6u
X41 Z a_224_552# VSS VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.2134p ps=1.85u w=0.485u l=0.6u
X42 VDD I a_224_552# VNW pfet_05v0 ad=0.2542p pd=1.44u as=0.2542p ps=1.44u w=0.82u l=0.5u
X43 VDD a_224_552# Z VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.3782p ps=1.84u w=1.22u l=0.5u
X44 Z a_224_552# VSS VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
X45 Z a_224_552# VSS VPW nfet_05v0 ad=0.1261p pd=1.005u as=0.1261p ps=1.005u w=0.485u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__buf_1 VSS Z I VDD VNW VPW
X0 Z a_36_160# VSS VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.2344p ps=1.56u w=0.82u l=0.6u
X1 Z a_36_160# VDD VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.35315p ps=1.96u w=1.22u l=0.5u
X2 VDD I a_36_160# VNW pfet_05v0 ad=0.35315p pd=1.96u as=0.2486p ps=2.01u w=0.565u l=0.5u
X3 VSS I a_36_160# VPW nfet_05v0 ad=0.2344p pd=1.56u as=0.1584p ps=1.6u w=0.36u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__xnor2_1 VDD VSS ZN A1 A2 VNW VPW
X0 ZN a_64_93# VDD VNW pfet_05v0 ad=0.31207p pd=1.665u as=0.34437p ps=1.895u w=1.095u l=0.5u
X1 a_272_93# A2 a_64_93# VPW nfet_05v0 ad=57.59999f pd=0.68u as=0.1584p ps=1.6u w=0.36u l=0.6u
X2 VSS A1 a_272_93# VPW nfet_05v0 ad=0.218p pd=1.52u as=57.59999f ps=0.68u w=0.36u l=0.6u
X3 a_716_68# a_64_93# VSS VPW nfet_05v0 ad=0.2132p pd=1.34u as=0.218p ps=1.52u w=0.82u l=0.6u
X4 VDD A2 a_930_497# VNW pfet_05v0 ad=0.4818p pd=3.07u as=0.55297p ps=2.105u w=1.095u l=0.5u
X5 ZN A1 a_716_68# VPW nfet_05v0 ad=0.4161p pd=1.905u as=0.2132p ps=1.34u w=0.82u l=0.6u
X6 a_64_93# A2 VDD VNW pfet_05v0 ad=0.1456p pd=1.08u as=0.2464p ps=2u w=0.56u l=0.5u
X7 a_716_68# A2 ZN VPW nfet_05v0 ad=0.3608p pd=2.52u as=0.4161p ps=1.905u w=0.82u l=0.6u
X8 VDD A1 a_64_93# VNW pfet_05v0 ad=0.34437p pd=1.895u as=0.1456p ps=1.08u w=0.56u l=0.5u
X9 a_930_497# A1 ZN VNW pfet_05v0 ad=0.55297p pd=2.105u as=0.31207p ps=1.665u w=1.095u l=0.5u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__and4_1 A3 A4 VDD VSS Z A1 A2 VNW VPW
X0 a_48_148# A1 VDD VNW pfet_05v0 ad=0.156p pd=1.12u as=0.264p ps=2.08u w=0.6u l=0.5u
X1 a_440_148# A2 a_256_148# VPW nfet_05v0 ad=88.2f pd=0.84u as=67.2f ps=0.74u w=0.42u l=0.6u
X2 Z a_48_148# VSS VPW nfet_05v0 ad=0.3586p pd=2.51u as=0.226p ps=1.515u w=0.815u l=0.6u
X3 VDD A2 a_48_148# VNW pfet_05v0 ad=0.156p pd=1.12u as=0.156p ps=1.12u w=0.6u l=0.5u
X4 Z a_48_148# VDD VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.395p ps=2.02u w=1.22u l=0.5u
X5 a_644_148# A3 a_440_148# VPW nfet_05v0 ad=88.2f pd=0.84u as=88.2f ps=0.84u w=0.42u l=0.6u
X6 a_48_148# A3 VDD VNW pfet_05v0 ad=0.156p pd=1.12u as=0.156p ps=1.12u w=0.6u l=0.5u
X7 VSS A4 a_644_148# VPW nfet_05v0 ad=0.226p pd=1.515u as=88.2f ps=0.84u w=0.42u l=0.6u
X8 VDD A4 a_48_148# VNW pfet_05v0 ad=0.395p pd=2.02u as=0.156p ps=1.12u w=0.6u l=0.5u
X9 a_256_148# A1 a_48_148# VPW nfet_05v0 ad=67.2f pd=0.74u as=0.1848p ps=1.72u w=0.42u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__and4_4 A2 A3 A4 VDD VSS Z A1 VNW VPW
X0 VDD A2 a_227_494# VNW pfet_05v0 ad=0.2886p pd=1.63u as=0.2886p ps=1.63u w=1.11u l=0.5u
X1 a_247_68# A4 VSS VPW nfet_05v0 ad=0.1032p pd=0.965u as=0.2838p ps=2.17u w=0.645u l=0.6u
X2 a_227_494# A3 VDD VNW pfet_05v0 ad=0.2886p pd=1.63u as=0.2886p ps=1.63u w=1.11u l=0.5u
X3 VDD A4 a_227_494# VNW pfet_05v0 ad=0.4105p pd=1.92u as=0.2886p ps=1.63u w=1.11u l=0.5u
X4 a_1451_68# A3 a_1247_68# VPW nfet_05v0 ad=0.13545p pd=1.065u as=0.13545p ps=1.065u w=0.645u l=0.6u
X5 Z a_227_494# VSS VPW nfet_05v0 ad=0.1677p pd=1.165u as=0.1677p ps=1.165u w=0.645u l=0.6u
X6 a_1247_68# A2 a_1063_68# VPW nfet_05v0 ad=0.13545p pd=1.065u as=0.1032p ps=0.965u w=0.645u l=0.6u
X7 a_227_494# A1 a_635_68# VPW nfet_05v0 ad=0.19832p pd=1.26u as=0.1048p ps=0.97u w=0.645u l=0.6u
X8 a_227_494# A4 VDD VNW pfet_05v0 ad=0.2886p pd=1.63u as=0.4884p ps=3.1u w=1.11u l=0.5u
X9 Z a_227_494# VSS VPW nfet_05v0 ad=0.1677p pd=1.165u as=0.1677p ps=1.165u w=0.645u l=0.6u
X10 VDD A3 a_227_494# VNW pfet_05v0 ad=0.2886p pd=1.63u as=0.2886p ps=1.63u w=1.11u l=0.5u
X11 a_1063_68# A1 a_227_494# VPW nfet_05v0 ad=0.1032p pd=0.965u as=0.19832p ps=1.26u w=0.645u l=0.6u
X12 Z a_227_494# VDD VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.4105p ps=1.92u w=1.22u l=0.5u
X13 a_431_68# A3 a_247_68# VPW nfet_05v0 ad=0.13545p pd=1.065u as=0.1032p ps=0.965u w=0.645u l=0.6u
X14 VSS a_227_494# Z VPW nfet_05v0 ad=0.1677p pd=1.165u as=0.1677p ps=1.165u w=0.645u l=0.6u
X15 a_227_494# A2 VDD VNW pfet_05v0 ad=0.2886p pd=1.63u as=0.2886p ps=1.63u w=1.11u l=0.5u
X16 VDD a_227_494# Z VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.3172p ps=1.74u w=1.22u l=0.5u
X17 VSS A4 a_1451_68# VPW nfet_05v0 ad=0.1677p pd=1.165u as=0.13545p ps=1.065u w=0.645u l=0.6u
X18 Z a_227_494# VDD VNW pfet_05v0 ad=0.3172p pd=1.74u as=0.3172p ps=1.74u w=1.22u l=0.5u
X19 VSS a_227_494# Z VPW nfet_05v0 ad=0.2838p pd=2.17u as=0.1677p ps=1.165u w=0.645u l=0.6u
X20 VDD A1 a_227_494# VNW pfet_05v0 ad=0.2886p pd=1.63u as=0.2886p ps=1.63u w=1.11u l=0.5u
X21 a_227_494# A1 VDD VNW pfet_05v0 ad=0.2886p pd=1.63u as=0.2886p ps=1.63u w=1.11u l=0.5u
X22 VDD a_227_494# Z VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.3172p ps=1.74u w=1.22u l=0.5u
X23 a_635_68# A2 a_431_68# VPW nfet_05v0 ad=0.1048p pd=0.97u as=0.13545p ps=1.065u w=0.645u l=0.6u
.ends

.subckt gf180mcu_fd_sc_mcu7t5v0__clkinv_2 VDD VSS I ZN VNW VPW
X0 ZN I VSS VPW nfet_05v0 ad=0.1248p pd=1u as=0.2112p ps=1.84u w=0.48u l=0.6u
X1 VDD I ZN VNW pfet_05v0 ad=0.5368p pd=3.32u as=0.3782p ps=1.84u w=1.22u l=0.5u
X2 ZN I VDD VNW pfet_05v0 ad=0.3782p pd=1.84u as=0.5368p ps=3.32u w=1.22u l=0.5u
X3 VSS I ZN VPW nfet_05v0 ad=0.2112p pd=1.84u as=0.1248p ps=1u w=0.48u l=0.6u
.ends

.subckt counter_top counter_value_o[0] counter_value_o[1] counter_value_o[2] counter_value_o[3]
+ counter_value_o[4] counter_value_o[5] counter_value_o[6] counter_value_o[7] clock_i
+ enable_i reset_n_i VDD VSS
XFILLER_10_317 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_6_107 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_12_98 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_66_ VDD _66_/Q _73_/CLK VSS _66_/D VDD VSS gf180mcu_fd_sc_mcu7t5v0__dffq_1
XFILLER_0_24 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
X_49_ _72_/Q _34_/Z VDD VSS _50_/S _66_/Q _73_/Q VDD VSS gf180mcu_fd_sc_mcu7t5v0__nand4_4
XFILLER_16_301 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_3_282 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_16_197 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
Xoutput7 VSS counter_value_o[4] _73_/Q VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_2
XFILLER_16_153 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_0_274 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_8_171 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_2_325 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_12_66 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
X_65_ VDD VSS _71_/D _65_/A1 _64_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__nor2_4
XFILLER_3_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_2_177 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_0_36 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_9_56 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
X_48_ VDD VSS _48_/Z _67_/Q _33_/I VDD VSS gf180mcu_fd_sc_mcu7t5v0__and2_1
Xoutput10 VSS counter_value_o[7] _68_/Q VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_2
Xoutput8 VSS counter_value_o[5] _66_/Q VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_2
XFILLER_5_142 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
X_64_ VDD VSS _64_/Z _71_/Q _64_/A2 VDD VSS gf180mcu_fd_sc_mcu7t5v0__xor2_1
XFILLER_15_219 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_2_101 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_14_230 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_47_ VDD VSS _50_/I0 _67_/Q _65_/A1 VDD VSS gf180mcu_fd_sc_mcu7t5v0__nor2_1
Xoutput9 VSS counter_value_o[6] _67_/Q VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_2
XFILLER_11_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_12_24 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
X_63_ _69_/Q VDD VSS _64_/A2 _63_/A1 _70_/Q VDD VSS gf180mcu_fd_sc_mcu7t5v0__nand3_1
X_46_ _66_/D _46_/I VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_4
XFILLER_14_253 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_11_212 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_11_245 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_6_37 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_15_35 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_16_112 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_8_311 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_5_314 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_10_107 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_2_317 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
X_62_ VDD VSS _70_/D _65_/A1 _61_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__nor2_2
X_45_ _45_/S VDD VSS _46_/I _45_/I0 _43_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__mux2_2
XFILLER_1_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_7_206 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_16_316 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_61_ VDD VSS _61_/Z _70_/Q _61_/A2 VDD VSS gf180mcu_fd_sc_mcu7t5v0__xor2_1
X_44_ _34_/Z VDD VSS _45_/S _73_/Q _72_/Q VDD VSS gf180mcu_fd_sc_mcu7t5v0__nand3_1
XFILLER_1_72 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_3_276 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_12_183 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
X_60_ VDD VSS _61_/A2 _63_/A1 _69_/Q VDD VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
XFILLER_14_289 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_9_282 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
X_43_ VDD VSS _43_/Z _66_/Q _33_/I VDD VSS gf180mcu_fd_sc_mcu7t5v0__and2_1
XFILLER_6_241 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_8_325 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_15_192 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_7_72 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_16_70 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_8_177 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_5_136 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_42_ VDD VSS _45_/I0 _66_/Q _65_/A1 VDD VSS gf180mcu_fd_sc_mcu7t5v0__nor2_1
XFILLER_16_308 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_3_212 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_16_138 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_12_311 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_8_101 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_2_107 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
X_41_ _73_/D _41_/I VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_4
XFILLER_16_128 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_15_150 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_4_171 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_40_ _40_/S VDD VSS _41_/I _40_/I0 _38_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__mux2_2
XFILLER_0_206 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_8_317 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_15_184 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_1_142 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_13_282 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_1_66 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_12_325 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
Xclkbuf_1_1__f_clock_i VDD VSS _73_/CLK clkbuf_0_clock_i/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__clkbuf_16
XFILLER_16_52 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_12_199 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_8_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_9_276 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_10_297 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_15_142 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_7_66 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_4_311 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_1_314 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_13_21 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_13_65 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_13_262 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_6_247 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_10_265 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_3_206 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
Xinput1 VSS _63_/A1 enable_i VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_1
XFILLER_16_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_16_21 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_9_212 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
Xinput2 VSS _33_/I reset_n_i VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_1
XFILLER_15_314 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_12_317 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_8_107 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_12_169 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
Xclkbuf_1_0__f_clock_i VDD VSS _72_/CLK clkbuf_0_clock_i/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__clkbuf_16
XFILLER_6_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_5_282 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_2_241 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_4_325 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_16_240 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_4_177 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_4_37 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_1_136 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_7_142 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_11_193 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_14_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_16_285 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_4_101 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_10_247 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_10_37 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
X_59_ VDD VSS _69_/D _65_/A1 _59_/A2 VDD VSS gf180mcu_fd_sc_mcu7t5v0__nor2_2
XFILLER_15_136 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_16_36 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_12_139 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_13_37 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_4_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
X_58_ VDD VSS _59_/A2 _63_/A1 _69_/Q VDD VSS gf180mcu_fd_sc_mcu7t5v0__xnor2_1
XFILLER_7_314 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_4_317 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_12_107 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_13_49 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_0_172 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_5_72 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
X_57_ _68_/D _57_/I VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_4
XFILLER_14_182 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_16_222 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_12_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_10_206 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
X_73_ VDD _73_/Q _73_/CLK VSS _73_/D VDD VSS gf180mcu_fd_sc_mcu7t5v0__dffq_1
XFILLER_5_276 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_56_ _56_/S VDD VSS _57_/I _56_/I0 _53_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__mux2_2
XFILLER_11_50 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_11_72 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_15_117 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_39_ VDD VSS _40_/S _72_/Q _34_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
XFILLER_11_142 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_8_241 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_72_ VDD _72_/Q _72_/CLK VSS _72_/D VDD VSS gf180mcu_fd_sc_mcu7t5v0__dffq_1
XFILLER_2_247 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
X_55_ VDD VSS _56_/S _34_/Z _54_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__nand2_1
XFILLER_2_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_16_29 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_38_ VDD VSS _38_/Z _73_/Q _33_/I VDD VSS gf180mcu_fd_sc_mcu7t5v0__and2_1
XFILLER_7_136 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_5_212 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
X_71_ VDD _71_/Q _72_/CLK VSS _71_/D VDD VSS gf180mcu_fd_sc_mcu7t5v0__dffq_1
X_54_ _73_/Q _72_/Q VDD VSS _54_/Z _67_/Q _66_/Q VDD VSS gf180mcu_fd_sc_mcu7t5v0__and4_1
XFILLER_11_314 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
X_37_ VDD VSS _40_/I0 _73_/Q _65_/A1 VDD VSS gf180mcu_fd_sc_mcu7t5v0__nor2_1
XFILLER_11_177 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_4_107 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_0_324 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_10_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
X_70_ VDD _70_/Q _72_/CLK VSS _70_/D VDD VSS gf180mcu_fd_sc_mcu7t5v0__dffq_1
XFILLER_1_282 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
X_53_ VDD VSS _53_/Z _68_/Q _33_/I VDD VSS gf180mcu_fd_sc_mcu7t5v0__and2_1
XFILLER_14_142 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
X_36_ VDD VSS _72_/D _65_/A1 _36_/A2 VDD VSS gf180mcu_fd_sc_mcu7t5v0__nor2_4
XFILLER_11_112 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_6_171 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_15_270 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_5_66 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_52_ VDD VSS _56_/I0 _68_/Q _65_/A1 VDD VSS gf180mcu_fd_sc_mcu7t5v0__nor2_1
X_35_ VDD VSS _36_/A2 _72_/Q _34_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__xnor2_1
XFILLER_3_142 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_15_282 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_14_21 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_14_54 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_14_325 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_51_ _67_/D _51_/I VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_4
XFILLER_11_66 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_34_ _63_/A1 _70_/Q _69_/Q VDD VSS _34_/Z _71_/Q VDD VSS gf180mcu_fd_sc_mcu7t5v0__and4_4
XFILLER_11_136 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_11_158 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_16_206 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
X_50_ _50_/S VDD VSS _51_/I _50_/I0 _48_/Z VDD VSS gf180mcu_fd_sc_mcu7t5v0__mux2_2
XFILLER_11_34 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_6_311 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_33_ VDD VSS _33_/I _65_/A1 VDD VSS gf180mcu_fd_sc_mcu7t5v0__clkinv_2
XFILLER_14_101 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_3_314 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_8_247 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_5_206 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_14_305 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_2_37 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_10_171 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_0_70 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_0_104 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_12_211 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_1_276 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_14_317 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_11_128 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_8_37 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_0_308 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_0_138 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_7_282 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_4_241 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_6_325 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_13_192 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_9_174 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_6_177 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_3_136 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_14_37 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_1_212 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_3_72 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_9_142 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_0_8 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_6_101 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_12_247 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_7_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_2_171 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_9_72 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_9_314 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_6_317 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_14_107 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_15_235 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_9_40 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_11_282 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_14_29 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_15_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
Xoutput3 VSS counter_value_o[0] _69_/Q VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_2
XFILLER_10_325 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_69_ VDD _69_/Q _72_/CLK VSS _69_/D VDD VSS gf180mcu_fd_sc_mcu7t5v0__dffq_1
XFILLER_7_276 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_9_8 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
Xoutput4 VSS counter_value_o[1] _70_/Q VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_2
XFILLER_15_51 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
XFILLER_16_172 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_2_311 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_10_101 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_5_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
X_68_ VDD _68_/Q _73_/CLK VSS _68_/D VDD VSS gf180mcu_fd_sc_mcu7t5v0__dffq_1
XFILLER_9_64 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_4_247 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_1_206 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
Xclkbuf_0_clock_i VDD VSS clkbuf_0_clock_i/Z clock_i VDD VSS gf180mcu_fd_sc_mcu7t5v0__clkbuf_16
Xoutput5 VSS counter_value_o[2] _71_/Q VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_2
XFILLER_15_85 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
XFILLER_3_66 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
XFILLER_9_136 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_4
X_67_ VDD _67_/Q _73_/CLK VSS _67_/D VDD VSS gf180mcu_fd_sc_mcu7t5v0__dffq_1
XFILLER_7_212 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_64
XFILLER_13_2 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_8
Xoutput6 VSS counter_value_o[3] _72_/Q VDD VDD VSS gf180mcu_fd_sc_mcu7t5v0__buf_2
XFILLER_13_314 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_16
XFILLER_0_240 VDD VSS VDD VSS gf180mcu_fd_sc_mcu7t5v0__fillcap_32
.ends

.subckt slot_1 analog_bus0 dig_in[0] dig_out[0] vdd_3v3 dig_out[1] analog_bus1 vdd_5v0 dig_in[1] dig_out[2] vss_3v3 dig_in[2] analog_bus2 vss_5v0 analog_bus3 dig_in[3] dig_out[3] dig_out[4] dig_in[4] s1_an[0] dig_in[5] s1_an[1] dig_out[5] ibias0 dig_in[6] dig_out[6] ibias1 dig_in[7] dig_out[7] vbias dig_in[8] dig_out[8] dig_out[9] dig_in[9] dig_in[10] dig_out[10] dig_in[11] dig_out[11] dig_in[12] dig_in[13] dig_in[14] dig_in[15] dig_in[16] dig_in[17] dig_in[18] dig_in[19] dig_in[20] dig_in[21] dig_in[22] dig_in[23] enable reset clk
Xinverter_0 analog_bus0 vdd_3v3 s1_an[0] vss_3v3 inverter
Xcounter_top_0 dig_out[0] dig_out[1] dig_out[2] dig_out[3] dig_out[4] dig_out[5] dig_out[6]
+ dig_out[7] clk enable reset vdd_3v3 vss_3v3 counter_top
.ends

