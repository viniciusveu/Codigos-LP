(*
SINTAXE:

fun <nome> (<lista de argumentos>) = <expressao>
fun f1 (x1 : t1, x2 : t2, ... , xn : tn) = exp

exemplo:
fun soma (num1 : intm num2 : int) =
    num1 + num2

========================================================
AVALIACAO:

Toda funcao é um valor

========================================================
CHECAGEM DE TIPOS:
Como era a checagem de tipos com bindings de variaveis?

val x = 34       --> ambiente estático: x -> int
val y = 17       --> ambiente estatico: x -> int, y -> int
val z = x + y    --> ambiente estatico: x -> int, y -> int, z -> int

Como é com funcoes?
Sintaxe: 
fun f1 (x1 :t1, ... , xn : tn) = exp

fun soma (n1 : int, n2 : int) = n1 + n2
    SE o corpo da funcao (exp) passar na checagem de tipos, ENTAO:
        ambiente estatico: x -> int, y -> int, z -> int, soma -> <tipo_t>
        <tipo_t> = Sei até agora que a funcao soma tem argumentos do tipo int e ela
            retorna um valor (total da soma) do tipo int 
        

*)

val num1 = 9
val num2 = 10
(* ambiente estatico: num1 -> int, num2 -> int *)

fun potencia(x : int, y : int) =  (* (int * int) -> int *)
    (* ambiente estatico: num1 -> int, num2 -> int, potencia -> <tipo_t> -> (int * int)->int, x -> int, y -> int *)
    if y = 0
    then 1
    else x * potencia(x, y-1) (* termina o escopo, x e y para de existir quando sai da funcao *)

(* ambiente estatico: num1 -> int, num2 -> int, potencia -> <tipo_t> -> (int * int)->int *)
val num3 = potencia(2,2) (* num3 -> (int * int)->int *)
(* ambiente estatico: num1 -> int, num2 -> int, potencia -> <tipo_t> -> (int * int)->int, num3 -> 4 *)
(* ambiente dinamico: num1 -> 9, num2 -> 10, potencia -> num, num3 -> 4 *)

(* <tipo_t> = (t1 * t2 * ... * tn) -> t  (* '*' é só para separar o tipo dos argumentos, não é multiplicação *) *)

val num4 = potencia(2+2, potencia(2,2))


(* Chamada a funcoes *)
fun retornanum() = 3
val retorno = retornanum()
(* 
SINTAXE: 
 - e0(e1, ... , en)    --> quando possui varios argumentos
 - e0 e1 ou e0(e1)     --> quando possui 1 único argumento
 - e0()                --> quando não possui nenhum argumento

--------------------------------------------------------------
CHECAGEM DE TIPOS:
 - e0 tem que ter um "tipo funcao" (vai ter o mesmo tipo que é chamado <tipo_t>)
 - Os argumentos devem passar por uma checagem de tipos
    * O numero de argumentos deve corresponder ao numero de args esperados na funcao
    * O tipodo de cada argumento deve corresponder ao tipo de arg esperado na funcao

--------------------------------------------------------------
AVALIACAO:
 - Olhar no ambiente dinamico atual e procurar pela funcao e0
 - Olhar para os argumentos: cada argumento também é avaliado para seu valor
 - Ocorre a avaliação do corpo da funcao

*)
