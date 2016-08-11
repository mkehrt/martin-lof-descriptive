module SecondOrderExistentialPrenex = struct

  (* e.g. Exists X: type. Exists P: X -> type. exists x: X. P(x) /\ True *)
  (* [X: type; x: X, y: X, z: X], [P: X -> type; p: P(x), q: P(y)], x, (p, T) *)
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
    | True
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
      PredicateConstructor of Variables.exp 
    | FirstOrderExistentialPair of t * t
    | FirstOrderExistentialLet of t * Variables.exp * t
    | FirstOrderUniversalLambda of Variables.exp * FirstOrderType.t * t
    | FirstOrderUniversalApplication of t * t
    | Pair of t * t
    | ProjLeft of t
    | ProjRight of t
    | InjLeft of t * FirstOrderType.t
    | InjRight of FirstOrderType.t * t
    | Case of t * Variables.exp * t * Variables.exp * t
    | Lambda of Variables.exp * FirstOrderType.t * t
    | Application of t * t
    | T
  end

  let typecheck pCtx tCtx eCtx e =
    match e with
    (*  PredicateConstructor x = lookupCtor x
    | FirstOrderExistentialPair t e => *)

     _ -> FirstOrderType.True
  

end
