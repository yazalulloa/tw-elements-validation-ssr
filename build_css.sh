#!/bin/bash
DIR=$(dirname "$(readlink -f "$0")")
RES_DIR=$DIR/src/main/resources/META-INF/resources

bunx tailwindcss -i "$RES_DIR"/style.css -o "$RES_DIR"/output.css --watch