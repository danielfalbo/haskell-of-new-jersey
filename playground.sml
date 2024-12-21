use "haskell.sml";

eval(Const 4, []);

let
    val (_, e) = eval(Assign("x", Add(Const 21, Const 21)), [])
in 
    eval(Const 88, e)
end;

let
    val (_, e) = eval(Assign("x", Add(Const 21, Const 21)), [])
in 
    eval(Var "x", e)
end;


(* eval(
    Add(Const 4, Const 2),
    []
    (* assign("x", fn () => (print "Computing 21 + 21...\n"; 21 + 21)) *)
) *)

(* add("x", "x", assign("x", fn () => (print "Computing 21 + 21...\n"; 21 + 21))) *)