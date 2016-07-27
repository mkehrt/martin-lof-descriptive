Require Import Map.

Inductive bool : Set :=
  | T
  | F
.

Inductive formula : Set :=
  | var : nat -> formula
  | not : formula -> formula
  | and : formula -> formula -> formula
  | or  : formula -> formula -> formula
.


Definition assignment := Map bool
.

Fixpoint lookup (a : assignment) (x : nat) : bool :=
  match a with
    | istrue y a => (if (x = y) then T else lookup x a)
    | empty => F
  end
.

Fixpoint  check (a : assignment) (f : formula) : bool :=
  T
.
