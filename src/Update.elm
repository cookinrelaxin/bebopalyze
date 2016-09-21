port module Update exposing (..)

import Navigation
import Messages exposing(Msg(..))
import Routing exposing(Route(..))
import Models exposing(Model)

import String
import Date
import Task

port openDropdown : String -> Cmd msg

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of

    ShowButtonForm ->
      ( { model | buttonFormIsVisible = True }, Cmd.none )

    CancelCreateButton ->
      ( { model | buttonFormIsVisible = False }, Cmd.none )

    CreateButton ->
      if String.isEmpty model.enteredButtonName then
         ( model, Cmd.none )
      else
         -- newButton = { name = model.enteredButtonName, creationDate = 
         -- ( { model | buttonFormIsVisible = False, buttons  }, Cmd.none )
         ( model, Task.perform GetDateFailure (GetDateSuccess CreateButton) Date.now )

    GetDateSuccess CreateButton date ->
      let
          newButton = { name = model.enteredButtonName, creationDate = date, species = model.selectedButtonSpecies }
      in
         ( { model | buttonFormIsVisible = False, buttons = [newButton] ++ model.buttons}, Cmd.none )

    GetDateSuccess _ date ->
      ( model, Cmd.none )

    GetDateFailure _ ->
      ( model, Cmd.none )

    SelectButtonSpecies species  ->
      ( { model | selectedButtonSpecies = species }, Cmd.none )

    EnterButtonName name  ->
      ( { model | enteredButtonName = name }, Cmd.none )
