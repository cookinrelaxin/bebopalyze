module Models exposing (..)

import Routing
import Date exposing (Date)
import Task

type alias Model =
  { route : Routing.Route
  , buttons : List Button
  , buttonFormIsVisible : Bool
  , selectedButtonSpecies : ButtonSpecies
  , enteredButtonName : String
  }

type alias Button =
  { name : String
  , creationDate : Date
  , species : ButtonSpecies
  }

type ButtonSpecies
  = Simple
  | Rating

initialModel : Routing.Route -> Model
initialModel route =
  { route = Routing.Home
  , buttons = []
  , buttonFormIsVisible = False
  , selectedButtonSpecies = Simple
  , enteredButtonName = ""
  }
