signature TEMP =
sig
  eqtype temp
  val reset : unit -> unit
  val newtemp : unit -> temp
  val compare : temp * temp -> order
  val makestring: temp -> string
  type label = Symbol.symbol
  val newlabel : unit -> label
  val namedlabel : string -> label
  val labelToString : label -> string
  structure Set : ORD_SET sharing type Set.Key.ord_key = temp
  structure Map : ORD_MAP sharing type Map.Key.ord_key = temp
end