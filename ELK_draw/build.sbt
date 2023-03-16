scalaVersion := "2.11.12"

libraryDependencies ++= Seq(
  "com.github.spinalhdl" % "spinalhdl-core_2.11" % "1.8.0",
  "com.github.spinalhdl" % "spinalhdl-lib_2.11" % "1.8.0",
  compilerPlugin("com.github.spinalhdl" % "spinalhdl-idsl-plugin_2.11" % "1.8.0")
)

fork := true