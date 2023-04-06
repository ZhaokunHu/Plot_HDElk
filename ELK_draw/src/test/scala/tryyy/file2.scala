import scala.reflect.internal.util.BatchSourceFile
import scala.tools.nsc.Settings
import scala.tools.nsc.interpreter._
import scala.tools.nsc._
import scala.tools.nsc.reporters.ConsoleReporter

object FunctionAnalyzer {
  def analyzeClass(className: String): Unit = {
    // 创建编译器设置
    val settings = new Settings
    settings.usejavacp.value = true

    // 创建编译器和解释器
    val compiler = new Global(settings)
    val interpreter = new IMain(settings)

    // 定义要编译的代码
    val code = s"import $className._"

    // 编译代码并获取编译结果
    val run = new compiler.Run
    val reporter = new ConsoleReporter(settings)
    val source = new BatchSourceFile("<stdin>", code)
    run.compileSources(List(source))

    // 获取类的符号
    val classSymbol = compiler.rootMirror.staticModule(className)

    // 获取类的类型
    val classType = classSymbol.typeSignature

    // 获取类的所有成员
    val members = classType.members.filter(_.isMethod)

    // 遍历类的成员
    members.foreach { member =>
      // 获取函数的名称
      val name = member.name.toString

      // 获取函数的类型
      val tpe = member.typeSignatureIn(classType)

      // 获取函数的参数
      val params = tpe.params.map(_.name.toString)

      // 获取函数的返回值类型
      val returnType = tpe.finalResultType.toString

      println(s"$name(${params.mkString(", ")}): ${returnType.getClass.getSimpleName}")
    }
  }
}
import spinal.core._

object MyModule extends Component {
  def add(a: UInt, b: UInt): UInt = a + b

  def subtract(a: UInt, b: UInt): UInt = a - b

  val c: UInt = add(1, 2)
val ccc=2
}

object MyClass {
    def add(a: Int, b: Int): Int = a + b
    def subtract(a: Int, b: Int): Int = a - b
  }

object Main {
  def main(args: Array[String]): Unit = {
    FunctionAnalyzer.analyzeClass("MyModule")
  }
}
