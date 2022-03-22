module Main where

import Prelude

import App.BasicComponent as Counter
import App.Button as Button
import App.RandomNum as RandomNum
import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI RandomNum.component unit body
