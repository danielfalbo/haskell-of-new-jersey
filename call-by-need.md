```js
callByValue(x, y) {
    print(x)
    print(y)
}

callByName(x, y) {
    print(x)
}

Infinity() { return Infinity() } // does not terminate
```

`callByValue(10, Infinity())` does not print anything and does not terminate

`callByName(10, Infinity())` prints 10 and terminates

```js
callByName(x) {
    print(x)
    print(x)
}
```

`callByName(expensiveComputation())` runs the `expensiveComputation()` twice

---

Haskell uses call-by-need, which is call-by-name but caches the result of the expression.

So, in

```js
callByNeed(x, y) {
    print(x)
    print(y)
}
```

`callByNeed(10, Infinity())` prints 10 and terminates.

In

```js
callByNeed(x) {
    print(x)
    print(x)
}
```

`callByNeed(expensiveComputation())` runs the `expensiveComputation()` once

---

`eval(Add(Var "x", Var "x"), [("x", Div(Const 10, Const 2))])` is a good example to test call-by-need in our language.

---

Say we have a function `f(x) {body}`.

`f(exp)` is like `eval(body, [("x", exp)])`,
and `body` is like a chain of expressions, evaluated in the resulting environment of the previous evaluation.
