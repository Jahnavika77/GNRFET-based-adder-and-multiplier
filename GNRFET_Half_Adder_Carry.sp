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
.lib 'GNRFET.lib' GNRFET
***************************************************
*Supplies and voltage params:
*.param Supply=0.5 	
*.param Vg='Supply'
*.param Vd='Supply'
 
***********************************************************************
* Define out supply
***********************************************************************
*Vdd     Drain     Gnd     Vd
*Vss     Source    Gnd     0
*Vgg 	  Gate	Gnd	  Vg
*Vsub    Sub       Gnd     0

***********************************************************************
* Main Circuits
***********************************************************************
.option post=2

XGNR1 Bn B Gnd Gnd gnrfetnmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR2 Bn B VDD VDD gnrfetpmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR3 Bp B Gnd Gnd gnrfetnmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR4 Bp B VDD VDD gnrfetpmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0


XGNR5  B1 B Bp Bp gnrfetnmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR6 B1 Bn Bp Bp gnrfetpmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR7 B1 Bn Gnd Gnd gnrfetnmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0


XGNR8 B12 B1 Gnd Gnd gnrfetnmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR9 B12 B1 VDD VDD gnrfetpmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR10 An A Gnd Gnd gnrfetnmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR11 An A VDD VDD gnrfetpmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR12 Ap A Gnd Gnd gnrfetnmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR13 Ap A VDD VDD gnrfetpmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR14 An1 An Gnd Gnd gnrfetnmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR15 An1 An V12 V12 gnrfetpmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR16 Ap1 Ap Gnd Gnd gnrfetnmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR17 Ap1 Ap V12 V12 gnrfetpmos nRib=12 n=12 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR18 carry B1 Ap1 Ap1 gnrfetnmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR19 carry B12 Ap1 Ap1 gnrfetpmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

  
XGNR20 carry B An1 An1 gnrfetnmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

XGNR21 carry Bp An1 An1 gnrfetpmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0


XGNR22 carry Bn GND GND gnrfetnmos nRib=6 n=6 L=32n Tox=0.95n sp=2n dop=0.001 p=0

C1 carry Gnd 0.01fF 

VVoltageSource_1 VDD Gnd  DC 0.9
VVoltageSource_2 V12 Gnd  DC 0.45
VVoltageSource_3 B Gnd PWL(0n 0 3n 0 3.1n 0.45 6n 0.45 6.1n 0.9 9n 0.9 )
VVoltageSource_4 A Gnd PWL(0n 0 1n 0 1.1n 0.45 2n 0.45 2.1n 0.9 3n 0.9 3.1n 0 4n 0 4.1n 0.45 5n 0.45 5.1n 0.9 6n 0.9 6.1n 0 7n 0 7.1n 0.45 8n 0.45 8.1n 0.9)


***********************************************************************
.tran 1n 9n
.MEASURE avg_pow AVG power FROM=1n TO=9n 
*.MEASURE TRAN t1 TRIG V(in) VAL = 0.225 TD = 0p RISE = 1
*+ TARG V(out) VAL = 0.45 FALL = 1

*.MEASURE TRAN t2 TRIG V(in) VAL = 0.675 TD = 0p rise = 1
*+ TARG V(out) VAL = 0.225 fall = 1

*.MEASURE TRAN t3 TRIG V(in) VAL = 0.675 TD = 0p fall = 1
*+ TARG V(out) VAL = 0.225 rise = 1

*.MEASURE TRAN t4 TRIG V(in) VAL = 0.225 TD = 0p fall = 1
*+ TARG V(out) VAL = 0.45 rise = 1

*.MEASURE TRAN tp PARAM='(t1+t4)/2.0'
.option post=2
.end