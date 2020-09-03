(* Isso é um comentário do meu 1º prog em ML *)

val x = 34;
(* ambiente estático: x --> int *)
(* ambiente dinâmico: x --> 34*)

val y = 17;
(* ambiente estático: x --> int, y --> int *)
(* ambiente dinâmico: x --> 34, y --> 17 *)

val z = (x + y) + (y + 2);
(* ambiente estático: x --> int, y --> int, z --> int *)
(* ambiente dinâmico: x --> 34, y --> 17, z --> 70 *)

val q = z + 1; 
(* ambiente estático: x --> int, y --> int, z --> int, q --> int *)
(* ambiente dinâmico: x --> 34, y --> 17, z --> 70 q --> 71 *)

val abs_of_z = if z < 0 then 0 - z else z; (* bool *) (* int *)
(* ambiente estático: x --> int, y --> int, z --> int, q --> int, abs_of_z --> int *)
(* ambiente dinâmico: x --> 34, y --> 17, z --> 70, q --> 71, abs_of_x --> 70 *)

val abs_of_z_simpler = abs z;