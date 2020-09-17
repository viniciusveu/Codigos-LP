datatype minhavar = 
                A of int list
            |   B of int
            |   C of int option * (int option -> int)
            |   D of int * minhavar 


fun minha_fun f t = (* fn : (int -> int) -> minhavar -> int *)
    case t of 
            A x => if null x then 0 else f(hd x) + minha_fun f(A(tl x)) (*x : int list*)
        |   B x => if f x < 0 then f x else f (~x)                      (*x : int*)
        |   C (x,y) => if isSome x andalso y x > 0 then valOf x else 0  (*x : int option, y : int option -> int*)
        |   D (x,y) => f x + minha_fun f y                              (*x : int, y : minhavar*)