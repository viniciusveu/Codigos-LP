(* 1. Escreva uma função chamada quantidade_em_mes que recebe uma lista de datas chamada LD e um mês chamado X e retorna
a quantidade de datas em LD que estão no mês X. USE RECURSÃO. *)
fun quantidade_em_mes(datas : (int * int * int) list, X : int) =
    if null datas then 0
    else
	if X = #2 (hd datas)
	then 1 + quantidade_em_mes(tl datas, X)
	else 0 + quantidade_em_mes(tl datas, X)	   


(* 2. Escreva uma função chamada quantidade_em_meses que recebe por parâmetro uma lista de datas LD e uma lista de meses LM
e retorna a quantidade de datas na lista de datas LD que estão em qualquer um dos meses na lista de meses LM. Assuma que a lista de
meses não tem meses repetidos. Dica: Use o que você fez no exercício 1. USE RECURSÃO. *)
fun quantidade_em_meses(datas : (int * int * int) list, X : int list) =
    if null datas then 0
    else if null X then 0
    else quantidade_em_mes(datas, hd X) + quantidade_em_meses(datas, tl X)


(* 3. Escreva uma função chamada datas_no_mes que recebe uma lista de datas e um mês por parâmetro e retorna uma lista com
todas as datas da lista de datas que estão no mês passado por parâmetro. A lista retornada deve conter as datas na ordem em que foram
originalmente passadas no parâmetro. USE RECURSÃO. *)
fun datas_no_mes(datas : (int * int * int) list, x : int) =
    if null datas then []
    else
	if x = #2 (hd datas)
	then hd datas :: datas_no_mes(tl datas, x)
	else datas_no_mes(tl datas, x)


(* 4. Escreva uma função chamada datas_nos_meses que recebe uma lista de datas e uma lista de meses por parâmetro e retorna
uma lista contendo todas as datas da lista de datas recebida por parâmetro que estão em qualquer dos meses na lista de meses. Assuma
que a lista de meses não tem meses repetidos. Dica: use sua resposta para o exercício anterior. USE RECURSÃO. *)
fun datas_no_mes(datas : (int * int * int) list, x : int) =
    if null datas then []
    else
	if x = #2 (hd datas)
	then hd datas :: datas_no_mes(tl datas, x)
	else datas_no_mes(tl datas, x)

fun datas_nos_meses(datas : (int * int * int) list, X : int list) =
    if null datas then []
    else if null X then []
    else datas_no_mes(datas, hd X) :: datas_nos_meses(datas, tl X)


(* 5. Escreva uma função chamada get_nth que recebe uma lista de strings por parâmetro e um int n e retorna o n-ésimo elemento da lista.
O cabeça da lista é a primeira string. Não se preocupe com o caso em que a lista tem poucos elementos: sua função deve aplicar hd ou tl
à lista vazia, o que nesse caso está ok. USE RECURSÃO. *)
fun get_nth(STR : string list, x : int) =
    if null STR then ""
    else if x > 1 then get_nth(tl STR, x-1)
	else (hd STR)


(* 6. Escreva uma função chamada numero_antes_deAlcancar_soma que recebe por parâmetro um int positivo chamado soma,
e uma int list contendo somente números positivos. Sua função deve retornar um inteito n de modo que a soma dos primeiros n
elementos da lista deve ser menor do que o valor de soma, mas a soma dos primeiros n + 1 elementos da lista deve ser igual ou maior
que soma. Assuma que a soma de todos os valores na lista resulta em um valor maior que o valor passado em soma. USE RECURSÃO. *)
fun numero_antes_deAlcancar_soma(soma : int, LIST : int list) =
    if null LIST then 0
    else
	if soma <= (hd LIST) then 0
	else
	    1 + numero_antes_deAlcancar_soma(soma - (hd LIST), (tl LIST))


(* 7. Escreva uma função chamada qual_mes que recebe um dia do ano por parâmetro (um inteiro entre 1 e 365) e retorna a qual mês
aquele dia pertence (1 para janeiro, 2 para fevereiro, etc). Use uma lista com 12 inteiros e sua resposta para o exercício anterior. USE
RECURSÃO. *)
val meses = [31, 28, 31, 30 , 31 , 30 , 31 , 31 , 30 , 31 , 30 , 31 ];

fun numero_antes(soma : int, LIST : int list) =
    if null LIST then 0
    else
	if soma <= (hd LIST) then 1
	else
	    1 + numero_antes(soma -(hd LIST),(tl LIST))

fun qual_mes(dia : int)=
    numero_antes(dia, meses)


(* 8. Escreva uma função chamada mes_faixa que recebe duas datas do ano por parâmetro: data1 e data2 (as datas são pares
somente com dia e mês) e retorna uma int list [m1, m2, ..., mn] onde m1 é o mês da data1, m2 é o mês da data1+1,
..., e mn é o mês da data2. Note que a lista resultante terá o tamanho mes2 – mes1 + 1 ou tamanho 0 se data1 > data2. USE
RECURSÃO. *)

fun adiciona_meses(mes1 : int, mes2 : int) = 
    if mes1 > mes2 then []
    else
        let val meses_entre = adiciona_meses(mes1+1, mes2)
        in 
            mes1 :: meses_entre
        end


fun mes_faixa(data1 : int * int, data2 : int * int) =  
    adiciona_meses(#2 data1, #2 data2)
    