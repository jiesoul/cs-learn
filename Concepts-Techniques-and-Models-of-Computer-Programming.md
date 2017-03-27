# Concepts, Techniques, and Models of Computer Programming

## 前言

一种学习编译的方法是学习编语言。但是编译语言太多了，只能挑选几个有代表性的不同范式的。但是这只能作为统一的训练我们对程序有一点点深入理解。本书采用另一种方法。

我们关注编程思想和使用它的技术，不关心语言。思想从术语计算模型上来组织。一个计算模型是计算过程怎么去做的正式方法。有很多方法去定义计算模型。因为本书为实践设计，因此计算模型可以用来直接使用是重要的。因此我们将在对程序员重要的思想表达方式上定义，比如数据类型，操作，和一个编程语言。术语编程模型能精确的制造编程范式的不确定性。本书剩下的部分将讨论计算模型和非编程范式。有时我们也使用习语编程模型。这涉及到编程需要什么：通过计算模型，编程技巧和设计原则是可能的。

每一个编程模型有它自己的编程技巧集和程序的推理。计算模型的数量已知的是要比编程语言的数量小的。本书覆盖了众所周知的编程模型和小众的。主要的选择标准是是否在实践中使用。

每一个计算模型都基于一个简单的核心语言叫做核心语言(kernel language).核心语言在一个逐步发展的路上，通过添加一个又一个概念。这让我们了解不同模型之间的深度关系。经常在编程中，仅仅添加一个新的思想能让世界大不同。比如，给函数式编程添加一个破坏性的任务(清晰的状态)可以去做对象导向的编程。

当步入下一个模型时，我们怎样决定思想被添加？本书会多次处理这个问题。主要是标准是创造性扩展原则。大致上，当编程因为不相关的技术原因变得复杂时去添加一个新的思想去解决问题。如果小心选择的话，添加一个思想到核心语言中去能让语言变简单。本书的核心语言基于这个原则发展。

核心语言方法一个特性是我们能使用不同的模型在同一语言里。这通常叫做多范式编程。这是自然的，这意味着对问题使用正确的思想，独立于语言的原始模型。

我们呈献三个领域：GUI设计，健壮分布式编程，约定编程。我们将显示明智的联合使用几个模型解决相应领域的问题。

我们挑选四个有代表性的计算模型：Erlang,Haskell,Java和Prolog.

## 本书的目标

用基于科学的在实践中使用的统一训练来学习编程。

编程做为一种普通的人类活动，做是扩展和改变一个系统的功能的表演。

本书关注软件系统的构建。在这个设定下，编程是一个在系统规范和实现编程之间的工作。这个步骤是由设计程序的建造和抽象并且去编码到编程语言。

编程有两个必不可少部分：技术和它的科学基础。技术包含工具，实践技巧和标准，允许我们去编程。科学包含在广度和深度的理论上让我们理解编程。科学应该能解释技术上怎么做。

不同的学校教授不同的范式，作为统一整体的编程训练丢失了。

核心编程方法通过转换实际语言到小的有意义的核心语言组成。丰富的抽象和句法集合编码进核心语言。这给编程者和学生关于语言做什么的清晰理解。核心语言有简单正式的语义让我们去推理程序的正确性和复杂性。这给了程序员一个纯的基础，并且编译技巧构造在它之上。

教学有两个互补的方法：
* 基于计算的方法 
* 基于逻辑的方法

本书和sicp一样基于计算。

添加思想是一把双刃剑。在计算模型中引入一个新的表达式可能使编程简单，但是推理可能复杂。

单一模型的具限：
* 对象导向 默认有状态，当它看起来简单和符合直觉，真相是编程变复杂了。比如它让并发变得困难。继承被滥用。
* 函数式编程 鼓励高级函数的过度使用。典型的是monads 和 currying. Monads 通过线程被编码成状态遍及系统各处。导致程序复杂而不是真正的正确状态模块化。Currying 让你应用一个函数的不完全状态通过给它参数的一部分。这返回一个有剩余参数的函数。函数在参数未完全的时候不会执行。反面是它并不清晰是否在完全参数的状态还是curried状态。
* 逻辑语言 过度使用霍恩子句（Horn Clause）.程序作为Horn Clause的集合被定义成if-then的形式，它使算法更让人迷糊。

信息学课程三个主题：
1. 思想和技术
2. 算法和数据结构
3. 程序设计和软件工程

本书详细的论述主题1和初步介绍主题2和3.经验显示程序设计应该先教,防止学生有坏习惯。

本书不包含两个主题：
* 静态类型
* 特定编程技术

## ch01 介绍编程概念
### 计算器
### 变量
### 函数 
* 递归、组合、函数抽象
### 列表 
* 模式匹配
### 列表函数 
* 主函数、辅助函数，
* 自顶向下的软件开发(1. 理解手工怎么计算，2. 写下主函数，假定辅助函数已知。3. 通过完成辅助函数解决问题。)
### 正确性
一个程序做了我们想让它做的事情就是正确的。手工验证正确通常是不可能的。

* 验证的推理过程：
    1. 我们需要一个程序语言操作的数学模型,定义它们应该怎么做。这个模型叫做语言的语义。
    2. 我们需要定义想让程序去做什么，通常这是一个输入的数学定义和计算输出的程序需求。这叫做语言的规范。
    3. 我们使用数学技术去推理程序，使用语义。我们将验证程序满足规范。
* 验证的主要任务：
    * 编译器
    * 运行系统
    * 操作系统
    * 硬件

* 数学归纳法

### 复杂性

### 延迟计算
* lazy 关键字

### 高级函数

* 能够把函数做为参数传递被叫做高级函数

### 并发

* 通过线程(thread)

### 数据流

* 线程一个一个顺序执行。

### 状态

* 存储器单元(memory cell)

### 对象

### 类

### 非确定性和时间

* 线程的并发问题

### 原子性

* 锁

### 练习

## 声明式编程方法

* 编程包括三件事：
   1. 一个编程模型是定义语言和语言句法怎么通过虚拟机执行的正式系统。本书感兴趣的是程序的有用和易懂。
   2. 编程技巧和设计原则用来在语言的计算模型中编程，我们称之为编程模型。编程模型一定是建立在计算模型上的。
   3. 推理技术集合能让你推理编程，去增强它们表现正确和计算效率的信心。
   
* 声明式编程也叫无状态编程，相对的是有状态编程(命令式编程)
* 声明式编程的两个主要范式是函数式和逻辑式。

### 定义实际编程语言

#### 语义

* 定义合法的语句是什么。不关心实际执行什么，那是语义的事。
* 语法 是从词到句子的规则集。对于编程语言来说，句子一般叫‘statments’，单词叫做‘tokens’。语法同时使用 statments 和 tokens.
    > statement (‘sentence’)= sequence of tokens (‘words’)
    
    > token (‘word’)        = sequence of characters (‘letters’)
* 一个程序从字符序列转换成token序列的过程叫做词法分析(tokenizer or lexical analyer).
* Extended Backus-Naur Form 扩展巴科斯-诺尔范式 EBNF
    * 终端符是一个token，非终端符是tokens的序列。
    * 非终端符通过语法规则定义。| 表示或者，大括号表示0或多个。
    * 读语法从左到右： 
        * 每个终端符被添加进序列
        * 每个非终端符用tokens序列替换。
        * 每次遇到选择，挑选它们任意一个。


* 任何明确的句子定义叫做正式语言和短语。上下文无法和上下文敏感。
* 上下文无关的语法可能是含混不清的。消除岐义的方法是优先级和结合性。
    * 优先级 不同操作符在同一个表达式中的判断，每个操作符有一个优先级别。
    * 结合性 是同一操作符在同一表达式中的判断，结合性确定左结合还是右结合。
* 符号设计满足两个基本原则：
    * 所有的语法规则都是它们自己的。之后的改变不会改变。
    * 当一个编程规则彻底定义一个非终端符号或者它仅仅是一个实际定义时它一直是清晰易懂。

#### 语义

* 程序的语义定义当它执行的时候程序做什么。理想情况下，语义应该被定义在一个简单的数学结构让我们不引入任务不相干的明细能推理程序.
* 核心语言方法由两个部分组成：
    * 首先定义一个非常简单的语言，叫做核心语言。
    * 第二定义一个从全部语言到核心语言的转换方案。转换方式有两种语言抽象和语法糖。
  
* 正式语义 有四个广泛使用的方法：
    * 操作语义(operational semantics)显示在抽象机器上声明怎么执行。
    * 公理语义(axiomatic semantics)定义声明的语义作为输入和输出之间的关系。
    * 指称语义(denotational semantics)定义声明作为一个函数在抽象领域。
    * 逻辑语义(logical semantics)定义声明作为一个逻辑定理的模型。
  
* 语言抽象
    * 程序语言和自然语言都会随着需要进化。
    * 实际的编程语言由语言抽象集合构成。
    * 语言抽象的两个阶段：首先定义一个语法结构，然后定义它对核心语言的转化。核心语言不会改变。

* 语法糖
    * 被用于经常发生的操作进行便利化，它也是一个语法规则。它不提供新的语言抽象，只是减少大小和改变可读性。
  
* 语言设计
    * 语言抽象是语言设计的基本工具。任何我们定义的抽象在它的生保周期都有三个阶段：当我们第一次定义它的时候，它没有语言支持。在一些情况下，我们假定它是相当可用和基础，我们决定给它语言支持。它就变成了一个语言抽象。这是一个探索的阶段。不会承诺语言抽象就是语言的一部分。如果语言抽象是成功的，比如它简化编程并且让程序员易于使用，它会成为语言的一部分。

* 其它转换方法 定义编程语言转换的三个途径：
    * 核心语言方法 本书使用的
    * 基本方法是为了数学。比如图灵机，λ演算(函数式的基础), 一阶逻辑(逻辑式编程的根本)，π演算(模型并发)。
    * 机器方法为实现准备。程序被转换成理想的机器，叫做抽象机或虚拟机。

* 解释器方法 可替代转化器方法的是解释器方法。语言的语义通过语言的解释器来定义。新的语言特性通过扩展解释器定义。解释器用L1来编写，并且接受L2语言编程，并执行它们。
    * 解释器方法有它显示语言抽象的自包含实现
  
### 单赋值存储(The single-assignment store)

* 我们引入声明模型首要的是解释它的数据结构。single-assignment store是一个初始未绑定并且能被一个值绑定的变量集。
```
{x1,x2,3} ;初始化
{x1=314, x2=[1 2 3], x3} ;值绑定
```

#### 声明变量(declarative variable)
变量在single-assignment store中称为声明变量,本书的后会有另一种变量，数据流数量(dataflow variables)因为它们作用在数据流的执行中。
声明变量一旦绑定，就会遍及计算的各处,并且从它的值上无法区分。

#### 值存储(Value store)
所有绑定值的变量的存储称为值存储。一个value是一个数学常量。value也可能是一个混合实体。

#### 值创建(Value creation)
在store的基本操作是绑定一个新值到变量上。表示为x<sub>i</sub>=value。

#### 变量标识符(Variable identifiers)
变量标识从外部存储到存储实体引用的一个文本名字。从变量标识到存储实体的映射称为环境(environment)。
在程序源代码中的变量名实际上是变量标识。

#### 使用标识符创建值（Value creation with identifiers）
一旦绑定，变量和它的值是无法区分的。
随着变量绑定的链接得到它的值叫做提取(dereferencing),它对程序是不可见的。

#### 不完全值(Partial values)
不完全值是一种可能包含未绑定变量的数据结构。

#### 变量变量绑定(Variable-variable binding)
变量可以绑定变量　x<sub>1</sub> = x<sub>2</sub> = x<sub>3</sub>

#### 数据流变量
在声明模型里建立一个变量和绑定它是分别做的。如果在建立之前绑定就会发生错误。有些语言建立和绑定是一起做的，错误不会出现。函数式语言就是这么做的。其它语言允计建立和绑定分离。这样的话我们可能会得到下面的几个错误：
1. 继续执行且没有错误消息返回。这个变量的内容未定义，在内存中永远找不到，这是C++的作法。
2. 继续执行且没有错误消息返回。这个变量定义时被初始化成一个默认值，比如integer默认是0，这是java的做法。
3. 运行停止等到一个错误消息。这是prolog对算术操作的做法。
4. 运行等待直到变量被绑定然后继续。
第一咱是非常不好的，相同程序的不同执行可能产生不同的结果,因为错误的存在不能标示，程序员不会知道发生了什么。第二种稍微好点，至少程序发生错误时它一直返回相同的结果，即使结果是错误的。程序员也不会知道错误的存在。
第三和第四在确保情况下是合理的。第三种程序发生错误将会标示出来，代替默认继续。在顺序系统中这是合理的，因为这真是一个错误。在并发系统中是不合理的，因为结果变成不确定的了：依靠时机，有时出现有时不出现。第四种在顺序系统中是不合理的，因为程序永远会在等待。在并发系统中是人合理的，它是一些其它线程绑定变量的普通操作的部分。本书的计算模型使用第四种。
声明变量导致程序等待，直到它们被绑定被叫做数据流变量。声明模型使用数据流变量因为它们在并发系统中是非常有用的。

### 核心语言
声明模型定义一个简单的核心语言。在这个语言中所有程序在模型中被表达。我们首先定义核心语言的句法和语义。然后我们说明怎么在核心语言之上构建整个语言。

#### 句法

* 声明，值，值标识

#### 值和类型

类或类型是一个和操作它们的集合在一起的值的集合。声明类型被分类到一个相当明确的类型集合中，叫做基本类型(basic types)。

因为所有使用的类型都会被检查，它不可能出现模型之外的行为，比如因为在内置数据结构上未定义的操作导致crash。在声明模型中，抓住一个错误条件将立刻终止。没有模型可以代理错误。在扩展模型中，类型错误将被内部模型代替。

在基本类型之个，程序会定义它们拥有的类型被叫做抽象数据类型(ADT).

* 基本类型 numbers(integers and floats), records(atoms, booleans,tuples,lists,strings),procedures.
* 动态类型 静态类型-所有变量类型在编译时就确定了。动态类型-变量的类型只有变量被绑定才确定。
* 类型层次 一个类型的操作符也适用于它的子类型。

#### 基本类型
* Numbers integers or floating point numbers
* Atoms 是一种在计算中作为单一元素被使用的符号常量。
* Booleans true or false
* Records 混合数据结构。一个标记和它之后的特征和变量的序对集合
* Tuples 是一种是从1 开始的的连续整数的features 的record。
* Lists nil or tuple '|'(H T)T是绑定或者未绑定的list。
    * '|'(H T) == H|T 前置操作符变中置操作符
    * '|' 是右结合的 1|2|3|nil == 1|(2|(3|nil))
    * [1 2 3] == 1|2|3|nil
* Strings 字符串
* Procedures 过程类型的值。$表示过程值是匿名的。

#### Records and procedures
* the power of records 构造数据的基本途径。
* why procedures 过程比对象更合适因为它简单。比函数合适因为它不一定定义像数学函数行为的实体。过程可以有任意的输入和输出，包括零。

#### 基本操作
* 算术 浮点数有四个操作符，+，-，\*，/。整数有操作符，+，-，\*，div，mod，
* Record 操作符 Arity,Label,"."
```
X=person(name:"George" age:25)
{Arity X} = [age name] 
{Label X} = person 
X.age = 25
```
* Comparisons 比较操作 
* 过程操作 定义(proc)，调用(使用大括号),测试是否是一个值(IsProcedure)

### 核心语言语义
核心语言执行由作用在不完全值的函数构成。

#### 基本概念
* 简单执行 在普通执行期间，声明在文本顺序上一个一个执行。
* 变量标识和静态类型 local声明做两件事：建立新的变量和设置一个标识符引用变量。标识符仅仅在local声明的内部引用变量。这称为标识符的作用域。作用域之外，标识符就不是相同的意思了。
* 过程 过程是任何语言最重要的基础构造块。参数大部分使用引用传递。
* 使用外部引用的过程 
* 动态作用域VS静态作用域 
* 过程抽象 三个重要规则的概念：
  * 过程抽象 任何声明都可能通过把它放到过程的定义中去生成一个过程。
  * 自由标识符 在声明中未定义的标识符。
  * 静态作用域 过程可以有外部引用，没有在过程体中作为参数定义的自由标识符，外部引用有值是过程定义时的值，这叫做静态作用域。
  * 数据流行为 在单赋值存储中，变量可以不绑定，但是另一边，一些声明需要绑定变量否则不能执行。
  
#### 抽象机器
我们将定义核心语义作为可使用语义，它定义核心语言的意思通过在它的抽象机器上执行。
首先定义抽象机器的基本概念：环境，语义声明，声明栈，执行状态和计算。然后说明怎么执行一个程序。最后我们解释在环境中怎么计算，哪一个是公共的语义操作。

* 概念预览 ：
    * 一个单状态存储 σ 是一个存储变量的集合。这些变量被分到相等但是不绑定的集合和绑定到数字，记录或过程的变量{x1, x2 = x3, x4 = a|x2},x1未绑定，x2和x3相等且未绑定，x4绑定到不完全值a|x2.
    * 一个环境E 是在 σ 中变量到标识符的映射。
    * 一个语义声明是一个序对(〈s〉，E)〈s〉是一个声明，E是一个环境。
    * 一个执行状态是序对(ST, σ )ST是语义声明栈 σ 是一个单赋值存储。
    * 一个计算是从初始开始的状态执行序列。(ST0, σ0) → (ST1, σ1) → (ST2, σ2) → ....
在计算中一个单一的转换叫做计算步骤，一个计算步骤是原子的，没有可见的中间状态。

* 程序执行 
程序怎么执行：
    * 初始执行状态是 ([(⟨s⟩, φ)], φ) 初始存储是空的(没有变量，空集合)并且初始执行状态仅仅有一个语义声明(⟨s⟩,φ) 在ST stack 上。
    * 在每一步，ST的第一个元素被打开并且依照元素的构成执行。
    * 最终执行状态(如果有一个)是哪一个语义栈是空的状态。
语义栈ST可能是三个运行状态中的一个：
    * 运行状态：ST 能做一个计算步骤。
    * 终结状态：ST是空的。
    * 暂停状态：ST 是非空的，但是它不能执行任何计算步骤。
  
* 随环境计算
程序执行经常是随着环境计算的。一个环境E是一个函数，映射变量标识符⟨x⟩到存储实体(包括未绑定变量和值)。符号E(⟨x⟩) 从存储中检索与标识符符 ⟨x⟩ 相关联的实体。定义抽象机器指令的语义，我们需要两个在环境上的公共操作符，名字为adjunction 和restriction.
Adjunction 通过添加一个映射到已存在的环境定义新环境。符号为：E + {⟨x⟩ → x} 表示新环境E'构造来源是E添加了映射{⟨x⟩ → x}.这个映射复写了任何其它来之于标识符⟨x⟩的映射。意思是E'(⟨x⟩)和x相等，并且E'(⟨y⟩)和E(⟨y⟩)相等对于所有的标识符⟨y⟩不同于⟨x⟩。当我们需要一次添加多个映射时：E+{⟨x⟩1 →x1,...,⟨x⟩n →xn}。
Restriction定义的新环境是一个已存在的环境的子集。符号：E|{⟨x⟩1,...,⟨x⟩n} 表示新环境E'是这样 dom(E′) = dom(E)∩{⟨x⟩1,...,⟨x⟩n} 并且对于所有 ⟨x⟩ ∈ dom(E′) 时E′(⟨x⟩) = E(⟨x⟩)。意思是新环境不包含集合中没有提到的。

* Non-suspendable statements 不可终止声明
    * skip 声明 (skip,E) 从语义栈弹出后执行完成。
    * 序列组合 (⟨s⟩1 ⟨s⟩2,E) 执行：
        * Push (⟨s⟩2, E) on the stack
        * Push (⟨s⟩1, E) on the stack
    * 变量定义(local 声明) (local ⟨x⟩ in ⟨s⟩ end, E) 执行：
        * 建立新变量x在存储上。
        * 让E′ 是E+{⟨x⟩→x}。
        * 将(⟨s⟩, E′)压入栈。
    * 变量-变量绑定 (⟨x⟩1 =⟨x⟩2,E) 在存储中绑定E(⟨x⟩1) 和E(⟨x⟩2)
    * 值创建 (⟨x⟩ = ⟨v⟩, E) ⟨v⟩ 是一个不完全构造值可能是record，number，或procedure的一种。执行动作：
        * 建立新变量x在存储上
        * 通过在存储中的构造值〈v〉并且让x引用它。在〈v〉中的所有标识符被用E替换。
        * 绑定E(〈x〉)和x 在存储中。
    * 再谈词法作用域 因为是通过源代码文件确定的，也叫做静态作用域。有自由标识符的声明是不能运行的。
    * 过程值 过程有外部引用
* Suspendable statements 可终止声明
它们会有激活条件，条件必须是true时才会继续执行。
    * 有条件的(if声明) (if ⟨x⟩ then ⟨s⟩1 else ⟨s⟩2 end, E) 
    * 过程应用 ({⟨x⟩ ⟨y⟩1 ... ⟨y⟩n}, E)
    * 模型匹配(case声明)  (case ⟨x⟩ of ⟨lit⟩(⟨feat⟩1: ⟨x⟩1 ... ⟨feat⟩n: ⟨x⟩n) then ⟨s⟩1 else ⟨s⟩2 end, E)
  
* 基本概念回顾
* 最终调用优化 == 尾递归优化
* 活动内存和内存管理
    * 内存循环引用
        * Dangling reference
        * Memory leak
    * 垃圾回收
 
### 从核心语言到实际语言
核心语言包含了声明里的所有概念，但是直接用它来编程是很少的，因为它太啰嗦了。消除这些啰嗦，需要审慎的添加语法糖和语言抽象：
    * 定义句法集让全部句法集更简单可用。
    * 定义重要的语言抽象，称为函数(funtions)，被用于更可读和简洁的程序。
    * 它解释Mozart系统的交互接口显示它与声明模型的联系。
  
* 句法简洁 
    * 变更可用的方法：
        * 嵌套的不完全值可以写一个简单的形式
        * 变量能在一步同时定义和初始化。
        * 表达式可以写成一个简单的形式。
        * if和case声明能简单的嵌套。
        * 新操作符andthen和orelse为了方便嵌套的if声明被添加进来。
        * 通过嵌套标记声明可以被转换成表达式。
    * 嵌套不完全值
      ```
      person(name:"George" age:25)
      ; 替代
      local A B in A="George" B=25 X=person(name:A age:B) end
      ```
  
    * 隐式变量初始化.让程序简短易读的一个语法糖是变量在定义时立刻绑定。在local和in中间绑定，代替lcoal X in X=10 {Browse X}
        * 表达式 是操作序列的语法糖，它返回一个值。
        * 嵌套if和case声明 简化程序
        * andthen 和 orelse 操作符 
        * 嵌套标记
* 函数(fun声明)
    * 定义
        ```lisp
        fun {F X1 ... XN} <statement> <expression> end
        ==
        proc {F X1 ... XN ?R} <statement> R=<expression> end
        
        fun {Max X Y}
            if X>=Y then X else Y end
        end
        
        ==
        
        proc {Max X Y ?R}
            R = if X>=Y then X else Y end
        end
        
        ==
        
        proc {Max X Y ?R}
            if X>=Y then R=X else R=Y end
        end
        ```
    * 调用
        ```aidl
        {F X1 ... XN} == {F X1 ... XN R}
  
        {Q {F X1 ... XN} ... } 
        ==
        local R in
            {F X1 ... XN R}
            {Q R ... }
        end
        ```
    * 在数据结构中的调用
        ```aidl
        Ys={F X}|{Map Xr F}
        ==
        local Y Yr in
          Ys=Y|Yr
          {F X Y}
          {Map Xr F Yr}
        end
        ```
* 交互接口(declare 声明)

#### 异常
异常处理机制(exception handlering mechanism)

* 动机和基本概念 
    * 首先能限制错误，让错误不要影响整个程序。error confinement principle.机制应该能从内部跳转到边界。
    * 第二，跳转应该是一个单一的操作。

* 异常的声明模型
    * try 声明 ( try 〈s〉1 catch 〈X〉 then 〈s〉 2 end , E) 执行：
        * ( catch 〈X〉 then 〈s〉2 end , E) 压入栈
        * (〈s〉1 , E) 压入栈
    * raise 声明 ( raise hxi end , E) 执行：
        * 从栈中找到catch声明弹出 如果catch声明找到，把它弹出栈。如果栈被耗尽或者 catch 没有被找到，用错误信息”Uncaught exception“停止执行。
        * 让( catch 〈Y〉 then 〈s〉 end , E<sub>c</sub> )能被catch声明找到。
        * (〈s〉, E<sub>c</sub> + {〈y〉 → E(〈x〉)}) 压入栈
* full Syntax
    * finally 从句
    * 模式匹配
* 系统异常
    * failure: 
    * error
    * system 

#### 高级主题
* 函数式编程语言 只有一个可能的计算叫做纯函数语言
    * λ 演算 有很多变体。有两个公共的基本操作，定义名字和计算函数。
    * 限制声明模型 在两个途径上声明模型经λ演算更通用。第一它定义函数在不完全值上，第二它使用过程句法。我们可以定义纯函数语言通过放两个句法限制在声明模型上，让它计算函数在完全值上：
        * 总是在它绑定时马上绑定值。
        * 仅仅使用函数句法，不使用过程句法。
    * 带有这两个限制的模型叫做函数模型。
* Unification and entailment
    * Unification (the = operation) 给变量绑定值的特殊操作。
        * 最简单的变量和值绑定，变量-变量绑定。
        * 等号两边互换是一样的。
        * 任意两个不完全值能被统一。
        * 如果不完全值是一样的，什么也不做。
        * 如果不完全值不能相容，它们不能统一。
        * 参数不对称
        * 可能会建立环形。
        * 可以绑定环形结构。
    * The unification algorithm 

* 动态类型和静态类型
    * 动态类型 在编写的时候不限制。在做不同的子集时可能出现小的问题。在分模块时要限定类型在模块的边界。能缩短想法和实现的周期。
    * 静态类型 能在编译时抓取异常。允许更高效的实现。可以改进程序的安全。
    
## Declaretive Programming Techniques

* 为什么声明式编程是重要的：
    * 声明程序是组合式的。它由可编写，测试，保证正确，独立于其它组件且有它自己的历史的组件构成。
    * 推理声明式程序是简单的。 因为程序只计算值，简单的算术和逻辑推理可被使用。
* 写声明式程序的基本技巧是认为程序是一个递归函数定义的集合。

### what is declarativeness?

* 声明式编程的归类 直觉的它是定义what 而不是解释how。根据表现归类：
    * 描述性声明。 这是起码的表现。
    * 可编程声明。 这是作为图灵机的表现。
* 从可编程声明的有两个根本不同的途径：
    * 在定义视角。描述组件实现的属性在哪声明的。
    * 观察视角。 组件接口的属性在哪声明的。两个原则：使用一个组件知道它的规范就可以了不用知道它的实现。组件仅仅有一个行为定义。
* 本书两个视角都用，当我们对它内部感兴趣时我们用定义视角。当我们感兴趣的是它是怎么的行为时，我们使用观察视角。
* 定义声明程序的两个特别流行的风格：函数式和逻辑式。在函数式风格中，我们说一个组件作为一数学函数

* Specification languages

* Implementing components in the declareative model 在声明模型里所有的操作都可以做这些推导：
    * 第一，所有的基本操作在声明模型里都是声明的。
    * 第二，声明操作和声明模型的构造相结合，会得出声明操作。

### 迭代计算 Iterative computation
一个迭代计算是一个循环，栈大小是由独立的迭代数字常量限制的。
* 通用概要 
    * 开始于一个初始化状态S<sub>0</sub>并且转换状态在接下来的步骤直到最终状态S<sub>final</sub>.

### 递归计算 Recursive computation
Iterative computations are a special case of a more general kind of computation, called recursive computation. 

### 使用递归编程
递归计算是声明式程序的心脏。

* 使用lists的基本技巧：
    * 用递归思考：基本方法是解决一个问题在这个问题的更小版本上。
    * 转换递归到迭代：因为随着输入的大小栈空间随之生长，这是很奢侈的，所以我们实际上使用状态转换实现它们。
    * 迭代计算的正确性：简单有效的方法是通过状态的不变化推导迭代计算。
    * 通过给定类型构建程序：一个使用类型计算的函数几乎肯定的一个接近类型定义的递归结构。

* mergesort
    * 把lists分成大约相等的小lists
    * 使用合并排序递归排序两个小lists
    * 合并两个已经排序的lists到最终的结果。

* 队列
* 树 列表是一个线形结构，树是一个分支结构。
    * OBTree    ordered binary tree 有序二叉树每个结点包括一个值序对。
        * 树遍历 深度优先和广度优先。
    * 解析器 
        * Tokenizer 读取字符序列输出tokens序列。
        * Parser 读取tokens序列，输出抽象语法树(abstract syntax tree)
        * Code generator 遍历语法树生成实际机器或者虚拟机器的低级指令。

### Time and space efficiency 时间和空间效率

### Higher-order programming 高级函数
当在编程中使用过程值变为可用时的编程技巧集合。

* 四个基本操作：
    * 过程抽象 转换任意声明成为一个过程值的能力
    * 通用性 过程调用中过程值做为参数的能力。
    * 实例化 过程值可以做为过程调用的结果的能力。
    * 嵌入力 过程值可以放在数据结构中的能力。
    
* 过程值能放进数据结构中。它们有多种用法：
    * 清晰的惰性计算，也叫延迟计算。想法是直到需要时才去构建它的完全数据结构。
    * 模块 
    * 软件组件 
    
* 循环抽象
    * 命令式语言中的循环，计数是一个指定变量每次指定不同的值。声明式语言的中循环计数每次都是新的变量。它的每次循环是完全独立的。因此，它可以在并发中不改变循环的最终结果。
    
* 数据驱动技术 
    * 基于list的技术。 Map 对旧列表的每一个元素应用一个函数生成一个新列表。
    
* 延迟计算

* 柯里化

### 抽象数据类型

### Program design in the small
* 设计方法论
    * 非正式规范。 
    * 举例
    * 搜索
    * 构造和编码
    * 测试和推导

## Declarative Concurrency

### 数据驱动并发模型
* 从两个角度看同一时间这个问题：
    * 语言角度是语言的语义，像是程序员看着。最简单的假设是线程交错执行。在真实的执行下，线程转化成计算步骤。计算步骤不会重叠，每一个都是原子的。
    * 实现角度是多线程在真正的机器上是怎么实际实现的。如果是单处理器，那它是交错的。如果是多处理器，线程能同时做多个计算。
    
* 非确定性 当有并发状态时，不确定性自然会出现。在声明式并发模型中，非确定性对程序员是不可见的。有两个原因：首先数据流变量仅仅能绑定一个值。它可能会影响变量绑定时，不会影响绑定之后。第二，任何需要变量值的操作不会被选择一直等到变量被绑定。
* 调度 下一个线程的执行选择是由系统一个叫做调度器的部分来做的。当我们说一个线程是准备好的时，它也被叫做可运行的，它的声明有了至少一个计算步骤所需要的全部信息。一旦线程准备好，它会无限期的等待。一个准备好的线程能在任何时间执行。 一个线程没有准备好叫做暂停的。它的第一声明不能继续因为它没有它需要的全部的信息。我们说第一声明是被阻塞的。

### 基本线程编程技术

### Streams
stream可能是一个未绑定的信息列表。尾部是一个数据流变量。
* 生产者/消费者 一个线程叫做生产者建立流，一个叫消费者读取流。

### 数字逻辑模拟
* 非门 与门 或门 异或门 
* 组合电路有限制不能存储信息.

### 直接使用声明并发模型

### 延迟计算

### Soft real-time programming

### Limitations and extensions of declarative programming

### Haskell language

## Message-Passing Concurrency

### 消息传递并发模型
通过添加ports扩展声明并发模型。
一个port是一个ADT，有两个操作，建立管道和发送。
* {NewPort S p} 建立新的port使用入口P和流S。
* {Send P X} 把X 加到入口P对应的流上。

### Port objects
port object是一个或多个ports和一个stream port的组合。这在两个方面扩展了stream objects：首先多对一组合是可能的，多个threads能引用一个给定的port object并且独立的send给它。使用一个stream object是不可能的，因为它不知道它的下一个消息来自哪。第二，port objects能植入内部数据结构。

在消息传递模型中，一个程序是由正在发送和接收消息的port objects构成。

定义一个port object，我们仅仅需要一个初始状态Init和状态转换函数Fun。

### Simple message protocols
RMI(Remote Method Invocation) 它允许一个object去调用另一个object在不同的操作系统进程中，可能是相同的机器也可能是不同的机器通过网络相连。

### Program design for concurrency

* 基于组件编程的四种基本操作：
    * Instantiation 实例化 建立组件实例，默认每个都是独立的，有时它们所有都依赖于一个共享的实例。
    * Composition 组合 在其它组件之外构建新的组件。
    * Linking 链接 结合组件实例通过它们的输入和输出。
    * Restriction 约束 在是组合组件的内部限制输入或输出的可见度。
* 设计方法论
    * 非正式规范 写下可能的非正式的但是精确的规范，程序应该做什么。
    * 组件化 在规范中枚举所有不同的并发形式。每个活动都变成一个组件。画一个系统的方块图显示所有的组件。
    * 消息协议 决定组件将发送什么消息和设计它们之间的消息协议。e和所有的消息协议画一个组件图。
    * 状态图 对于每一个并发实体，写下它的状态图。对于每一个状态，验证所有的合适的消息被接收和发送正确的条件和动作。
    * 实现和调度 用你最喜爱的语言编写系统。决定在组件之间实现并发的调度算法。
    * 测试和迭代 测试系统和再迭代让它满足最初的规范。