module App.Header where

import Data.Maybe
import Prelude

import Halogen (PropName(..))
import Halogen as H
import Halogen.HTML (IProp, i, prop)
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP

type State = {
    current :: Number
}

data Action = Next | Prev

headerElement :: forall  w i. HH.HTML w i 
headerElement = HH.div [] [ HH.h1_ [ HH.text "Resume" ] ]

header :: forall w i. Int -> HH.HTML w i
header visits = 
    HH.h1_
        [ HH.text $ show visits ]

lakes :: Array String
lakes = [ "Lake Norman", "Lake Wylie" ]

html :: forall w i. HH.HTML w i
html = HH.div_ (map HH.text lakes)

maybeElem :: forall w i a. Maybe a -> (a -> HH.HTML w i) -> HH.HTML w i
maybeElem val f = 
    case val of
    Just x -> f x
    _ -> HH.text ""

-- Render the name, if there is one
renderName :: forall w i. Maybe String -> HH.HTML w i
renderName mbName = maybeElem mbName \name -> HH.text name

whenElem :: forall w i. Boolean -> (Unit -> HH.HTML w i) -> HH.HTML w i
whenElem cond f = if cond then f unit else HH.text ""

-- Render then old number, but only if it is different from the new number
renderOld :: forall w i. { old :: Number, new :: Number } -> HH.HTML w i
renderOld { old, new } = 
    whenElem (old /= new) \_ ->
        HH.div_ [ HH.text $ show old ]


primaryButton :: forall w i. String -> HH.HTML w i
primaryButton label =
    HH.button
        [ HP.classes [ HH.ClassName "primary" ]]
        [ HH.text label ]

-- ComponentHTML and PlainHTML
placeholder :: forall r i. String -> IProp (placeholder :: String | r) i
placeholder = prop (PropName "placeholder")