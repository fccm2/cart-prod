
let cart_prod_map f la lb =
  let la = List.rev la in
  let lb = List.rev lb in
  List.fold_left (fun (acc, lb) a ->
    let a, bs =
      List.fold_left (fun (a, bs) b ->
        let (a, b) = f a b in
        (a, b::bs)
      ) (a, []) lb
    in
    (a::acc, bs)
  ) ([], lb) la


let cart_prod_filter_map f la lb =
  let la = List.rev la in
  let lb = List.rev lb in
  let la, lb =
    List.fold_left (fun (acc, lb) a ->
      let a, bs =
        List.fold_left (fun (a, bs) b ->
          match a with
          | None -> (a, b::bs)
          | Some a ->
              let (a, b) = f a b in
              match b with
              | Some b -> (a, b::bs)
              | None -> (a, bs)
        ) (Some a, []) lb
      in
      (a::acc, bs)
    ) ([], lb) la
  in
  (List.filter_map (fun a -> a) la, lb)


let cart_prod_filter f la lb =
  let la = List.rev la in
  let lb = List.rev lb in
  let la, lb =
    List.fold_left (fun (acc, lb) a ->
      let a, bs =
        List.fold_left (fun (a, bs) b ->
          match a with
          | None -> (a, b::bs)
          | Some a_ ->
              let (_a, _b) = f a_ b in
              match _a, _b with
              | true, true -> (a, b::bs)
              | false, true -> (None, b::bs)
              | true, false -> (a, bs)
              | false, false -> (None, bs)
        ) (Some a, []) lb
      in
      (a::acc, bs)
    ) ([], lb) la
  in
  (List.filter_map (fun a -> a) la, lb)


let cart_prod_filter_map_fold f acc la lb =
  let la = List.rev la in
  let lb = List.rev lb in
  let acc, la, lb =
    List.fold_left (fun (acc, as_, lb) a ->
      let acc, a, bs =
        List.fold_left (fun (acc, a, bs) b ->
          match a with
          | None -> (acc, a, b::bs)
          | Some a ->
              let (acc, a, b) = f acc a b in
              match b with
              | Some b -> (acc, a, b::bs)
              | None -> (acc, a, bs)
        ) (acc, Some a, []) lb
      in
      (acc, a::as_, bs)
    ) (acc, [], lb) la
  in
  (acc, List.filter_map (fun a -> a) la, lb)

