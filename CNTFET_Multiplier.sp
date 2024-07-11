*************************************************
***************************************************
*For optimal accuracy, convergence, and runtime
***************************************************
.options POST
.options AUTOSTOP
.options INGOLD=2     DCON=1
.options GSHUNT=1e-12 RMIN=1e-15
.options ABSTOL=1e-5  ABSVDC=1e-4
.options RELTOL=1e-2  RELVDC=1e-2
.options NUMDGT=4     PIVOT=13

.param   TEMP=27
***************************************************


***************************************************
*Include relevant model files
***************************************************
.lib 'CNFET.lib' CNFET
***************************************************
*Some CNFET parameters:


.param Ccsd=0      CoupleRatio=0
.param m_cnt=1     Efo=0.6
.param Wg=0        Cb=40e-12
.param Lg=32e-9    Lgef=100e-9
.param Vfn=0       Vfp=0
.param m=19       n=0
.param ma=10     na=0
.param Hox=4e-9    Kox=16

***********************************************************************
* Define out supply
***********************************************************************


*Vdd     1     0     0.9



***********************************************************************
* Main Circuits
***********************************************************************
.option post=2
X1 An A Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

X2 An A VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X3 Ap A Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X4 Ap A VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3

X5 Bn B Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

X6 Bn B VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X7 Bp B Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X8 Bp B VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3

X9  B1 B Bp Bp NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

X10 B1 Bn Bp Bp  PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X11 B1 Bn Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X12 B12 B1 Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X13 B12 B1 VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X14 J A VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3

X15 A2 An J J PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X16 A2 An Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X17 A2 Ap V12 V12 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X18 product B1 A A NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X19 product B12 A A PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X20 product B A2 A2 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X21 product Bp A2 A2 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X22 product Bn Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X23 2 Bp V12 V12 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3

X24 carry Ap 2 2 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3

X25 GND Bp carry carry NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X26 GND Ap carry carry PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3




VVoltageSource_1 VDD Gnd  DC 0.9
VVoltageSource_2 V12 Gnd  DC 0.45

VVoltageSource_9 A Gnd PWL(0n 0 1n 0 1.1n 0.45 2n 0.45 2.1n 0.9 3n 0.9 3.1n 0 4n 0 4.1n 0.45 5n 0.45 5.1n 0.9 6n 0.9 6.1n 0 7n 0 7.1n 0.45 8n 0.45 8.1n 0.9)
VVoltageSource_8 B Gnd PWL(0n 0 3n 0 3.1n 0.45 6n 0.45 6.1n 0.9 9n 0.9 )


.tran 1n 9n

.option post=2
.end




