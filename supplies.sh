#!/bin/bash

# TODO: remove, update

# 1) Components for specific platform

PS3="Select platform: "

select PLATFORM in silverstripe laravel
do
    case $PLATFORM in
        "silverstripe")

            composer require --dev phpstan/phpstan

            break;;
        "laravel")

            composer require --dev larastan/larastan

            break;;
        *)
            echo "Ooops";;
    esac
done

# 2) Rest components for all

composer require --dev laravel/pint
composer require --dev vimeo/psalm

# @sentry/tracing
# @sentry/vue

npm i -D husky
npm i -D lint-staged

npm i -D eslint
npm i -D eslint-config-prettier
npm i -D eslint-plugin-vue
npm i -D eslint-plugin-html
npm i -D eslint-plugin-prettier

npm i -D prettier
npm i -D prettier-plugin-css-order
npm i -D prettier-plugin-organize-attributes
npm i -D prettier-plugin-packagejson
npm i -D prettier-plugin-style-order
npm i -D @prettier/plugin-php
npm i -D @ianvs/prettier-plugin-sort-imports
npm i -D @trivago/prettier-plugin-sort-imports

npm i -D stylelint
npm i -D stylelint-order
npm i -D stylelint-config-html
npm i -D stylelint-config-clean-order
npm i -D stylelint-config-prettier-scss
npm i -D stylelint-config-recess-order
npm i -D stylelint-config-recommended-vue
npm i -D stylelint-config-standard-scss

npm i -D autoprefixer
npm i -D postcss
npm i -D postcss-import
npm i -D postcss-html

# 3) Copy supplies

# 4) Update package.json

# 5) Update composer.json