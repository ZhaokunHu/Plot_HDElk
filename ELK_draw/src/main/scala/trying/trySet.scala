package trying

import spinal.core._

import scala.reflect.runtime.{universe => ru}

case class Person(name: String)
class trySet {

  val l = List(1, 2, 3)
  def ADDE:Int={
    val a=1
    val b=2
    val c=a+b
    c
  }
}

case class Purchase(name: String, orderNumber: Int, var shipped: Boolean)

object trySet{
  def main(args: Array[String]): Unit = {
    val aa=new trySet
    val p = Purchase("Jeff Lebowski", 23819, false)

    val m = ru.runtimeMirror(getClass.getClassLoader)
    val im=m.reflect(new trySet)
    println(im)
    val mathodx=ru.typeOf[trySet].decl(ru.TermName("ADDE")).asMethod
    val mathe=im.reflectMethod(mathodx)
    println(mathe)
    println(mathe())
//    val im=m.reflect(p)
//    println(im)
//    val shippingTermSymb = ru.typeOf[Purchase].decl(ru.TermName("shipped")).asTerm
//
//    val shippingFieldMirror = im.reflectField(shippingTermSymb)
//    println(shippingFieldMirror)
//    val classPerson = ru.typeOf[trySet].typeSymbol.asClass
//    val cm = m.reflectClass(classPerson)
//
//    val ctor = ru.typeOf[trySet].decl(ru.termNames.CONSTRUCTOR).asMethod
//    val ctorm = cm.reflectConstructor(ctor)
//    println(p)


//    def getTypeTag[T: ru.TypeTag](obj: T) = ru.typeTag[T]
//    val theType = getTypeTag(aa.l).tpe
//
//    val decls = theType.decls.take(10)
//
//    println(theType)
  }
}