(* Alguns erros comund *)

val x = 34

(*  3º: y = x + 1 : faltando declarar y*)
val y = x + 1 (* corrigido, erro de tipo *)

(* 4º: val z = if y then 34 else x < 4  : y deve ser uma expressão do tipo bool *)
(* 5º: val z = if y > 0 then 34 else x < 4  : os dois resultados de if são de tipos diferentes (int e bool), mas devem ser do mesmo *)
val z = if y > 0 then false else x < 4 (* corrigido, erros de tipo ????*)

(* 1º: val q = if y > 0 then 0  : else 42 estava faltando, n existe if sem else em sml *)
val q = if y > 0 then 0 else 42  (* corrigido,  erro de sintaxe *) 

(* 6º: val a = -5 : '-' só funciona em expressões, para representar negativo deve-se utilizar '~' *)
val a = ~5  (* corrigido, erros de avaliação *)

val w = 0

(* 2º: val fun = 34  : fun é uma palavra reservada (chave) não pode ser usava em outro contexto *)
val funny = 34 (* corrigido, erro de sintaxe*)

(* 7º: val c = x / w : '/' só funciona em divisão de reais, para inteiros usa-se 'div', e não se divide um numero por 0 *)
val c = x div (w+1) (* corrigido: erro de avaliação *)

(* 8º: val quatorze = 7 - 7 : erro que o compilador não percebe *)
val quatorze = 7 + 7 (* corrigido, erro de avaliação*)

(* Primeiro ele verifica os erros de sintaxe, depois de tipo e depois de avaliação *)