```ts
Infinity() { return Infinity() } // does not terminate

callByValue(x, y) {
    print(x)
    print(y)
}

callByValue(10, Infinity()) // does not print anything and does not terminate

callByName(x, y) {
    print(x)
    print(y)
}

callByName(10, Infinity()) // prints 10 but then does not terminate

callByName(x, y) {
    print(x)
    print(x)
}

callByName(10, Infinity()) // prints 10 twice and terminates

callByName(x) {
    print(x)
    print(x)
}

callByName(expensiveComputation()) // runs `expensiveComputation()` twice
```

---

Haskell uses call-by-need, which is call-by-name but caches the result of the expression.

```js
callByNeed(x, y) {
    print(x)
    print(x)
}

callByNeed(10, Infinity()) // prints 10 and terminates

callByNeed(x) {
    print(x)
    print(x)
}

callByNeed(expensiveComputation()) // runs the `expensiveComputation()` once
```

---

Say we have a function `f(x) {body}`.

`f(exp)` is like `eval(body, [("x", exp)])`,
and `body` is like a chain of expressions, evaluated in the resulting environment of the previous evaluation.

---

```js
eval(Add(Var "x", Var "x"), [("x", Div(Const 10, Const 2))]);
```

is a good example for call-by-need in our language.
