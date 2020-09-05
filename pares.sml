(*PARES*)

(*
SINTAXE: 
    Para criação de pares em ML:
        - (e1, e2)

REGRAS DE AVALIACAO:
    - avaliar a primeira expressao e1 para um valor v1, e a segunda expressão para o valor v2
    - o  par de valores é por si so um valor, que e composto pelos valores  das expressao e1 e e2

REGRAS PARA CHECAGEM DE TIPOS:
    - Se a primeira expressao tiver um tipo t1, e a segunda expressão tiver um tipo t2, 
    o tipo do par será t1 * t2

COMO ACESSAR OS ELEMENTOS e1 E e2  DE UM PAR?
    - #1 para acessar o primeiro elemento
    - #2 para acessar o segundo elemento

    SINTAXE PARA ACESSO: (e1, e2) -> e
        #1 e
        #2 e

    REGRAS DE AVALIAÇÃO PARA ACESSO: e
        ex.: x é um par (4, 17) e usarmos #1 de x, obtemos 4

    CHECAGEM DE TIPOS PARA ACESSO: vai ter sempre o formato t1 * t2. (e1, e2) -> (t1, t2)
        #1 e -> t1
        #2 e -> t2
    

*)


(* 
    Esta funcao vai receber um par por parâmetro.
    Esse par tem o primeiro elememto do tipo int e o segundo do tipo bool.
    E essa funcao retorna um novo par onde o primeiro elemento é o #2,
    o segundo elemento é o #1 do par que veio por parâmetro
*)
fun troca(par : int*bool) = 
    (#2 par, #1 par)


(*
    Essa funcao vai receber dois pares por parâmetro. Os dois pares tem o tipo int * int
    Isso significa que ambas as expressoes dentro de cada par são do tipo int 
    A funcao vai entao smar os quatro valores que compoem esses dois pares
*)
(*TIPO DA FUNCAO: (int*int) * (int*int) -> int*)
fun soma_dois_pares(par1: int*int, par2 : int*int) = 
    (#1 par1) + (#2 par1) + (#1 par2) + (#2 par2)   (*Poderia ser em outra ordem que nao altera o resultado*)


(*
    Essa funcao recebe um numerador e um denominador: x e y. Ambos do tipo int,
    e retorna o resultado da divisão de x por y, e também o resto da divisao de x por y.
*)
(*TIPO DA FUNCAO: int * int -> (int * int) *)
fun div_mod(x : int, y : int) =
    (x div y, x mod y)


(* TIPO DA FUNCAO: (int*int) -> (int*int) *)
fun ordena_par(par : int * int) =   (* ordena_par(4,2) *)
    if (#1 par) < (#2 par)
    then par
    else (#2 par, #1 par)