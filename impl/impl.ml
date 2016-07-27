module SecondOrderExistentialPrenex = struct

  module Variables = struct
    type ty
    type exp
  end
  type 'a var = Var of string

  type kind = KindTy | KindArrow of kind * kind

  type secondOrderExistentialType =
    SecondOrderExistential of Variables.ty var * kind * secondOrderExistentialType
  | FirstOrder of firstOrder

  type secondOrderPath = Head of 

  type firstOrderType
    Path2 of secondOrderPath
  | Var1 of Variables.exp Variables
  | FirstOrderExistential of Variables.exp * firstOrderType * firstOrderType
  | FirstOrderUniversal of Variables.exp * firstOrderType * firstOrderType
  | And of firstOrderType * firstOrderType
  | Or of firstOrderType * firstOrderType
  | Implies of firstOrderType * firstOrderType

end
