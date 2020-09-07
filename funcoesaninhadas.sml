(* 
(* funcao auxiliar: *)
fun contar(de : int, ate : int) =
    if de = ate
    then ate :: []
    else de :: contar(de+1, ate)


(* funcao principal: *)
fun contarde1_ate(x : int) =
    contar(1,x) 
*)

(* A mesma coisa usando o let: *)
fun contarde1_ate(ate : int) =
    let
        fun contar(de : int) =
            if de = ate
            then ate :: []
            else de :: contar(de+1)
    in
        contar 1
    end
(* a fun contar só é vista dentro da fun contarde1_ate() *)
