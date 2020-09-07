(*   let -> serve para declarar variáveis locais
- SINTAXE:
    let b1 b2 b3 ... bn in exp end
    - Cada bi é qualquer binding e exp é qualquer expressão

- AVALIAÇÃO:
    - Avalia cada bi e exp em um ambiente dinâmico que inclui os bindings anteriores
    - O resultado da expressão let pe o resultado da avaliação da expressão exp

- CHECAGEM DE TIPOS:
    - Faz a checagem de tipo para cada bi e exp em um ambiente estático que inclui os bindings anteriores
    - O tipo da expressão let é o tipo da expressão exp

*)

fun fun01(z : int) =
    let
        val x = if z > 0 then z else 34
        val y = x + z + 9
    in
        if x > y then x * 2 else y * y
    end

fun fun02() =
    let
        (* AD: x -> 1 *)
        val x = 1
    in
        (let (*AD: x->?, x->2*) val x = 2 in x+1 end) + (let (*AD: x->1, x->?*) val y = x+2 in y+1 end)
    end