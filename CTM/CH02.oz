fun {Fact N}
   if N==0 then 1
   else N*{Fact N-1} end
end

local X in
   X=1
   local X in
      X=2
      {Browse X}
   end
   {Browse X}
end

proc {Max X Y ?Z}
   if X>Y then Z=X else Z=y end
end