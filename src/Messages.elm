module Messages exposing (Msg(..))

import Routing exposing (Route(..))

import Date exposing (Date)
import Models exposing (ButtonSpecies)

type Msg
  = ShowButtonForm
  | CancelCreateButton
  | CreateButton
  | SelectButtonSpecies ButtonSpecies
  | EnterButtonName String
  | GetDateSuccess Msg Date
  | GetDateFailure String
