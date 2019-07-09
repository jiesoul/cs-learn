> 与门 或门 异或 与非 或非 多路转换器

#### Basic Gates

```
Chip name: Not
Inputs: in
Outputs: out
Function: If in=0 then out=1 else out=0.

Chip name: And
Inputs: a, b
Outputs: out
Function: If a=b=1 then out=1 else out=0.

Chip name: Or
Inputs: a, b
Outputs: out
Function: If a=b=0 then out=0 else out=1.

Chip name: Xor
Inputs: a, b
Outputs: out
Function: If a= /b then out=1 else out=0.

* Multiplexor
Chip name: Mux
Inputs: a, b, sel
Outputs: out
Function: If sel=0 then out=a else out=b.

* Demultiplexor
Chip name: DMux
Inputs: in, sel
Outputs: a, b
Function: If sel=0 then {a=in, b=0} else {a=0, b=in}.

```

#### Multi-Bit Versions of Basic Gates
```aidl
Multi-Bit Not 
Chip name: Not16
Inputs: in[16] // a 16-bit pin
Outputs: out[16]
Function: For i=0..15 out[i]=Not(in[i]).

Multi-Bit And
Chip name: And16
Inputs: a[16], b[16]
Outputs: out[16]
Function: For i=0..15 out[i]=And(a[i],b[i]).

Multi-Bit Or
Chip name: Or16
Inputs: a[16], b[16]
Outputs: out[16]
Function: For i=0..15 out[i]=Or(a[i],b[i]).

Multi-Bit Multiplexor
Chip name: Mux16
Inputs: a[16], b[16], sel
Outputs: out[16]
Function: If sel=0 then for i=0..15 out[i]=a[i]
else for i=0..15 out[i]=b[i].

```

#### Multi-Way Versions of Basic Gates
```aidl
Multi-Way Or
Chip name: Or8Way
Inputs: in[8]
Outputs: out
Function: out=Or(in[0],in[1],...,in[7]).

Multi-Way/Multi-Bit Multiplexor 
Chip name: Mux4Way16
Inputs: a[16], b[16], c[16], d[16], sel[2]
Outputs: out[16]
Function: If sel=00 then out=a else if sel=01 then out=b
else if sel=10 then out=c else if sel=11 then out=d
Comment: The assignment operations mentioned above are all
16-bit. For example, "out=a" means "for i=0..15
out[i]=a[i]".

Chip name: Mux8Way16
Inputs: a[16],b[16],c[16],d[16],e[16],f[16],g[16],h[16],
sel[3]
Outputs: out[16]
Function: If sel=000 then out=a else if sel=001 then out=b
else if sel=010 out=c ... else if sel=111 then out=h
Comment: The assignment operations mentioned above are all
16-bit. For example, "out=a" means "for i=0..15
out[i]=a[i]".

Multi-Way/Multi-Bit Demultiplexor
Chip name: DMux4Way
Inputs: in, sel[2]
Outputs: a, b, c, d
Function: If sel=00 then {a=in, b=c=d=0}
else if sel=01 then {b=in, a=c=d=0}
else if sel=10 then {c=in, a=b=d=0}
else if sel=11 then {d=in, a=b=c=0}.

Chip name: DMux8Way
Inputs: in, sel[3]
Outputs: a, b, c, d, e, f, g, h
Function: If sel=000 then {a=in, b=c=d=e=f=g=h=0}
else if sel=001 then {b=in, a=c=d=e=f=g=h=0}
else if sel=010 ...
...
else if sel=111 then {h=in, a=b=c=d=e=f=g=0}.
```

* 对于内存来说，这个位置和那个位置并没有区别，外表看起来是一样的，CPU如果要从内存中读取数据，就需要不同的寻址方式来对应不同的操作。

1. Direct addressing 直接寻址 直接使用地址或者用符号表示的内存地址
2. Immediate addressing 立即寻址 直接把值赋给寄存器
3. Indirect addressing 间接寻址 
```
// Translation of x=foo[j] or x=*(foo+j):
ADD R1,foo,j // R1<---foo+j
LOAD* R2,R1 // R2<---Memory[R1]
STR R2,x // x<---R2
```
4. Flow of Control 流程控制
```aidl
High-level
// A while loop:
while (R1>=0) {
code segment 1
}
code segment 2


Low-level
// Typical translation:
beginWhile:
JNG R1,endWhile // If R1<0 goto endWhile
// Translation of code segment 1 comes here
JMP beginWhile // Goto beginWhile
endWhile:
// Translation of code segment 2 comes here
```

