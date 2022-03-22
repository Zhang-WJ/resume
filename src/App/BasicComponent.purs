module App.BasicComponent where

import Prelude

import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE

-- Input
-- type Input = Unit

-- State
type State = Int

-- Actions
data Action = Increment | Decrement

-- The Component
component :: forall query input output m. H.Component query input output m
component = 
    H.mkComponent
        { -- First, the first state 
            initialState
           ,render
           ,eval: H.mkEval $ H.defaultEval {handleAction = handleAction} 
        
        }

initialState :: forall input. input -> State
initialState _ = 0 

handleAction :: forall output m. Action -> H.HalogenM State Action () output m Unit
handleAction = case _ of
    Decrement -> 
        H.modify_ \state -> state - 1
    Increment ->
        H.modify_ \state -> state + 1

-- Rendering
render :: forall m. State -> H.ComponentHTML Action () m
render state = 
    HH.div_
        [ HH.button [HE.onClick \_ -> Decrement] [HH.text "-"]
        , HH.text (show state)
        , HH.button [HE.onClick \_ -> Increment] [HH.text "+"]]

