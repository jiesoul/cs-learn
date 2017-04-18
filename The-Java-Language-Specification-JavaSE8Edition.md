# The-Java-Language-Specification-JavaSE8Edition

## 1. Introduction

java语言是强类型和静态类型的。

## 2. Grammars

### 上下文无关语法

一个上下文无关语法由多个产生式组成。每个产生式有一个抽象符号叫做非终端符作为它的左边，和一个或多个非终端符和终端符组成的序列是它的右边。对于每个语法。终端符来自之于特定的字母表。

### 字面量语法

它定义一个产生的集合，从目标符号输入开始，详述 Unicode 字符串怎么转换到输入元素。

这些输入元素丢弃空白符和注释。

### 语义语法

### 语法符号

## 3. Lexical Structure

### Unicode 

编程使用标准的 Unicode 字符集。JAVA 语言使用 UTF-16 编码。

### Lexical Translations

一个未经加工的 Uniode 字符流被转换成一个 tokens 的序列。三个转换步骤：

* 原始的 Unicode 字符流转换成相应的 Unicode 字符，\uxxxx 中的 xxxxx 是一个十六进制值，表示 UTF-16 代码单元的编码是 xxxx。这个转换步骤允许任何程序仅仅用 ASCII 字符表示。
* 第一步的 Unicode 流转换成字符输入流和行终止符。
* 第二步的结果转换成输入元素序列，空白符和注释被丢弃，由句法的终端符号单词组成。

每一步都是最长匹配转换，

### Unicode Escapes Unicode转义

java 语言编译器首先识别 Unicode 转义输入，转换成 ASCII 字符。

## 4. Types,Values,and Variables



## 5. Conversions and Contexts

## 6. Names

## 7. Packages

## 8. Classes

## 9. Interfaces

## 10. Arrays

## 11. Exceptions

## 12. Execution

## 13. Binary Compatibility

## 14. Blocks and Statements

## 15. Expressions

## 16. Definite Assignment

## 17. Thread and Locks

## 18. Type Inference

## 19. Synatax

