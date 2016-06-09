name := ".bootstrap"

scalaVersion in ThisBuild := "2.11.8"

val AkkaVersion: String = "2.4.6"

// These library dependencies are simply used to pre-populate the local ivy cache.
libraryDependencies ++= Seq(
  "com.typesafe.akka" %% "akka-actor" % AkkaVersion,
  "com.typesafe.slick" %% "slick" % "3.1.1",
  "ch.qos.logback" % "logback-core" % "1.1.3",
  "joda-time" % "joda-time" % "2.8.1",
  "org.elasticsearch" % "elasticsearch" % "1.7.4"
)

val root = project.in(file(".")).enablePlugins(PlayScala)
