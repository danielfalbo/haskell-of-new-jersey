datatype exp = 
    Add of exp * exp
    | Assign of string * exp
    | Var of string
    | Const of int

type env = (string * exp) list

val rec eval = fn (exp: exp, env: env) (* : int option * env *) => 
    case exp of
        Const value => (SOME value, env)
      | Assign (key, expression) => (NONE, (key, expression) :: env)
      | Var key => (
            case List.find (fn (k, _) => k = key) env of
                SOME (_, value) => (
                    case eval(value, env) of
                        (SOME v, e) => (SOME v, e)
                        | (NONE, e) => (NONE, e)
                )
                | NONE => (NONE, env)
        )
      | Add (a, b) => (
        let 
            val (a, e1) = eval(a, env)
        in 
            let 
                val (b, e2) = eval(b, e1)
            in 
                case (a, b) of
                    (SOME a, SOME b) => (SOME (a + b), e2)
                    | (SOME a, NONE) => (SOME a, e2)
                    | (NONE, SOME b) => (SOME b, e2)
                    | (NONE, NONE) => (NONE, e2)
            end
        end
      )


(* 
    a program is a list of expressions recursively defined to run in the environment resulting from the previous expression

    so an expression evaluates to an environment

    an expression can be
        an addition
        an and
        an or
        a not
        a variable assignment
        a variable
        a constant
    
    expressions can be evaluated
        add: returns the evaluation of the first expression + the evaluation of the second expression

 *)