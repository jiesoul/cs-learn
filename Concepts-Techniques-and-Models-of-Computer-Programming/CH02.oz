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

local
   tree(key:A left:B right:C value:D)=T
in
   <statement>
end

;上面的转换到下面

local A B C D in
   {Label T}=tree
   A=T.key
   B=T.left
   C=T.right
   D=T.value
   <statement>
end

declare
fun {Eval E}
   if {IsNumber E} then E
   else
      case E
      of plus(X Y) then {Eval X}+{Eval Y}
      [] times(X Y) then {Eval X}*{Eval Y}
      else raise illFormExpr(E) end
      end
   end
end

local X Y Z in
   f(X b)=f(a Y)
   f(Z a)=Z
   {Browse [X Y Z]}
end

declare X Y Z in
a(X c(Z) Z)=a(b(Y) Y d(X))
{Browse X#Y#Z}

declare L1 L2 L3 Head Tail in
L1=Head|Tail
Head=1
Tail=2|nil

L2=[1 2]
{Browse L1==L2}

L3='|'(1:1 2:'|'(2 nil))
{Browse L1==L3}