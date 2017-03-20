declare Sqrt SqrtIter Improve GoodEnough Abs Iterate
fun {Sqrt X}
   Guess=1.0
in
   {SqrtIter Guess X}
end
fun {SqrtIter Guess X}
   if {GoodEnough Guess X} then Guess
   else
      {SqrtIter {Improve Guess X} X}
   end
end
fun {Improve Guess X}
   (Guess + X/Guess) / 2.0
end
fun {GoodEnough Guess X}
   {Abs X-Guess*guess}/x < 0.00001
end
fun {Abs X}
   if X<0.0
   then ~X
   else X
   end
end

{Browse {Sqrt 2}}

{Browse 9}

declare
local
   fun {Improve Guess X}
      (Guess + X/Guess) / 2.0
   end
   fun {GoodEnough Guess X}
      {Abs X-Guess*Guess}/X < 0.00001
   end
   fun {SqrtIter Guess X}
      if {GoodEnough Guess X} then Guess
      else
         {SqrtIter {Improve Guess X} X}
      end
   end
in
   fun {Sqrt X}
      Guess=1.0
   in
      {SqrtIter Guess X}
   end
end

declare
fun {Sqrt X}
   fun {SqrtIter Guess X}
      fun {Improve Guess X}
         (Guess + X/Guess) / 2.0
      end
      fun {GoodEnough Guess X}
         {Abs X-Guess*Guess}/X < 0.00001
      end
   in
      if {GoodEnough Guess X} then Guess
      else
         {SqrtIter {Improve Guess X} X}
      end
   end
   Guess=1.0
in
   {SqrtIter Guess X}
end

declare
fun {Sqrt X}
   fun {SqrtIter Guess}
      fun {Improve}
         (Guess + X/Guess) / 2.0
      end
      fun {GoodEnough}
         {Abs X-Guess*Guess}/X < 0.00001
      end
   in
      if {GoodEnough} then Guess
      else
         {SqrtIter {Improve}}
      end
   end
in
   {SqrtIter Guess}
end

fun {Sqrt X}
   fun {Improve Guess}
      (Guess + X/Guess) / 2.0
   end
   fun {GoodEnough Guess}
      {Abs X-Guess*Guess}/X < 0.00001
   end
   fun {SqrtIter Guess}
      if {GoodEnough Guess} then Guess
      else
         {SqrtIter {Improve Guess}}
      end
   end
   Guess=1.0
in
   {SqrtIter Guess}
end

declare
fun {Iterate S IsDone Transform}
   if {IsDone S} then S
   else S1 in
      S1={Transfrom S}
      {Iterate S1 IsDone Transform}
   end
end

declare
fun {Sqrt X}
   {Iterate
    1.0
    fun {$ G} {Abs X-G*G}/X<0.00001 end
    fun {$ G} (G+X/G)/2.0 end}
end

declare
fun {Fact N}
   if N==0 then 1
   elseif N>0 then N*{Fact N-1}
   else raise domianError end
   end
end

proc {Fact N ?R}
   if N==0 then R=1
   elseif N>0 then N1 R1 in
      N1=N-1
      {Fact N1 R1}
      R=N*R1
   else raise domainError end
   end
end

fun {Fact N}
   fun {FactIter N A}
      if N==0 then A
      elseif N>0 then {FactIter N-1 A*N}
      else raise domianError end
      end
   end
in
   {FactIter N 1}
end

declare
fun {Length Ls}
   case Ls
   of nil then 0
   [] _|Lr then 1+{Length Lr}
   end
end
{Browse {Length [a b c]}}

fun {Append Ls Ms}
   case Ls
   of nil then Ms
   [] X|Lr then X|{append Lr Ms}
   end
end

declare
fun {Nth Xs N}
   if N==1 then Xs.1
   elseif N>1 then {Nth Xs.2 N-1}
   else raise domainError end
   end
end
{Browse {Nth [a b c d] 5}}

declare
fun {SumList Xs}
   case Xs
   of nil then 0
   [] X|Xr then X+{SumList Xr}
   end
end
{Browse {SumList [1 2 3]}}

declare
fun {Reverse Xs}
   case Xs
   of nil then nil
   [] X|Xr then {Append {Reverse Xr} [X]}
   end
end

declare
fun {Length Xs}
   case Xs of nil then 0
   [] _|Xr then 1+{Length Xr}
   end
end

declare
fun {IterLength I Ys}
   case Ys
   of nil then I
   [] _|Yr then {IterLength I+1 Yr}
   end
end

declare
local
   fun {IterLength I Ys}
      case Ys
      of nil then I
      [] _|Yr then {IterLength I+1 Ys}
      end
   end
in
   fun {Length Xs}
      {IterLength 0 Xs}
   end
end

declare
local
   fun {IterReverse Rs Ys}
      case Ys
      of nil then Rs
      [] Y|Ys then {IterReverse Y|Rs Yr}
      end
   end
in
   fun {Reverse Xs}
      {IterReverse nil Xs}
   end
end

declare
fun {Merge Xs Ys}
   case Xs # Ys
   of nil # Ys then Ys
   [] Xs # nill then Xs
   [] (X|Xr) # (Y|Ys) then
      if X<Y then X|(Merge Xr Yr}
      else Y|{Merge Xs Yr}
      end
   end
end

declare
proc {Split Xs ?Ys ?Zs}
   case Xs
   of nil then Ys=nil Zs=nil
   [] [X] then Ys=[X] Zs=nil
   [] X1|X2|Xr then Yr Zr in
      Ys=X1|Yr
      Zs=x2|Zr
      {Split Xr Yr Zr}
   end
end

declare
fun {MergeSort Xs}
   case Xs
   of nil then nil
   [] [X] then [X]
   else Ys Zs in
      {Split Xs Ys Zs}
      {Merge {MergetSort Ys} {MergeSort Zs}}
   end
end

proc {P X S1 ?Sn}
   if {BaseCase X} then Sn=S1
   else
      {P1 S1 S2}
      {P2 S2 S3}
      {P3 S3 Sn}
   end
end

declare
proc {ExprCode E C1 ?Cn S1 ?Sn}
   case E
   of plus(A B) then C2 C3 S2 S3 in
      C2=plus|C1
      S2=s1+1
      {ExprCode B C2 C3 S2 S3}
      {ExprCode A C3 Cn S3 Sn}
   [] I then
      Cn=push(I)|C1
      Sn=S1+1
   end
end

declare Code Size in
{ExprCode plus(plus(a 3) b) nil Code 0 Size}
{Browse Size#Code}

declare
fun {MergeSort Xs}
   fun {MergeSortAcc L1 N}
      if N==0 then
         nil # L1
      elseif N==1 then
         [L1.1] # L1.2
      elseif N>1 then
         NL=N div 2
         Nr=N-NL
         Ys # L2 = {MergeSortAcc L1 Nl}
         Zs # L3 = {MergeSortAcc L2 Nr}
      in
         {Merge Ys Zs} # L3
      end
   end
in
   {MergeSortAcc Xs {Length Xs}}.1
end

declare Flatten
fun {Flatten Xs}
   case Xs
   of nil then nil
   [] X|Xr andthen {IsList X} then
      {Append {Flatten X} {Flatten Xr}}
   [] X|Xr then
      X|{Flatten Xr}
   end
end


fun {Flatten Xs}
   proc {FlattenD Xs ?Ds}
      case Xs
      of nil then Y in Ds=Y#Y
      [] X|Xr andthen {IsList X} then Y1 Y2 Y4 in
         Ds=Y1#Y4
         {FlattenD X Y1#Y2}
         {FlattenD Xr Y2#Y4}
      [] X|Xr then Y1 Y2 in
         Ds=(X|Y1)#Y2
         {FlattenD Xr Y1#Y2}
      end
   end Ys
in
   {FlattenD Xs Ys#nil} Ys
end

fun {Flatten Xs}
   proc {FlattenD Xs ?S E}
      case Xs
      of nil then S=E
      [] X|Xr andthen {IsList X} then Y2 in
         {FlattenD X S Y2}
         {FlattenD Xr Y2 E}
      [] X|Xr then Y1 in
         S=X|Y1
         {FlattenD Xr Y1 E}
      end
   end Ys
in
   {FlattenD Xs Ys nil} Ys
end

fun {Flatten Xs}
   fun {FlattenD Xs E}
      case Xs
      of nil then E
      [] X|Xr andthen {IsList X} then
         {FlattenD X {FlattenD Xr E}}
      [] X|Xr then
         X|{Flattend Xr E}
      end
   end
in
   {FlattenD Xs nil}
end

fun {Reverse Xs}
   proc {ReverseD Xs ?Y1 Y}
      case Xs
      of nil then Y1=y
      [] X|Xr then
         {ReverseD Xr Y1 X|Y}
      end
   end Y1
in
   {ReverseD Xs Y1 nil} Y1
end


{Browse {Flatten [[a b] [[c] [d]] nil [e [f]]]}}

declare
proc {ButLast L ?X ?L1}
   case L
   of [Y] then X=Y L1=nil
   [] Y|L2 then L3 in
      L1=Y|L3
      {ButLast L2 X L3}
   end
end

declare NewQueue Check Insert Delete IsEmpty
fun {NewQueue} q(nil nil) end

fun {Check Q}
   case Q of q(nil R) then q({Reverse R} nil) else Q end
end

fun {Insert Q X}
   case Q of q(F R) then {Check q(F X|R)} end
end

fun {Delete Q X}
   case Q of q(F R) then F1 in F=X|F1 {Check q(F1 R)} end
end

fun {IsEmpty Q}
   case Q of q(F R) then F==nil end
end

declare
fun {NewQueue} X in q(0 X X) end
declare
fun {Insert Q X}
   case Q of q(N S E) then E1 in E=X|E1 q(N+1 S E1) end
end
declare
fun {Delete Q X}
   case Q of q(N S E) then S1 in S=X|S1 q(N-1 S1 E) end
end
declare
fun {IsEmpty Q}
   case Q of q(N S E) then N==0 end
end

declare Q1 Q2 Q3 Q4 Q5 Q6 Q7 in
Q1={NewQueue}
Q2={Insert Q1 peter}
Q3={Insert Q2 paul}
local X in Q4={Delete Q3 X} {Browse X} end
Q5={Insert Q4 mary}
local X in Q6={Delete Q5 X} {Browse X} end
local X in Q7={Delete Q6 x} {Browse X} end

proc {ForkD D ?E ?F}
   D1#nil=D
   E1#E0=E {Append D1 E0 E1}
   F1#F0=F {Append D1 F0 F1}
in
   skip
end

proc {FortQ Q ?Q1 ?Q2}
   q(N S E)=Q
   q(N S1 E1)=Q1
   q(N S2 E2)=Q2
in
   {ForkD S#E S1#E1 S2#E2}
end

declare
fun {Lookup X T}
   case T
   of leaf then notfound
   [] tree(Y V T1 T2) then
      if X<Y then {Lookup X T1}
      elseif X>Y then {Lookup X T2}
      else found(V) end
   end
end

declare
fun {Lookup X T}
   case T
   of leaf then notfound
   [] tree(Y V T1 T2) andthen X==Y then found(V)
   [] tree(Y V T1 T2) andthen X<Y then {Lookup X T1}
   [] tree(Y V T1 T2} andthen X>Y then {Lookup X T2}
   end
end

declare
fun {Insert X V T}
   case T
   of leaf then tree(X V leaf leaf)
   [] tree(Y W T1 T2) andthen X==Y then
      tree(X V T1 T2)
   [] tree(Y W T1 T2) andthen X<Y then
      tree(Y W {Insert X V T1} T2)
   [] tree(Y w T1 T2) andthen X>Y then
      tree(Y W T1 {Insert X V T2})
   end
end

declare
fun {Delete X T}
   case T
   of leaf then leaf
   [] tree(Y W T1 T2) andthen X==Y then
      case {RemoveSmallest T2}
      of none then T1
      [] Yp#Vp#Tp then tree (Yp Vp T1 Tp)
      end
   [] tree(Y W T1 T2) andthen X<Y then
      tree(Y W {Delete X T1} T2}
   [] tree(Y W T1 T2) andthen X>Y then
      tree(Y W T1 {Delete X T2})
   end
end

declare
fun {RemoveSmallest T}
   case T
   of leaf then none
   [] tree(Y V T1 T2) then
      case {RemoveSmallest T1}
      of none then Y#V#T2
      [] Yp#Vp#Tp then Yp#Vp#tree(Y V Tp T2)
      end
   end
end

declare
proc {DFS T}
   case T
   [] tree(Key Val L R) then
      {DFS L}
      {Browse Key#Val}
      {DFS R}
   end
end

declare
fun {Prog S1 Sn}
   Y Z S2 S3 S4 S5
in
   S1=program|S2
   Y={Id S2 S3}
   S3=';'|S4
   Z={Stat S4 S5}
   S5='end'|Sn
   prog(Y Z)
end

declare
fun {Stat S1 Sn}
   T|S2=S1
in
   case T
   of begin then
      {Sequence Stat fun {$ X} X==';' end S2 'end'|Sn}
   [] 'if' then C X1 X2 S3 S4 S5 S6 in
      {Comp C S2 S3}
      S3='then'|S4
      X1={Stat S4 S5}
      S5='else'|S6
      X2={Stat S6 Sn}
      'if'(C X1 X2)
   [] while then C X S3 S4 in
      C={Comp S2 S3}
      S3='do'|S4
      X={Stat S4 Sn}
      while(C X)
   [] read then I in
      I={Id S2 Sn}
      read(I)
   [] write then E in
      E={Expr S2 Sn}
      write(E)
   elseif {IsIdent T} then
      S2=':='|S3
      E={Expr S3 Sn}
      assign{T E}
   else
      S1=Sn
      raise error(S1) end
   end
end

declare
fun {Sequence NonTerm Sep S1 Sn}
   X1 S2 T S3
in
   X1={NonTerm S1 S2}
   S2=T|S3
   if {Seq T} then X2 in
      X2={Sequence NonTerm Seq S3 Sn}
      T(X1 X2) % Dynamic record creation
   else
      S2=Sn
      X1
   end
end

declare Comp Expr Term COP EOP TOP Fact
fun {Comp S1 Sn} {Sequence Expr COP S1 Sn} end
fun {Expr S1 Sn} {Sequence Term EOP S1 Sn} end
fun {Term S1 Sn} {Sequence Fact TOP S1 Sn} end

fun {COP Y}
   Y=='<' orelse Y=='>' orelse Y=='<=' orelse
   Y=='>=' orelse Y=='==' orelse Y=='!='
end
fun {EOP Y} Y=='+' orelse Y=='-' end
fun {TOP Y} Y=='*' orelse Y=='/' end

fun {Fact S1 Sn}
   T|S2=S1
in
   if {IsInt T} orelse {IsIdent T} then
      S2=Sn
      T
   else
      E S2 S3 in
      S1='('|S2
      E={Expr S2 S3}
      S3=')'|Sn
      E
   end
end

declare
fun {Id S1 Sn} X in S1=X|Sn true={IsIdent X} X end
declare
fun {IsIdent X} {IsAtom X} end

declare
fun {Append Xs Ys}
   case Xs
   of nil then Ys
   [] X|Xr then X|{Apped Xr Ys}
   end
end

declare
proc {Append Xs Ys ?Zs}
   case Xs
   of nil then Zs=YS
   [] X|Xr then Zr in
      Zs=X|Zr
      {Append Xr Ys Zr}
   end
end
