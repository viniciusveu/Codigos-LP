(* 1. Escreva uma função chamada quantidade_em_mes que recebe uma lista de datas chamada LD e um mês chamado X e retorna
a quantidade de datas em LD que estão no mês X. USE RECURSÃO. *)
fun quantidade_em_mes(data: (int*int*int) list, x: int)=
    if null data then 0
    else
	if x = #2 (hd data)
	then 1 + quantidade_em_mes(tl data, x)
	else 0 + quantidade_em_mes(tl data, x)	   

2)___________________				  
fun quantidade_em_meses(data: (int*int*int) list, x: int list)=
    if null data then 0
    else if null x then 0
    else quantidade_em_mes(data, hd x) + quantidade_em_meses(data, tl x)

3)______________________
fun datas_no_mes(data: (int*int*int) list, x: int)=
    if null data then []
    else
	if x = #2 (hd data)
	then hd data :: datas_no_mes(tl data, x)
	else datas_no_mes(tl data, x)

4)______________________
fun datas_no_mes(data: (int*int*int) list, x: int)=
    if null data then []
    else
	if x = #2 (hd data)
	then hd data :: datas_no_mes(tl data, x)
	else datas_no_mes(tl data, x)

fun datas_nos_meses(data: (int*int*int) list, x: int list)=
    if null data then []
    else if null x then []
    else datas_no_mes(data, hd x) :: datas_nos_meses(data, tl x)

5)_______________________

fun get_nth(cara: string list, x: int)=
    if null cara then ""
    else
	if x > 1 then get_nth(tl cara, x-1)
	else
	    (hd cara)

6)________________________

fun numero_antes_deAlcancar_soma(soma: int, lista: int list)=
    if null lista then 0
    else
	if soma <= (hd lista) then 0
	else
	    1 + numero_antes_deAlcancar_soma(soma-(hd lista),(tl lista))
7)_________________________
val meses = [31, 28, 31, 30 , 31 , 30 , 31 , 31 , 30 , 31 , 30 , 31 ];

fun numero_antes_deAlcancar_soma(soma: int, lista: int list)=
    if null lista then 0
    else
	if soma <= (hd lista) then 1
	else
	    1 + numero_antes_deAlcancar_soma(soma-(hd lista),(tl lista))

fun qual_mes(dia: int)=
    numero_antes_deAlcancar_soma(dia, meses)