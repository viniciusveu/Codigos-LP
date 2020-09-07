(* options.sml *)

(* 
- t option é um tipo para qualquer tipo t
    - Parecido com o t list, mas um tipo diferente, não uma lista (2 opções de um certo t)

- Criação:
    - NONE : tem o tipo 'a option (parecido com o [] (lista vazia) que tem o tipo 'a list)
    - SOME e : tem o tipo t option se e tiver o tipo t (parecido com e :: [])

- Acesso:
    - isSome : tem o tipo 'a option -> bool (true se tiver algo [some], false se não tiver [NONE])
    - valOf : tem o tipo 'a option -> 'a (exceto se NONE), retorna o valor da option

*)

fun max1 (xs : int list) = 
    if null xs
    then NONE
    else 
        let val max_val = max1(tl xs)
        in
            if isSome max_val andalso valOf max_val > hd xs
            then max_val
            else SOME (hd xs)
        end

(* retorno:
    - max1[2,7,5];
    val it = SOME 7 : int option
    - max1[];
    val it = NONE : int option 
    - valOf(max1[2,7,5]);
    val it = 7 : int
*)



fun max2 (xs : int list) =
    if null xs
    then NONE
    else 
        let 
            fun max_nonempty (xs : int list) = 
                if null (tl xs)
                then hd xs 
                else 
                    let val max_val = max_nonempty(tl xs)
                    in
                        if hd xs > max_val
                        then hd xs
                        else max_val
                    end
        in
            SOME (max_nonempty xs)
        end

(* Mesmas saídas, porém mais eficiente *)