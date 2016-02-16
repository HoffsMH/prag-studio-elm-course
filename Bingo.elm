module Bingo where
import Html exposing (..)
import Html.Attributes exposing (..)
-- import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)

newEntry : a -> b -> c ->
          { id : c, phrase : a, points : b, wasSpoken : Bool }
newEntry phrase points id =
  {
    phrase    = phrase,
    points    = points,
    wasSpoken = False,
    id        = id
  }


title : String -> Int -> Html
title message times =
  message ++ " "
  |> toUpper
  |> repeat times
  |> trimRight
  |> text


pageHeader : Html
pageHeader =
  h1 [ id "logo", class "classy"] [ title "bingo!" 3]


pageFooter : Html
pageFooter =
  footer []
    [ a [ href "http://www.mhecker.com" ]
        [ text "My Website" ]

    ]


entryItem : { b | phrase : String, points : a } -> Html
entryItem entry =
  li [ ]
  [
    span [ class "phrase"] [text entry.phrase],
    span [ class "points"] [text (toString entry.points)]
  ]


entryList : Html
entryList =
  ul [ ]
    [
      entryItem (newEntry "Future-Proof" 100 1),
      entryItem (newEntry "Doing Agile" 600 2)
     ]


view : Html
view =
  div [ id "container" ]
    [
      pageHeader,
      entryList,
      pageFooter
    ]


main : Html
main =
  view
