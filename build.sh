#!/bin/bash
# Remove previous buil folder
rm -rf ../build
# Copy full directory except some files
mkdir -p ../build
cp -R . ../build
rm -rf ../build/.git
rm -rf ../build/README.md
rm -rf ../build/build.sh
echo "New build dir is created"
# Minify HTML
html-minifier --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype ../build/index.html ../build/home.HTML
echo "HTML is minified"
# Minify CSS
rm -rf ../build/assets/css/bootstrap.css
cssnano ./assets/css/bootstrap.css ../build/assets/css/bootstrap.css
rm -rf ../build/assets/css/rubick.css
cssnano ./assets/css/rubick.css ../build/assets/css/rubick.css
rm -rf ../build/assets/css/lunasun.css
cssnano ./assets/css/lunasun.css ../build/assets/css/lunasun.css
# Minify JS
rm -rf ../build/assets/js/gsdk-bootstrapswitch.js
uglifyjs --compress --mangle -o ../build/assets/js/gsdk-bootstrapswitch.js ./assets/js/gsdk-bootstrapswitch.js
rm -rf ../build/assets/js/countdown.js
uglifyjs --compress --mangle -o ../build/assets/js/countdown.js ./assets/js/countdown.js
rm -rf ../build/assets/js/rubick.js
uglifyjs --compress --mangle -o ../build/assets/js/rubick.js ./assets/js/rubick.js
rm -rf ../build/assets/js/lunasun.js
uglifyjs --compress --mangle -o ../build/assets/js/lunasun.js ./assets/js/lunasun.js
echo "JS is minified"

echo "Minification complete!"
