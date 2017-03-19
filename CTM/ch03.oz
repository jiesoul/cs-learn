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



