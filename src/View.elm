module View exposing (..)

import Html exposing(..)
import Html.Attributes exposing(id, class, classList, type', name, placeholder, href, style, src)
import Html.Events exposing(onClick, onInput)
import Messages exposing(..)
import Models exposing(Model, Button, ButtonSpecies)
import Routing exposing (Route(..))

title : String
title = "Welcome to Self Experiment." 
description : String
description = "This application helps you track yourself through tagged buttons. For example, if you want to track your mood, simply create a new rating tag named mood. Rating tags are a form of tag which tracks values from 1 to 10. Then ad libitum throughout the day or week, when you press your mood button, you just pick from a numbers 1 to 10. Thats it! Now your mood at that time and place will be a single data point in your personal database. Over time you will be able to see trends in your mood by day of the week, time of year, location, time of day, and more powerfully - your mood's relationship to your other tags. This way you could change your behavior in order to improve your overall mood. That is just one example of a tag. There is a world of possibilities of other tags and tag forms which could exist. Create as many as you want!"

view : Model -> Html Msg
view model =
  div [ class "ui container" ]
      [ div [ class "ui segment" ]
        [ h1 [ class "ui header" ] [ text title ]
        , p [] [ text description ]
        ]
      , button [ class "ui primary button", onClick ShowButtonForm ] [ text "Create a new Button" ]
      , buttonTable model
      , buttonForm model
      ]

buttonTable : Model -> Html Msg
buttonTable model =
  case List.isEmpty model.buttons of
    True ->
      div [] []
    False ->
      table [ class "ui celled definition table" ]
        [ thead []
          [ tr []
            [ th [] []
            , th [] [ text "Button Type" ]
            , th [] [ text "Creation Date" ]
            ]
          ]
        , buttonList model.buttons
        ]

buttonList : List Button -> Html Msg
buttonList buttons =
  tbody []
   ( List.map buttonRow buttons )
    

buttonRow : Button -> Html Msg
buttonRow button =
  tr []
    [ td [ class "collapsing" ]
      [ Html.button [ class "ui button" ] [ text button.name ]
      ]
    , td [] [ text (toString button.species) ]
    , td [] [ text (toString button.creationDate) ]
    ]

buttonForm : Model -> Html Msg
buttonForm model =
  div
    [
      classList [
        ("ui modal", True),
        ("active", model.buttonFormIsVisible)
      ]
    ]
    [ i [ class "close icon" ] []
    , div [ class "header" ] [ text "Create a new button" ]
    , div [ class "content" ]
      [ div [ class "ui form" ]
        [ div [ class "field" ]
          [ label [] [ text "Button name" ]
          , input [ type' "text", placeholder "e.g. Mood", onInput EnterButtonName ] []
          ]
        , div [ class "field" ]
          [ label [] [ text "Button type" ]
          , div [ class "ui compact menu" ]
            [ div [ class "ui simple dropdown item" ]
              [ text (toString model.selectedButtonSpecies)
              , i [ class "dropdown icon" ] []
              , div [ class "menu" ]
                [ div [ class "item", onClick (SelectButtonSpecies Models.Simple) ] [ text "Simple" ]
                , div [ class "item", onClick (SelectButtonSpecies Models.Rating) ] [ text "Rating" ]
                ]
              ]
            ]
          ]
        ]
      ]
    , div [ class "actions" ]
      [ div [ class "ui black deny button", onClick CancelCreateButton ] [ text "Cancel" ]
      , div [ class "ui positive right labeled icon button", onClick CreateButton ]
        [ text "Create button"
        , i [ class "checkmark icon" ] []
        ]
      ]
    ]
