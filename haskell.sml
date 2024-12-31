datatype exp = 
    Add of exp * exp
    | Div of exp * exp
    | Assign of string * exp
    | Var of string
    | Const of int

type env = (string * exp) list

val rec eval = fn (exp: exp, env: env) => 
    case exp of
        Const value => (SOME value, env)
      | Assign (key, expression) => (NONE, (key, expression) :: env)
      | Var key => (
            case List.find (fn (k, _) => k = key) env of
                SOME (_, value) => (
                    case eval(value, env) of
                        (SOME v, e) => (SOME v, (key, Const v) :: e)
                        | (NONE, e) => (NONE, e)
                )
                | NONE => (NONE, env)
        )
      | Add (a, b) => (
        let val (a, e1) = eval(a, env)
        in 
            let val (b, e2) = eval(b, e1)
            in 
                case (a, b) of
                    (SOME a, SOME b) => (SOME (a + b), e2)
                    | (SOME a, NONE) => (SOME a, e2)
                    | (NONE, SOME b) => (SOME b, e2)
                    | (NONE, NONE) => (NONE, e2)
            end
        end
      )
    | Div (a, b) => (
        let val (a, e1) = eval(a, env)
        in 
            let val (b, e2) = eval(b, e1)
            in 
                case (a, b) of
                    (SOME a, SOME b) => let val r = a mod b
                        in
                            if r = 0
                            then (SOME (
                                (Real.toInt IEEEReal.TO_NEAREST)(
                                    Real.fromInt(a) / Real.fromInt(b)
                                )
                            ), e2)
                            else (NONE, e2)
                        end
                    | (SOME a, NONE) => (SOME a, e2)
                    | (NONE, SOME b) => (SOME b, e2)
                    | (NONE, NONE) => (NONE, e2)
            end
        end
      )