#!/bin/bash


build_indexer(){

    echo "Building Indexer..."
    cd indexer/main
    go build -o indexer
    cp indexer ../../bin/
    cd ../..
    echo "Done"
    echo "Indexer binary under bin/"
}

clean_indexer(){

    cd indexer/main
    go clean
    rm -f indexer
    cd ../..
    rm -f bin/indexer
}

build_projector(){

    echo "Building Projector..."
    cd projector/main
    go build -o projector
    cp projector ../../bin/
    cd ../..
    echo "Done"
    echo "Projector binary under bin/"
}

clean_projector(){

    cd projector/main
    go clean
    rm -f projector
    cd ../..
    rm -f bin/projector
}

if [ -z "$1" ]
    then
    build_indexer
    build_projector
elif [ $1 == "indexer" ]
    then
    build_indexer
elif [ $1 == "projector" ]
    then
    build_projector
elif [ $1 == "clean" ]
    then
    echo "Cleaning..."
    clean_indexer
    clean_projector
    echo "Done"
else
    echo "Unknown build option"
fi