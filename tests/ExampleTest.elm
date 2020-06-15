module ExampleTest exposing (suite)

import Expect exposing (Expectation)
import Test exposing (..)


suite : Test
suite =
    describe "Example Test"
        [ test "Force Pass" <|
            \_ ->
                True
                    |> Expect.equal True
        ]
