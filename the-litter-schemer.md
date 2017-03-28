# the litter schemer

## 十大戒律
1. 当递归一个原子列表lat时，问两个问题：(null? lat）列表是空吗还是其它。当递归一个数字时，问两个问题：(zero? 0）数字是0吗还是其它。当递归一个S表达表列表l时，问三个问题：(null? l)列表是空吗？(atom? (car l))列表第一项是原子吗，还是其它情况。
2. 使用cons构建列表lists。
3. When building a list, describe the first typical element, and then cons it onto the natural recursion.
4. 递归时至少改变一个参数。递归原子列表lat时，使用(cdr lat),递归数字列表n时，(sub1 n),递归一个S表达式的列表l时，如果(null? l)和(atom? (car l))是true使用(car l)和(cdr l).
它必须被改变接近终止条件。正在改变的参数必须测试中止条件：使用cdr时用null?测试，使用sub1用zero?测试。
5. 当用+构造一个值时，一直使用0作为终止的值，加0并不会改变之后添加的结果。
当使用*构造一个值时，一直使用1作为终止的值，乘1并不会改变值。
当使用cons构造时，一直使用()作为终止。
6. 仅仅在函数是正确的前提下去做简化。
7. 在subparts上递归有相同的特点：在列表的子列表上，在一个算术表达式的子表达式上。
8. 使用帮助函数从描述中去抽象。
9. 抽象公共模式使用新函数。
10. 构造多个函数比一次作用一个值好。

## 五个规则 

1. car 只能作用于非空List.
2. cdr 正确发音是could-er, 只能作用于非空List,任何非空List的cdr都是另一个List.
3. cons 需要两个参数,第一个是S表达式,第二个是List.结果是一个 List.
4. null? 只能作用在List上。
5. eq? 需要两个参数，两个参数必须是非数字类型的atom。

## 1.toys

* 介绍五大规则

## 2. do it, do it again, and again, and again

* (cond ...) 条件选择，(lambda ...)建立函数，(define ...) 给函数一个名字。

## 3. Cons the magnificent

* (rember a lat) 移除一个成员。