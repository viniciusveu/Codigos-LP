(*
PARES: e = (e1, e2)         -> (t1 * t2) | #1 e, #2 e

TRIPLAS: e = (e1, e2, e3)   -> (t1 * t2 * t3) | #1 e, #2 e, #3 e

TUPLAS: e = (e1, ... , en)  -> (t1, ... , tn) | #1 e, ... , #n e

SINTAXE PARA TUPLAS:
    e = (e1, e2, e3, ... , en) -> (t1 * t2 * t3 * ... * tn)
    ACESSO: # + i número que corresponde a posiço do elemento na tupla
        Ex.: #3 e -> acessar o terceiro elemento da tupla

CHECAGEM DE TIPOS e AVALIACAO:
    Ex 01: 
        e = (e1, e2, e3, ... , en)
        ambiente estatico: e -> (t1 * t2, t3 * ... * tn)
        ambiente dinamico: e -> (v1, v2, v3, ... , vn)

        e = (23, 54, 2, 4)
        ambiente estatico: e -> (int * int * int * int)
        ambiente dinamico: e -> (23, 54, 2, 4)
            #2 e -> 54

    Ex 02:
        val x = 23
        ambiente estatico: x -> int
        ambiente dinamico: x -> 23

        e = (x, 54, 2, 4)    **checa primeiro a variavel
        ambiente estatico: x -> int, e -> (int * int * int * int)
        ambiente dinamico: x -> 23, e -> (23, 54, 2, 4)

    Ex 03: 
        val x = 23
        ambiente estatico: x -> int
        ambiente dinamico: x -> 23

        val y = x + 2     (int + int)->int
        ambiente estatico: x -> int, y -> int
        ambiente dinamico: x -> 23, y -> 25

        e = (x, y, 2, 4+1)   ?+? : int+int -> int, 4+1 -> 5
        ambiente estatico: x -> int, y -> int, e -> (int * int * int * int)
        ambiente dinamico: x -> 23, y -> 25, e -> (23, 25, 2, 5)

PARES E TUPLAS PODEM SER ANINHADOS -> Isso significa que podemos colocar tuplas dentro de tuplas, dentro de tuplas, etc

Ex.: 
    val x1 = (7, (true, 9)) -> (int * (bool*int))

    val x2 = #1 (#2 x1)
                (true, 9)
                 true -> bool
                 x2 -> bool

    val x3 = (#2 x1)
            (true, 9) -> (bool * int)
            x3 -> (bool * int)

    val x4 = ( (3,5), ((4,8),(0,0)) ) -> ( (int*int)* ((int*int)*(int*int)) )

*)