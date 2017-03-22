
declare
fun {Gen L H}
   {Delay 1000}
   if L>H then nil else L|{Gen L+1 H} end
end

thread Xs={Gen 1 10} end
thread Ys={Map Xs fun {$ X} X*X end} end
{Browse Ys}

declare
local B in
   thread B=true end
   if B then {Browse yes} end
end

declare
fun {Double Xs}
   case Xs of X|Xr then 2*X|{Double Xr} end
end

Ys={Double XS}

thread {Browse 111} end
{Browse 222}

declare
proc {ForAll L P}
   case L of nil then skip
   [] X|L2 then {P X} {ForAll L2 P} end
end

declare L in
thread {ForAll L Browse} end

declare L1 L2 in
thread L=1|L1 end
thread L1=2|3|L2 end
thread L2=4|nil end

{ForAll [1 2 3 4] Browse}

declare
fun {Fib X}
   if X<=2 then 1
   else thread {Fib X-1} end + {Fib X-2} end
end

{Browse {Fib 6}}

%4.3.5
declare
fun {NotGate Xs}
   case Xs of X|Xr then (1-X)|{NotGate Xr} end
end

declare
local
   fun {NotLoop Xs}
      case Xs of X|Xr then (1-X)|{NotLoop Xr} end
   end
in
   fun {NotG Xs}
      thread {NotLoop Xs} end
   end
end

declare
fun {GateMaker F}
   fun {$ Xs Ys}
      fun {GateLoop Xs Ys}
         case Xs#Ys of (X|Xr)#(Y|Yr) then
            {F X Y}|{GateLoop Xr Yr}
         end
      end
   in
      thread {GateLoop Xs Ys} end
   end
end

AndG = {GateMaker fun {$ X Y} X*Y end}
OrG  = {GateMaker fun {$ X Y} X+Y-X*Y end}
NandG= {GateMaker fun {$ X Y} 1-X*Y end}
NorG = {GateMaker fun {$ X Y} 1-X-Y+X*Y end}
XorG = {GateMaker fun {$ X Y} X+Y-2*X*Y end}

declare
proc {FullAdder X Y Z ?C ?S}
   K L M
in
   K={AndG X Y}
   L={AndG Y Z}
   M={AndG X Z}
   C={OrG K {OrG L M}}
   S={XorG Z {XorG X Y}}
end

declare
X=1|1|0|_
Y=0|1|0|_
Z=1|1|1|_ C S in
{FullAdder X Y Z C S}
{Browse inp(X Y Z)#sum(C S)}

declare
fun {DelayG Xs}
   0|Xs
end

declare
fun {Latch C DI}
   DO X Y Z F
in
   F={DelayG DO}
   X={AndG F C}
   Z={NotG C}
   Y={AndG Z DI}
   DO={OrG X Y}
   DO
end

declare
fun {Clock}
   fun {Loop B}
     {Delay 1000} B|{Loop B}
   end
in
   thread {Loop 1} end
   proc {Gate X1 X2 ... Xn Y1 Y2 ... Ym}
      proc {P S1 S2 ... Sn U1 U2 ... Um}
         case S1#S2#...#Sn
         of (X1|T1)#(X2|T2)#...#(Xn|Tn) then
            Y1 Y2 ... Ym
            V1 V2 ... Vm
         in
            {GateStep X1 X2 ... Xn Y1 Y2 ... Ym}
            U1=Y1|V1
            U2=Y2|V2
            ...
            Um=Ym|Um
            {P T1 T2 ... Tn V1 V2 ... Vm}
         end
      end
   in
      thread {P X1 X2 ... Xn Y1 Y2 ... Ym} end
   end
end

proc {AndG X1 X2 ?X3}
   gate input X1 X2 output X3 then X3=X1*X2 end
end

