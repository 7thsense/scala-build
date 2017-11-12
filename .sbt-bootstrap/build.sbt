name := ".bootstrap"

scalaVersion in ThisBuild := "2.12.4"

val AkkaVersion: String = "2.5.4"

// These library dependencies are simply used to pre-populate the local ivy cache.
libraryDependencies ++= Seq(
  "com.typesafe.akka" %% "akka-actor" % AkkaVersion
)

val root = project.in(file(".")).enablePlugins(PlayScala)
