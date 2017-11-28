#!/usr/bin/ocaml
#use "mylist.ml" ;;

let a = Item("eggs", Item("bread", Item("Pizza", Item("last", Empty)))) ;;
let b = Item(1, Item(2, Item (3, Item( 4, Empty )))) ;;
let ingredients = Item ("flour", Item ("butter", Item ("milk" , Item ("sugar", Empty))));;

let to_flat = Item(Item("a", Item("b", Empty)), Item(Item("d", Item("c", Empty)), Empty)) ;;
let to_split = Item((Item ("1", Empty), Item("2", Empty)), Item((Item("3", Empty ), Item("4", Empty)), Empty)) ;;

print_endline "Test cons :" ;;
cons "test", Empty ;;
print_endline "Test hd :" ;;
(hd ingredients) ;;
print_endline "Test tl :" ;;
tl ingredients ;;
print_endline "Test nth :" ;;
nth ingredients ;;
print_endline "Test rev :" ;;
rev ingredients ;;
print_endline "Test append :" ;;
append ingredients a ;;
print_endline "Test append :" ;;
rev_append ingredients a ;;
print_endline "Test flatten :" ;;
flatten to_flat ;;
print_endline "Test iter :" ;;
iter print_endline ingredients ;;
print_endline "Test map :" ;;
map (fun x -> x +2) b ;;
print_endline "Test fold_left :" ;;
fold_left (+) 0 b;;
print_endline "Test exists :" ;;
exists ( fun x -> x > 6 ) b ;;
print_endline "Test for_all :" ;;
for_all ( fun x -> x > 6 ) b ;;
print_endline "Test mem :" ;;
mem "flour" ingredients ;;
print_endline "Test memq :" ;;
memq (nth ingredients 2) ingredients ;;
memq "flour" ingredients ;;
print_endline "Test filter :" ;;
filter (fun x -> x > 2) b ;;
print_endline "Test split :" ;;
split to_split ;;
print_endline "Test Combine :" ;;
combine ingredients a ;;
print_endline "Test partition :" ;;
partition (fun x -> x > 2) b ;;
print_endline "Test sort :" ;;
sort compare ingredients ;;

