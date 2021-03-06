structure Temp :> TEMP =
struct
  type temp = int
  type label = Symbol.symbol

  structure Table = IntMapTable(type key = temp
                                fun getInt n = n)

  val temps = ref 100

  fun newtemp() = let val t = !temps in temps := t+1; t end
  fun makestring t = "t" ^ Int.toString t
  fun namedlabel l = Symbol.symbol l
  fun labelToString l = Symbol.name l

  local
    structure F = Format
    fun postinc x = let val i = !x in x := i+1; i end
    val labs = ref 0
  in
    fun newlabel() = Symbol.symbol(F.format "L%d" [F.INT(postinc labs)])
    fun reset() = (labs := 0; temps := 100)
  end
end
