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


initialModel : { entries : List
  { id : number,
    phrase : String,
    points : number',
    wasSpoken : Bool }}
initialModel =
  { entries =
    [ newEntry "Doing Agile" 200 2,
      newEntry "In the Cloud" 300 3,
      newEntry "Future-Proof" 100 1
    ]
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


entryList :  List { b | phrase : String, points : a } -> Html
entryList  entries =
  ul [ ] (List.map entryItem entries)



view : { b | entries : List { b | phrase : String, points : a, id: number, wasSpoken: Bool } } -> Html
view model =
  div [ id "container" ]
    [
      pageHeader,
      entryList model.entries,
      pageFooter
    ]


main : Html
main =
  view initialModel
