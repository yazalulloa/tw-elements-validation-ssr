DIR=$(dirname "$(readlink -f "$0")")
RES_DIR=$DIR/src/main/resources/META-INF/resources

bun build --outdir="$RES_DIR"/out "$RES_DIR"/js  --watch

