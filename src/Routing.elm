module Routing exposing (..)

import String
import Navigation
import UrlParser exposing (..)

type Route
  = Home
  | NotFound

matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ format Home (s "")
    , format Home (s "home")
    ]

hashParser : Navigation.Location -> Result String Route
hashParser location =
  location.hash
    |> String.dropLeft 1
    |> parse identity matchers

parser : Navigation.Parser (Result String Route)
parser =
  Navigation.makeParser hashParser

routeFromResult : Result String Route -> Route
routeFromResult result =
  case result of
    Ok route ->
      route

    Err route ->
      NotFound
