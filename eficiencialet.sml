
fun countup(from : int, to : int) =
    if from = to
    then to::[]
    else from :: countup(from+1, to) 

fun countdown(from : int, to : int) =
    if from = to
    then to::[]
    else from :: countdown(from-1, to) 


fun bad_max(xs : int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs 
    else if hd xs > bad_max(tl xs)
    then hd xs 
    else bad_max(tl xs)

fun good_max(xs : int list) = 
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else 
        let val max_val = good_max(tl xs)
        in
            if hd xs > max_val
            then hd xs
            else max_val
        end


(* 
- countup(1,30);
val it = [1,2,3,4,5,6,7,8,9,10,11,12,...] : int list
- bad_max(countup(1,30)); //super delay
val it = 30 : int
- bad_max(countdown(30,1)); //sem delay
val it = 30 : int
- good_max(countup(1,100)); //sem delay
val it = 100 : int 
*)
