module Bingo where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

title message times =
  message ++ " "
  |> toUpper
  |> repeat times
  |> trimRight
  |> text

pageHeader =
  h1 [ id "logo", class "classy"] [ title "bingo!" 3]

pageFooter =
  footer []
    [ a [ href "http://www.mhecker.com" ]
        [ text "My Website" ]
    ]


view =
  div [ id "container" ] [ pageHeader, pageFooter ]

main =
  view
