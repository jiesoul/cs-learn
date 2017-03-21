
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