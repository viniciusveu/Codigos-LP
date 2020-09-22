(* Lista de exercícios LP - Unidade 2 
Aluno: Vinicius Vedovotto, RA: 171257499 *)

(* Definição do datatype que vocês vão usar para essa lista *)
datatype json =
         Num of real (* real é como a SML chamada números em ponto flutuante *)
       | String of string
       | False
       | True
       | Null
       | Array of json list
       | Object of (string * json) list

(* alguns exemplos de valores do tipo json *)
val json_pi    = Num 3.14159
val json_hello = String "hello"
val json_false = False
val json_array = Array [Num 1.0, String "world", Null]
val json_obj   = Object [("foo", json_pi), ("bar", json_array), ("ok", True)]

(* algumas linhas de código que usam a biblioteca padrão e/ou algumas coisas 
	que ainda não aprendemos *)


(* dedup : string list -> string list -- faz remoção de duplicações *)
fun dedup xs = ListMergeSort.uniqueSort String.compare xs

(* strcmp : string * string -> compara strings em ordem alfabética
   onde a ordem do datatype é = LESS | EQUAL | GREATER *)
val strcmp = String.compare                                        
                        
(* converte um int para um real *)
val int_to_real = Real.fromInt

(* valor absoluto de um real *)
val real_abs = Real.abs

(* converte um real para uma string *)
val real_to_string = Real.toString

(* returna true se um real é negativo : real -> bool *)
val real_is_negative = Real.signBit


(**** Coloque sua soluções para os exercícios 1-8 AQUI ****)

(* 1. Escreva uma função criar_json que recebe um inteiro i e retorna um JSON. O resultado deve
representar um array JSON de objetos JSON em que todo objeto nesse array tem dois atributos:
“n” e “b”. Todo atributo “b” de um objeto deve ser true. O primeiro objeto no array deve
conter um atributo “n” que guarda o número JSON i.0, o próximo objeto deve ter seu atributo
“n” guardando (i-1).0 e assim por diante até que o último objeto no array tenha seu atributo
“n” guardando o valor 1.0. Se i for 0, deve ser produzido um array com 0 objetos. Assuma
que i nunca será negativo. É possível resolver esse exercício com menos de 10 linhas. Dica: Foi
disponibilizada uma função int-to-real. Você vai precisar também de uma função auxiliar que
faz quase que todo o trabalho necessário. *)

(* result : Array [  Object[("n", Real.i), ("b", True) ] , Object[("n", Real.(i-1)), ("b", True)] , Object[ ("n", Real.1), ("b", True)] ] *)
fun make_list i =
   let val real = int_to_real i
   in
	   if (i = 0) then []
	   else Object [("n", Num real), ("b", True)] :: make_list(i - 1)
   end
	
fun criar_json i =
   let val LIST = make_list i
   in
      Array LIST
   end


       
(* 2. Escreva uma função assoc do tipo “a * (“a * ‘b) list -> ‘b option que recebe dois
argumentos k e xs. Essa função deve retornar SOME v1 se (k1, v1) é o par da lista que está
mais próximo ao começo da lista para a qual k e k1 são iguais. Se não existir um par (k1, v1)
ideal, a função deve retornar NONE. A solução também requer poucas linhas de código. *)  

fun assoc (k, xs) =
   case xs of
	      [] => NONE
	   |  x :: list_tl =>
	case x of 
      (k1, v1) =>
	      if (k1 = k) then SOME v1
	      else assoc (k, list_tl)  


		       
(* 3. Escreva uma função dot que recebe um JSON (chame de j) e a uma string (chame de f) e retorna
uma JSON option. Se j for um objeto que tem um atributo chamado f, então a função deve
retornar SOME v, onde v é o conteúdo do atributo. Se j não é um objeto ou não contém um atributo
f, então a função deve retornar NONE. É possível resolver esse exercício com 4 linhas de código e
usando um dos exercícios anteriores. *)

fun dot (f, j) =
   case j of
	      Object LIST => assoc (f, LIST)
      |  _ => NONE


		 
(* 4. Escreva uma função um_atributo que recebe um JSON e retorna uma string list. Se o
argumento é um objeto, a função deve retornar uma lista contendo todos os nomes dos atributos
(mas não o conteúdo dos atributos). Caso contrário, uma lista vazia deve ser retornada. Use uma
função auxiliar local com recursão de calda. Pode ser que apareça como resultado uma string em
ordem reversa daquela que aparece no objeto, se isso acontecer está correto também. A solução
precisa de aproximadamente 11 linhas de código. *)

fun um_atributo j =
   case j of
      Object ls =>
         let fun pega_att list =
            let val s = []
            in
               case list of
                     [] => s
                  |  list_head :: list_tl  => 
                        case list_head of
                           (chave, valor) => chave :: pega_att list_tl
            end
         in
            pega_att ls
         end
      |  _ => [] 


		
(* 5. Escreva uma função sem_repeticao que recebe uma string list e retorna um bool que é
true se e somente se a string aparece mais de uma vez na entrada recebida. Não (!) use nenhuma
recursão explícita. Ao invés disso, use as funções auxiliares lenght (pré-definida na SML) e
dedup (disponibilizada em arquivo) para resolver esse exercício usando só uma linha de código. *)

fun lenght [] = 0
   |  lenght (head :: tl) = 1 + lenght tl;
		
fun sem_repeticao str_list =
   lenght str_list = lenght (dedup(str_list))


	     
(* 6. Escreva uma função sem_atributos_repetidos_recursivos que recebe um JSON e retorna
um bool que é true somente se nenhum objeto “dentro” (arbitrariamente aninhado) do
argumento JSON tiver nomes repetidos para atributos. *)

fun sem_atributos_repetidos_recursivos j =
   let val att = um_atributo j
   in
	   if sem_repeticao att then false
	   else true
   end


	
(* 7. Escreva uma função contar_ocorrencias do tipo string list * exn -> (string *
int) list. Se o argumento string list estiver ordenado (em termos da ordenação da função
strcmp que foi fornecida para vocês), a função deve retornar uma lista em que cada string é
pareado com o número de vezes que ela ocorre. (A ordem na lista resultante não importa). Se a
lista não estiver ordenada, lançar o argumento exn. Sua implementação deve fazer uma única
passada sobre a lista string list, usando uma função auxiliar com recursão de calda. A função
auxiliar pode precisar de alguns argumentos, que incluem a string “atual” e o contador de “atual”.
É possível solucionar em aproximadamente 14 linhas. *)

fun contar_ocorrencias (strList, exn) =
   let fun aux (ls, soma, v)=
	   case ls of
	         x :: [] => (x,v) :: soma
	      |  x :: y :: xs => 
               let val s = strcmp(x,y)
               in
                  case s of
                        GREATER => raise exn
                     |  EQUAL => aux(y :: xs, soma, v+1)
                     |  LESS => 
                           ((x,v) :: aux(y :: xs, soma, 1))
               end
	      |  _  => soma
   in
	   aux(strList,[],1)
   end


	
(* 8. Escreva uma função valores_string_para_atributos do tipo string * (json list)-
> string list (os parênteses nesse tipo são opcionais, o REPL não irá imprimi-los). Para
qualquer objeto na json list que tenha um atributo igual a string e que tenha conteúdo que
seja uma string json (por exemplo, String “hi”) coloque o conteúdo da string (por exemplo
“hi”) na lista resultante (a ordem não importa, a saída pode ter repetições quando necessário).
Assuma que nenhum objeto tenha nomes repetidos para atributos. É possível solucionar com 6
linhas graças à função dot. *)
					  
fun valores_string_para_atributos (str, jsonList) =
   case jsonList of
	         [] => []
	      |  json :: jsonList'  => 
               case dot (json, str) of 
                     SOME (String a) => a :: valores_string_para_atributos (str, jsonList')
                  |  _ => valores_string_para_atributos(str, jsonList')
	    


