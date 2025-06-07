Mapping, and eventually filtering and folding, 2 input lists
based on the comparision of their elements as a cartesian-product,
and while preserving their original structure.

So the function:  
```ocaml
val cart_prod_map :
  ('a -> 'b -> 'a * 'b) -> 'a list -> 'b list -> 'a list * 'b list
```

Used like this:  
```ocaml
let chars = ['A'; 'B'; 'C']
let nums = [1; 2; 3; 4]

let cs, ns =
  cart_prod_map (fun c n ->
    if (c, n) = ('A', 3)
    then ('a', 30)
    else (c, n)
  ) chars nums
```

will return:  
```ocaml
val cs : char list = ['a'; 'B'; 'C']
val ns : int list = [1; 2; 30; 4]
```

