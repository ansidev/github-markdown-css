#/bin/sh

TMP_FILE=".github-themes.tmp"
OUTPUT_DIR="dist"

npx --yes generate-github-markdown-css --list > $TMP_FILE

rm $OUTPUT_DIR/*.css

for theme in $(cat $TMP_FILE)
do
    echo "Generating theme $theme..."
    npx --yes generate-github-markdown-css --type $theme > $OUTPUT_DIR/github-$theme.css
    git add $OUTPUT_DIR/github-$theme.css
done

rm $TMP_FILE
echo "Done."