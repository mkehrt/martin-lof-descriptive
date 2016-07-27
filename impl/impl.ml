module SecondOrderExistentialPrenex = struct

  module Variables = struct
    type ty
    type exp
    
    type 'a t = Var of string
  end

  module Kind = struct
    type t = Type | Arrow of t * t
  end

  module SecondOrderPath = struct
    type t =
      Head of Variables.ty Variables.t
    | Cons of t * Variables.exp Variables.t
  end

  module FirstOrderType = struct
  type t =  
      Path2 of SecondOrderPath.t
    | FirstOrderExistential of Variables.exp * t * t
    | FirstOrderUniversal of Variables.exp * t * t
    | And of t * t
    | Or of t * t
    | Implies of t * t
  end

  module SecondOrderExistentialType = struct
    type t =
      SecondOrderExistential of
        Variables.ty Variables.t *
        Kind.t *
        t
    | FirstOrder of FirstOrderType.t
  end

end
