val cart_prod_map :
  ('a -> 'b -> 'a * 'b) -> 'a list -> 'b list -> 'a list * 'b list

val cart_prod_filter :
  ('a -> 'b -> bool * bool) -> 'a list -> 'b list -> 'a list * 'b list

val cart_prod_filter_map :
  ('a -> 'b -> 'a option * 'b option) -> 'a list -> 'b list -> 'a list * 'b list

val cart_prod_filter_map_fold :
  ('a -> 'b -> 'c -> 'a * 'b option * 'c option) -> 'a -> 'b list -> 'c list -> 'a * 'b list * 'c list

