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



