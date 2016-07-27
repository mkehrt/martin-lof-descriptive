module SecondOrderExistentialPrenex = struct

  module Variables = struct
    type ty
    type exp
  end
  type 'a var = Var of string

  type kind = KindTy | KindArrow of kind * kind

  type prenex = SecondOrderExistentialPrenex
    of Variables.ty var * kind * prenex
  | FirstOrder

end
