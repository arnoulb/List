type 'a my_list = Item of ('a * 'a my_list) | Empty ;;

let rec cons head tail = Item (head, tail) ;;

let rec length liste = match liste with
| Empty -> 0
| Item (_, tail) -> 1 + (length tail)
;;

let hd liste = match liste with
| Empty -> raise (Failure "hd")
| Item (head, tail) -> head
;;

let tl liste = match liste with
| Empty -> raise (Failure "td")
| Item (head, tail) -> tail
;;

let rec nth liste n = match liste with
| Empty -> raise (Failure "nth")
| Item (head, tail) -> 
if n < 0 then raise (Invalid_argument "nth")
else if n == 0 then head
else nth tail (n-1)
;;

let rec rev_append liste1 liste2 = match liste1 with
  Empty -> liste2
| Item (head, tail) -> rev_append tail (Item (head, liste2))
;;

let rev liste =
rev_append liste Empty
;;

let rec append liste1 liste2 = match liste1 with
| Empty -> liste2
| Item (head, tail) -> (Item (head, (append tail liste2)))
;;

let rec iter f liste = match liste with 
| Empty -> ()
| Item (head, tail) -> f head;
iter f tail
;;

let rec flatten = function
| Empty -> Empty
| Item (head, tail) -> append head (flatten tail)
;;

let rec map f = function
| Empty -> Empty
| Item (head, tail) -> Item ((f head), (map f tail))
;;

let rec fold_left f a liste = match liste with
| Empty -> a 
| Item (head, tail) -> fold_left f (f a head) tail
;;

let rec for_all p = function
| Empty -> true
| Item (head, tail) -> (p head) && (for_all p tail)
;;

let rec exists p = function
| Empty -> false
| Item (head, tail) -> (p head) || (exists p tail)
;;

let rec mem a liste = match liste with
| Empty -> false
| Item (head, tail) -> 
if (a = head) then true 
else (mem a tail)
;;

let rec memq a liste = match liste with
| Empty -> false
| Item (head, tail) -> 
if (a == head) then true 
else (mem a tail)
;;

let rec split = function
| Empty -> (Empty, Empty)
| Item ((head, tail), tail2) -> let (x, y) = split tail2 in (Item(head, x), Item(tail, y))
;;

let rec combine liste1 liste2 =
match (liste1, liste2) with
| (Empty, Empty) -> Empty
| (Item (head1, tail1), Item (head2, tail2)) -> Item ((head1, head2), (combine tail1 tail2))
| (_, _) -> raise (Invalid_argument "combine")
;;


let partition p liste = 
let rec _partition x y = function
| Empty -> (rev x, rev y)
| Item (head, tail) -> if p head then _partition (Item (head, x)) y tail else _partition x (Item (head, y)) tail 
in _partition Empty Empty liste
;;

let filter p = 
let rec _filter l = function
| Empty -> rev l
| Item (head, tail) -> 
if p head then _filter (Item (head, l)) tail 
else _filter l tail 
in _filter Empty 
;;

let rec sort cmp liste = 
let rec _sort = function
| Item (head, Item(head2, tail)) when (cmp head head2) >= 0 -> Item (head2, _sort (Item (head, tail)))
| Item (head, Item(head2, tail)) -> Item (head, _sort (Item (head2, tail)))
| liste -> liste
in
let t = _sort liste in
if t = liste then t
else sort cmp t
;;

let rec fold_right f liste b = match liste with
| Empty -> b
| Item (head, tail) -> f b (fold_right f tail b)
;;
