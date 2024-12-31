use "haskell.sml";

eval(Const 4, []);

let val (_, e) = eval(Assign("x", Add(Const 21, Const 21)), [])
in eval(Add(Const 2, Const 8), e)
end;

let val (_, e) = eval(Assign("x", Add(Const 21, Const 21)), [])
in eval(Var "x", e)
end;

let val (_, e) = eval(Assign("x", Add(Const 21, Const 21)), [])
in eval(Add(Var "x", Var "x"), e)
end;

let val (_, e) = eval(Assign("x", Add(Const 21, Const 21)), [])
in eval(Add(Const 2, Var "x"), e)
end;

let val plusThree = fn x => Add(x, Const 3)
in eval(plusThree(Const 2), [])
end;

eval(Div(Const 10, Const 2), []);

eval(Div(Const 10, Const 3), []);

let val (half) = fn x => Div(x, Const 2)
in eval(half(half(Const 20)), [])
end;

let val (half) = fn x => Div(x, Const 2)
in eval(half(half(Const 10)), [])
end;
