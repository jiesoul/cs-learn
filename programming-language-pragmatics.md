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

