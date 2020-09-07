(* LISTA VAZIA *)

val x = [];   (* 'a list *)

(* LISTA COM MÚLTIPLOS VALORES 
[v1, v2, v3, ... , vn]
*)

val y = [1,2+1,3];  (* int list *)

val z = [true, false, false]; (* bool list *)

val v = 5 :: y; (* Adiciona o 5 no início da lista y *)
(* e1 :: e2 
    - Avalia e1 para um valor v, e2 para uma lista [v1,v2,...,vn]
    - e1 :: e2 avalia para uma lista composta por [v, v1, v2,...,vn]
  
*)

val a = 6 :: 4 :: v;

val b = [[2],[3,6]];

val c = y :: b; (* [[1,3,3],[2],[3,6]] : int list list *)