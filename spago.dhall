{ name = "resume"
, dependencies =
  [ "console", "effect", "halogen", "prelude", "psci-support", "random" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
