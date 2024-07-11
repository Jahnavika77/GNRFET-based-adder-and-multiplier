jahnavika1
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

*NTI
.subckt NTI A An
X1 An A Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

X2 An A VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3
VVoltageSource_1 VDD Gnd  DC 0.9
.ends

*PTI
.subckt PTI A Ap
X3 Ap A Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X4 Ap A VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3
VVoltageSource_2 VDD Gnd  DC 0.9
.ends

.subckt STI inp out
X5 out inp Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X6 out inp V12 V12 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3
VVoltageSource_3 VDD Gnd  DC 0.9
VVoltageSource_4 V12 Gnd  DC 0.45
.ends


.subckt inverter B1 B12
X9 B12 B1 Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X10 B12 B1 VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3
VVoltageSource_5 VDD Gnd  DC 0.9
.ends

.subckt main B B1 B12
*NTI
.subckt NTI A An
XT1 An A Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

XT2 An A VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3
VVoltageSource_1 VDD Gnd  DC 0.9
.ends
*PTI
.subckt PTI A Ap
XT3 Ap A Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

XT4 Ap A VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3
VVoltageSource_1 VDD Gnd  DC 0.9
.ends

.subckt STI inp out
XT5 out inp Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

XT6 out inp V12 V12 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3
VVoltageSource_1 VDD Gnd  DC 0.9
VVoltageSource_2 V12 Gnd  DC 0.45
.ends

.subckt trans Bp B1 Bn 
XT7 Bp B B1 B1 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

X8 Bp Bn  B1 B1  PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3

X9 B1 Bn Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

.ends

.subckt inverter B1 B12
XT10 B12 B1 Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

XT11 B12 B1 VDD VDD PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=10  n2=0  tubes=3
VVoltageSource_1 VDD Gnd  DC 0.9
.ends

X10 B Bn NTI
X11 B Bp PTI
X12 Bp B1 Bn trans
X13 B1 B12 inverter

.ends

.subckt trans1 Ap1 B1 B12 carry
X7 carry B1 Ap1 Ap1 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X8 carry B12 Ap1 Ap1 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3

.ends


.subckt trans2 An1 Bp B carry
X11 carry B An1 An1 NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3

X12 carry Bp An1 An1 PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=1  Pitch=20e-9  n1=19  n2=0  tubes=3
.ends

.subckt gate Bn carry
X7 carry Bn Gnd Gnd NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9
+ Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=1  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=3
.ends


X1 A An NTI
X2 An An1 STI
X3 A Ap PTI
X4 Ap Ap1 STI
X9 B Bp PTI
X10 B B1 B12 main 
X5 Ap1 B1 B12 carry trans1
X6 An1 Bp B carry trans2
X8 B Bn NTI
X7 Bn carry gate


C1 B1 Gnd 0.95fF 
C2 B12 Gnd 0.95fF
C3 carry Gnd 0.95fF
VVoltageSource_8 B Gnd PWL(0n 0 3n 0 3.1n 0.45 6n 0.45 6.1n 0.9 9n 0.9 )
VVoltageSource_9 A Gnd PWL(0n 0 1n 0 1.1n 0.45 2n 0.45 2.1n 0.9 3n 0.9 3.1n 0 4n 0 4.1n 0.45 5n 0.45 5.1n 0.9 6n 0.9 6.1n 0 7n 0 7.1n 0.45 8n 0.45 8.1n 0.9)

***********************************************************************
.tran 1n 9n

.MEASURE avg_pow AVG power FROM=1n TO=9n

*.MEASURE TRAN t1 TRIG V(A) VAL = 0.225 TD = 0p RISE = 1
*+ TARG V(out) VAL = 0.675 FALL = 1

.MEASURE TRAN t2 TRIG V(A) VAL = 0.675 TD = 0p rise = 1
+ TARG V(out) VAL = 0.45 fall = 1

.MEASURE TRAN t3 TRIG V(A) VAL = 0.675 TD = 0p fall = 1
+ TARG V(out) VAL = 0.45 rise = 1

*.MEASURE TRAN t4 TRIG V(A) VAL = 0.225 TD = 0p fall = 1
*+ TARG V(out) VAL = 0.675 rise = 1

.MEASURE TRAN tp PARAM='(t2+t3)/2.0'


*.OPTION PROBE POST MEASOUT
.option post=2
.end

***********************************************************************
***********************************************************************