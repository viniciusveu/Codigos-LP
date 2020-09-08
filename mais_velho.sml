
fun data_correta(data : int * int * int) =
    if #1 data > 0 andalso #1 data <= 31
    then 
        if #2 data > 0 andalso #2 data <= 12
        then 
            if #3 data > 0 
            then true 
            else false
        else false 
    else false


fun mais_velho(data1 : (int * int * int), data2 : (int * int * int)) =
    let
        val dia1 = #1 data1;
        val mes1 = #2 data1;
        val ano1 = #3 data1;
        val dia2 = #1 data2;
        val mes2 = #2 data2;
        val ano2 = #3 data2;
    in
        if data_correta data1 
        then 
            if data_correta data2 
            then  
                if ano1 < ano2 
                then true 
                else 
                    if ano1 = ano2 
                    then 
                        if mes1 < mes2 
                        then true
                        else 
                            if mes1 = mes2
                            then
                                if dia1 < dia2
                                then true 
                                else false
                            else false
                    else false 
            else false
        else false
    end