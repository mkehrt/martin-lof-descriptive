(* Turing machines. *)

Inductive tapesymbol : Set :=
  | onet : tapesymbol
  | zerot : tapesymbol
  | accept : tapesymbol
.

Inductive stack : Set :=
  | empty : stack
  | cell: tapesymbol -> stack -> stack
.

Inductive tape : Set :=
  tapec : stack -> stack -> tapesymbol -> tape
.

Inductive machine : Set :=
  machinec : tape -> machine
.

Inductive inputsymbol : Set :=
  | zeroi : inputsymbol
  | onei : inputsymbol
.

Inductive command : Set := 
  | left : command
  | right : command
  | write : tapesymbol -> command
.



