{Browse 9999*9999}

declare
V=9999*9999
{Browse V*V}

{Browse 1*2*3*4*5*6*7*8*9*10}

declare
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end

{Browse {Fact 10}}

declare
fun {Comb N R}
   {Fact N} div ({Fact R}*{Fact N-R})
end

{Comb 10 3}