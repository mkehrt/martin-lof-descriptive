module SecondOrderExistentialPrenex = struct

  (* e.g. Exists X: type. Exists P: X -> type. exists x: X. P(x) *)
  (* ???? (forbidden as is)

    Exists: R: X -> type.
    Exists P: R(x) -> type.
      P(x)
      
   *)

  module Variables = struct
    type exp
    type ty
    
    type 'a t = Var of string
  end

  module PredicateType = struct
    type t =
      Pred of Variables.ty Variables.t
    | App of t * Variables.exp
  end

  module PredicateKind = struct
    type t =
      Type
    | Arrow of Variables.ty * t
  end

  module PredicateExpression = struct
    type t = Var of Variables.exp Variables.t
  end

  module FirstOrderType = struct
  type t =  
      Predicate of PredicateType.t
    | FirstOrderExistential of Variables.exp * PredicateType.t * t
    | FirstOrderUniversal of Variables.exp * PredicateType.t * t
    | And of t * t
    | Or of t * t
    | Implies of t * t
  end

  module SecondOrderExistentialType = struct
    type t =
      SecondOrderExistential of
        Variables.ty Variables.t *
        PredicateKind.t *
        t
    | FirstOrder of FirstOrderType.t
  end

  module FirstOrderExpression = struct
    type t = 
      ...
    | FirstOrderExistentialPair of t * type
    | ...
    | FirstOrderUniversalLambda of 

end
