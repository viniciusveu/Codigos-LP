(* Exemplos para demonstrar como funciona o shadowing *)

val a = 10 (* <hidden-value> *)
    (* Ambiente estático: a --> int *)
    (* Ambiente dinâmico: a --> 10 *)

val b = a * 2
    (* Ambiente estático: a --> int, b --> int*)
    (* Ambiente dinâmico: a --> 10, b --> 20 *)

val a = 5  (* NÃO é uma atribuição de variável, é um shadowing *) (* <hidden-value> *)
    (* Ambiente estático: a --> int, b --> int *)
    (* Ambiente dinâmico: a --> 5, b --> 20 *)

val c = b 
    (* Ambiente estático: a --> int, b --> int, c --> int *)
    (* Ambiente dinâmico: a --> 5, b --> 20, c --> 20 *)

val d = a 
    (* Ambiente estático: a --> int, b --> int, c --> int, d --> int *)
    (* Ambiente dinâmico: a --> 5, b --> 20, c --> 20, d --> 5 *)

val a = a + 1  (* outro shadowing em a *)
    (* Ambiente estático: a --> int, b --> int, c --> int, d --> int *)
    (* Ambiente dinâmico: a --> 6, b --> 20, c --> 20, d --> 5 *)

val f = a * 2 
    (* Ambiente estático: a --> int, b --> int, c --> int, d --> int, f --> int *)
    (* Ambiente dinâmico: a --> 5, b --> 20, c --> 20, d --> 5, f --> 12 *)

