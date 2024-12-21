use "haskell.sml";

eval(Const 4, []);

eval(Assign("x", Const 42), []);

(* eval(
    Add(Const 4, Const 2),
    []
    (* assign("x", fn () => (print "Computing 21 + 21...\n"; 21 + 21)) *)
) *)

(* add("x", "x", assign("x", fn () => (print "Computing 21 + 21...\n"; 21 + 21))) *)