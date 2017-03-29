# Programming Language Pragmatics 程序语言实践

## FOUNDATIONS

### 1 Introduction

机器语言是直接控制处理器，在合适的时间让它从一个地方到另一个地方加，比较，移动数据等等操作的二进制序列。

#### The Art of Language Design

为什么有那么多的语言：
* 进化
* 特定目地
* 个人喜好

语言怎么成功：
* 强有力的
* 易于使用对新手
* 易于实现
* 标准化
* 开源
* 高效的编译器
* 经济，实惠和惰性

#### The Programming Language Spectrum

声明式编程关注计算机做什么，命令式编程关注计算机械怎么做。

命令式编程占主要优势的主要原因是性能。

重要子类型
* 函数式语言 基于递归定义，灵感来之于 lambda calculus。
* 数据流语言 
* 逻辑或约束语言
* 冯 诺依曼语言
* 脚本语言
* 对象导向语言

函数式编程里最重要的是输入和输出的数学关系。

在逻辑语言里，程序指定一个原理集和允计系统找到想得到的值的证明规则。

#### Why Study Programming Languages?

对于一件事情来说，对语言的设计和实现一个好的理解能帮助我们选择更合适的语言来完成任务。

无论你学习什么语言，理解它的设计和实现能让你更好的使用它。本书帮助你：
* 理解难以理解的特性
* 选择另一种可替代的方式去表达事情
* 更好的使用调试，汇编，链接和关系工具
* 模拟语言中缺失的有用特性
* 无论在什么情况下都能更好的使用语言技术

#### Compilation and Interpretation

编译器转换高级源代码程序到等值的目标语言程序，然后执行它们。

许多编译器生成汇编语言代替机器语言，因为汇编语言易于调试，易于阅读，并且同机器语言文件独立。

C 编译器开始于能删除注释和展开宏的预处理器。

C++ 实现基于早期的 AT&T 编译器，生成的是一个 C 的中间程序，替代汇编语言。

许多编译器是自举的(self-hosting)：它们被写于它们编译的语言。

#### Programming Environments

编辑器 IDE

#### An Overview of Compilation

1. Lexical and Syntax Analysis 扫描器读取字符串并把它们分组进单词。扫描器也叫做词法分析。扫描器是为了简化解析器的任务。通过规约输入的大小并且删除无关的字符像空白符。解析器把单词组织成一个用高级构造(声明，表达式，子程序等等)解析树。每个结构是一个结点，它的成份是子结点。树的根结点是简单的程序；叶子从左到右，是扫描器得到的单词。一个可能的构造规则集叫做和上下文无关文法。每个规则有一个箭头符号(->)，左边是名字，右边是可能的表达式。上下文无关的文法用来表示语言的句法，解析器为此所做的是句法分析。
2. Semantic Analysis and Intermediate Code Generation 语义分析是找到语言的意义。
3. Target Code Generation 转换中间语言到目标语言。
4. Code Improvement

#### Summary and Concluding Remarks

#### Bibliographic Notes

### 2 Programming Language Syntax

不像自然语言，计算机语言必须精确。它们的形式(句法)和意义(语义)必须是没有歧义的说明，这样程序员和计算机才能告诉育种应该做什么。

区分句法和语义是有用的，至少有两个原因：首先不同的语言经常提供相同的语义但是用不同的句法。第二，编译器或解释器能使用发现计算机程序的句法结构的高效简洁算法，它能被用在后续的处理过程中。

#### Specifying Syntax: Regular Expressions and Context-Free Grammars

句法的正式规范需要一个规则集。

单词(token)是基本的程序构造块，有单独意思的最短字符串。包括关键字(keywords),标识符(identifiers)，符号(symbols),和各种类型的常量。

对于特定单词，我们使用正则表达式表示，有下面几种：
1. 一个字符
2. 空字符串用 ℇ 表示
3. 两个正则表达式连着，表示第一个后面是第二个
4. 两个正则表达式通过 | 分隔，意思是其中任意一个
5. 一个正则表达式后面跟着 *，表示零个或多个
圆括号放在多个子表达式的开始和结尾用来避免歧义，例如数字的句法：
```
number −→ integer | real
integer −→ digit digit *
real −→ integer exponent | decimal ( exponent | ℇ ) 
decimal −→ digit * ( . digit | digit . ) digit * 
exponent −→ (e|E)(+|-| ℇ) integer
digit −→ 0|1|2|3|4|5|6|7|8|9
```

正则表达式对于定义单词工作的很好，但是对于嵌套结构无能为力，然而这是程序语言最重要的。

在上下文无关方法中每个规则叫做产生式。产生式的左边符号是变量或者非终端符。可能会有签单的产生式有相同的左边。来之于方法的字符串叫做终端符，它们不会出现的左边。在程序语言中，上下文无关文法的终端符是语言的单词。非终端符中的一个，通常是第一个产生式的左边的一个，被叫做开始符号。它通过综合方法定义。

一个上下文无关文法显示怎么生成一个正当的符合文法的终端字符串：用开始符号开始。

算术操作中的结合性和优先级。

#### Scanning

扫描器和解析器对于发现程序语言的句法结构是责任重大的。发现的过程或句法分析是转换程序到等值的目标语言必要的第一步。

通过分组字符到单词，扫描器归纳出独立的能通过解析器检查的项。接下来扫描器删除注释；保存有用的单词；并且标记单词的行列号，以便在随后的阶段容易生成变质量的错误信息。

扫描器使用最长匹配原则。

有限自动机能从正则表达式自动生成，当单词定义改变时，它是容易的随之改变。

通过扫描器生成工具可以从正则表达式构造有限自动机。

典型的扫描器生成器实现转换分三步：第一步转换正则表达式到非确定有限自动机(NFA)，第二步扫描器生成器转换NFA到等值的DFA，第三步是空间优化，使用可能最小的状态生成最后的DFA。


#### Parsing

解析器是编译器的核心。它调用扫描器获得输入程序的单词，把单词组装在一起形成一个语法树，然后传递树给编译器的后续阶段，语义分析，代码生成，改进。

解析算法的分类 LL(从左到右，最左推导) 和 LR(从左到右，最右推导)。

LL 解析器也叫做从顶向下或预测解析。从根结点构造树，预测当前结点的下一步，基于下一个输入。LR 解析器也叫做从底向上解析器，它从叶子上构造树，当一个叶子的集合或其它结点能一起做为单一父结点的子结点连接在一起。

### 3 Names, Scopes, and Bindings

### 4 Semantic Analysis

### 5 Target Machine Architecture

## CORE ISSUES IN LANGUAGE DESIGN

### 6 Control Flow

### 7 Data Types

### 8 Subroutines and Control Abstraction

### 9 Data Abstraction and Object Orientation

## ALTERNATIVE PROGRAMMING MODELS

### 10 Functional Languages

### 11 Logic Languages

### 12 Concurrency

### 13 Scripting Languages

## A CLOSER LOOK AT IMPLEMENTATION

### 14 Building a Runnable Program

### 15 Run-time Program Management

### 16 Code Improvement

