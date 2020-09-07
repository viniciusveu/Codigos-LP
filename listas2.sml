(* 
    Tuplas: (int * int) -> tipo de tupla que era um par com dois inteiros
    Listas: Para qualquer tipo T, o tipo T list descreve listas em que os tipos que compoes essa lista tem o tipo T;

int list        -> lista que contém só inteiros
bool list       -> lista que contém só valores booleanos
int list list   -> lista que contém listas de inteiros
(int * int) list-> lista que contém pares de inteiros
(int list * list) list -> lista de tuplas em que #1 é uma outra lista de tuplas do tipo int e #2 é um int

 *)

 val list1 = [(2,3), (4,5)];
 val lsit2 = (0,1) :: list1;

 val list3 = [[2,3,4], [5,6,7], [8,9,10]];
 val list4 = [0,1] :: list3;

 (* e1 :: e2 onde e2 é T list, então e1 tem que ser to tipo T *)

null list4; (*null é uma funcao que verifica se a lista esta vazia *)
(* val it = false : bool *)