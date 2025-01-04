**Static Scoping**: variables are resolved at compile time.

**Dynamic Scoping**: variables are resolved at runtime.

Both Haskell and Standard ML use static scoping.

Here's a program that behaves differently in static and dynamic scoping:

```hs
val y = 0;

fun f x = x + y;

fun g x =
  let
    val y = 10
  in
    f x
  end;

val result = g 3;
```

This program will return 3 in static scoping and 13 in dynamic scoping.

Our "language" can both run the program and evaluate the expression `result` in both static and dynamic scoping, based on which environments we assign to expressions for evaluation.
