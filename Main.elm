module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int }


init : Browser.Env () -> ( Model, Cmd Msg )
init _ =
    ( { count = 0 }, Cmd.none )


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        Decrement ->
            ( { model | count = model.count - 1 }, Cmd.none )


view : Model -> Browser.Page Msg
view model =
    { title = "SSCCE"
    , body =
        [ button [ onClick Increment ] [ text "+1" ]
        , div [] [ text <| String.fromInt model.count ]
        , button [ onClick Decrement ] [ text "-1" ]
        ]
    }


main : Program () Model Msg
main =
    Browser.fullscreen
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onNavigation = Nothing
        }

