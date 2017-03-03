# 自制编译器 

## 第一部分 

### 语法分析的概要

* 生成扫描器的程序称为扫描器生成器（scanner generator），生成解析器的程序称为
  解析器生成器（parser generator）。
  
  扫描器生成器都大体类似，解析器生成器则有若干个种类。现在具有代表性的解析器生成
  器可分为 LL 解析器生成器和 LALR 解析器生成器两类。
  
  终端符（terminal symbol）可以归纳为 token。JavaCC 中将刚才的“语句”“函数调用”“表达式”等非 token 的语
  法单位称为非终端符（nonterminal symbol），并将非终端符像 Java 的函数调用一样在后面加上
  括号写成 stmt() 或 expr()。
  
    > Packrat 解析器 和 Parser combinator 技术
    
    