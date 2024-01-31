#!/bin/zsh

if [[ ! -n $1 ]]; then
    echo "No parameter passed."
else
    response=$(curl https://pokeapi.co/api/v2/pokemon/$1)

    if [[ $response == *"Not Found"* ]]; then
        echo "Pokemon \"$1\" not found"
    else

        echo "\n$1 (No. $(echo $response | jq '.order'))"
        echo "Id = $(echo $response | jq '.id')"
        echo "Weight = $(echo $response | jq '.weight')"
        echo "Height = $(echo $response | jq '.height')\n"
    fi
fi
