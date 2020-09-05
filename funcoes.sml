
(*Essa  funcao funciona apenas com y>=0*)
fun pow(x : int, y : int) =     (* val pow = fn : int * int -> int *)
    if y = 0
    then 1
    else x * pow(x, y-1)

fun cube(x : int) =    (* val cube = fn : int -> int *)
    pow(x, 3)    

   

