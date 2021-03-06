# 现代编译器实现 - 虎书

## Part I Fundamentals of Compilation 编译基础

### 1 Introduction 介绍

#### 1. 接口与模块
* 编译器的各阶段：
    * 词法分析(Lex) 将源文件分解为一个个独立的单词符号
    * 语法分析(Parse) 分析程序的短语结构
    * 语义动作(Semantic Actions) 建立每个短语的抽象语法树
    * 语义分析(Semantic Analysis) 确定每个短语的含义，建立变量和声明的关联，检查表达式类型，翻译每个短语
    * 栈帧布局(Frame Layout) 按机器要求的方式将变量、函数参数等分配在活跃记录(栈帧)内
    * 翻译(Translate) 生成中间表示树(IR树)，这是一种与任何特定程序设计语言无关和目标机体系结构无关的表示
    * 规范化(Canonicalize) 提取表达式中的副作用，整理条件分支，以便下一阶段处理
    * 指令选择(Instruction Selection) 将IR树结点组合成与目标机相对应的指令块
    * 控制流分析(Control Flow Analysis) 分析指令的顺序并建立控制流图，此图表示程序执行时可能流经的所有控制流
    * 数据流分析(Dataflow Analysis) 收集程序变量的数据信息，
    * 寄存器分配(Register Allocation) 为程序中的每个变量和临时数据选择一个寄存器，不在同一点活跃的两个变量可以共享同一个寄存器
    * 代码流出(Code Emission) 用机器寄存器替代每一条机器指令中出现的临时变量名

#### 2. 工具和软件

上下文无关文法(content-free grammer)用来解析和正则表达式用来词法分析。
Yacc(转换语法到解析程序)和Lex(转换声明规范到词法分析程序)。

#### 3. 树语言的数据结构

许多重要的数据结构在编译器中是用能被编译的中间代码表示的。经常这些表示用树的形式来表示。树表示能用语法解释就像编程语言。

### 2 词法分析

编译器的前端做分析，后端做组合。分析包括词法分析、语法分析、语义分析。
词法分析倒一个字符流并生成一个名称，关键字和标记符号的流。它丢弃tokens之间的空白符和注释。任何地方的空白符号和注释都可能使解析更加复杂化。这是把词法分析从解析中分离出去的主要原因。

#### 1. 词法单词(LEXICAL TOKENS)

一个词法单词是一个在编程语言文法中能被当做单元一起处理的字符序列。编程语言将词法单元分类到有限的单元类型集合中。

像IF,VOID,RETURN这样由字母字符组成的tokens叫做保留字。在许多语言中，不能被用于标识符。

我们将使用正则表达式的官方语言详述词法单元，实现词法分析器使用确定有限自动机(deterministic finite automata)DFA,使用数学运算连接它们。这会让词法分析更简单和更易读。

#### 2. 正则表达式

语言是字符串的集合；一个字符串是一个有限的符号序列。符号来自于有限的字母表。
    * Symbol: 正则表达式 a 表示语言仅仅包含字符串 a.
    * Alternation: a|b 表示 a 或 b
    * Concatenation: a . b == a and b
    * Epsilon: ε 表示空集
    * Repetition: * 表示0个或者多个

消除歧义的两个规则：
    * Longest match: 匹配最长
    * Rule priority: 优先规则  匹配第一个

#### 3. FINITE AUTOMATA 有限自动机

一个有限自动机有一个有限的状态集；从一个状态到另一个状态的路称为边，并且每个边都用一个符号标记。一个状态是开始状态，一些状态是重要的作为最后状态。

在确定性有限自动机(DFA)中，不会有从同一状态开始的两个边被标记为相同的符号。DFA接收或拒绝一个字符串的工作过程如下：从开始状态出发，对于每个输入字符串中的字符，自动机都沿着准确的一个边到下一状态。边必须用输入字符标记。对于有 n 个字符的字符串，在 n 次状态转换后,如果自动机到了最终状态，那么自动机就接收了字符串。若未到达终结状态，或者找不到与输入字符相匹配的边，那么自动机就拒绝接收这个字符串。通过自动机语言识别出它接收的字符串集合。

有六个不相关的自动控制：他们怎么结合进单一机器服务于词法分析器？

##### 识别最长的匹配

追踪最长匹配路径就是用两个变量保存自动机上一次的结束状态：Last-Final(最近使用过的结束状态号)和Input-Position-at-Last-Final。每次到达终结状态时，词法分析器都要更新这些变量；当到达停滞状态时(非最终状态但是没有输出转换)，变量告诉什么token被匹配，并且它在哪结束。

#### 4. 非确定有限自动机(NFA)

NFA是在相同的符号下有对应多个输出状态的边标记的选择。或者它有一个特别的边标记 ε,不用吃下输入的任何字符就可以继续。

##### 正则表达式转换为NFA

它很容易将一个(静态的、说明性的)正则表达式换成一个(仿真的、拟执行的)NFA。这种转换算法可以将任何一个正则表达式转换为含有一个尾(初始边)和一个头(结束状态)的NFA。

##### NFA转换为DFA

一次试验每一种可能性。

#### 5. 词法分析生成器

词法分析器的生成来自于词法规范

### 3 Parsing 解析

简单机制：用符号代替正则表达式，以方便使用：
```
digits = [0-9]+
sum = expr "+" expr
expr = "("sum")"|digits
```
匹配括号对有限自动机来说不可识别，所以sum和expr不是正则表达式。
词法分析器在把正则表达式转换成有限自动机之前会把digits这样不是正式表达的符号先转换成它对应的右边的正则表达式形式。

但对于sum-expr这样形式的是不行的。
```
expr = “(” expr “+” expr “)” | digits

expr = “(” ( “(” expr “+” expr “)” | digits ) “+” expr “)” | digits
```

#### 上下文无关文法

对解析器来说，字符串是源程序，符号是词法单元，字母是通过词法分析器返回的词素类型集合。

一个一上下文无关文法描述了一个语言。一个语法有这样的形式：
```
symbol -> symbol symbol ... symbol
```
每一个 symbol 要么是终端符，意思是它来自于语言中字符串的字母表的符号，要么是非终端符号，意思是它在产生式的左边。产生式的左边不会出现终端符号。最后一个非终端符作为语法的开始符号是重要的。

推导是用一个开始符号开始，然后通过它的右边重复替换非终端符号。

解析树是将推导式中的每个符号同其推导符号连接而成。两个不同的推导可能有相同的解析树。

若一个文法可以用两棵不同的分析树派生出同一句法，那么该文法具有二义性。

消除二义性的通常做法是转换文法，优先级和结合性。

不仅要读入终结符，还要读入全文结束符。通常使用 $ 符号代表。

#### 预测分析

有些文法使用了递归下降这样的简单算法来简化分析。实际上就是把每个文法转换成一个递归函数的子句。

每个非终端符对应一个函数，每个产生式对应一个项。

递归下降、预测或者分析仅限于如下的文法中：每个子表达式的第一个终端符号为选择产生式提供了足够多的信息。为了便于理解，需要引入一个 FIRST 集的概念，然后使用一个简单算法推导一个无冲突递归下降分析器。

构造一个预测分析器

考虑一个递归下降解析器，对一些非终结符号 X 的分析函数中，每个 X 产生式都有一个子句。函数必须根据下一个输入token T 选择子句中的一个。如果我们对每个(X,T)都选择了正确的产生式，之后我们就能写下整个递归下降解析器。

#### 预测解析

预测解析表不包含完全一样的条目的语法叫做LL(1)。这表示从左到右解析，从最左边推导，超前扫描1个符号。不混乱的语法是LL(k)。

##### 消除左递归 
转换左递归为右递归
在LL(1)解析表完全一样
```
E -> E + T
E -> T
```
转换
```
E -> E'
E' -> + T E'
E' -> 
```


##### 左因式分解
当两个相同的非终端符号用相同的符号开始时。
```
S -> if E then S else S
S -> if E then S
```
转换
```
S -> if E then S X
X -> 
X -> else S

```

##### 错误恢复

打印错误信息并且从错误中恢复以便在相同的编译时其它错误能被发现是更好的选择。

通过插入解决错误恢复是危险的，因为错误转义可能导致无限循环。使用删除法是安全的，因为到了文件末尾，循环一定会终止。

#### LR 解析

LL(k) 解析技术的缺点是它们必须预测下一产生式的使用，但是需要向前查看一个字符。

LR(k)表示从左到右解析，从最右边推导，超前扫描 k 个符号。

解析器有一个栈和一个输入。输入的前 k 个词素被扫描。基于栈的内容和超前扫描，解析器执行种动作：
* Shift： 移动第一个输入词素到栈的顶部。
* Reduce： 选择一个语法规则X -> A B C; 弹出 C， B， A，从栈顶，把X 压入栈。
初始时，栈是空的并且解析器在输入的开始位置。 移动到文件末尾标记 $ 的动作叫做 accepting并且会让解析器成功停止。

##### LR解析引擎

通过 DFA LR 解析器知道什么是做 shift，什么时候做 reduce。

##### LR(0) 解析器生成

LR(0) 语法是指那些仅仅在栈上能被解析扫描的，没有任务超前扫描就可以做出shift/reduce的决定。

#### 使用解析器生成

构造一个解析器的任务是简单的足够自动化。

##### JAVACC 

生成式形式：
```
void Assignment() : {} { Identifier() "=" Expression() ";"}
```

#### 错误恢复


### 4 Abstract Syntax

### 5 Semantic Anlysis

### 6 Activation Records

### 7 Translation to Intermediate Code

### 8 Basic Blocks and Traces

### 9 Instruction Selection

### 10 liveness Analysis

### 11 Register Allocation

### 12 Putting It All Together

## Part II Advanced Topics

### 13 Garbage Collection

### 14 Object-Oriented Languages

### 15 Functional Programming Languages

### 16 Polymorphic Types

### 17 Dataflow Analysis

### 18 Loop Optimizations

### 19 Static Single-Assignment Form

### 20 Pipelining and Scheduling

### 21 The Memory Hierarchy
