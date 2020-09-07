
(* 
    Funces hd e tl:
    - hd x -> pega a cabeça da lista x [primeiro elemento]
    - tl x -> pega a calda da lista x [todos os elmentos da lista menos o primeiro]
*)


(* [2,2,2,2,2] -> 10 *)
fun soma_lista(xs : int list) =
    (* se a lista estiver vazia a soma será 0 -> case base *)
    if null xs
    then 0
    (* se a lista não estiver vazia -> caso recursivo *)
    else hd xs + soma_lista(tl xs)


(* 7 -> [7,6,5,4,3,2,1] *)
fun cont_regressiva(x : int) =
    (* Quando eu paro de adicionar elementos na lista? -> caso base *)
    (* Paro quando chegar no 0. Quando x = 0 *)
    if x = 0
    then []
    (* Caso contrário, eu devo colocar o x como cabeça de uma lista menor *)
    else x :: cont_regressiva(x-1)


fun append(xs : int list, ys : int list) =
    if null xs
    then ys
    else (hd xs) :: append((tl xs), ys)


fun soma_pares(xs : (int * int) list) =
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + soma_pares(tl xs)


fun primeiros(xs : (int * int) list) =
    if null xs
    then []
    else #1 (hd xs) :: primeiros(tl xs)


fun segundos(xs : (int * int) list) =
    if null xs
    then []
    else #2 (hd xs) :: segundos(tl xs)

fun soma_pares2(xs : (int * int) list) =
    (soma_lista(primeiros xs) + (soma_lista(segundos xs)))
