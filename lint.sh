#!/bin/bash

# TODO: remove, update

# 1) Components for specific platform

PS3="Select platform: "

select PLATFORM in silverstripe laravel
do
    case $PLATFORM in
        "silverstripe")

            # composer require --dev phpstan/phpstan

            break;;
        "laravel")

            # composer require --dev larastan/larastan

            break;;
        *)
            echo "Ooops";;
    esac
done

# 2) Rest components for all

echo -e "Install composer pacakges? (y/n)"
read ANSWER
case $ANSWER in
  [yY])
        composer require --dev laravel/pint

        if [ "$PLATFORM" = "laravel" ]; then
            composer require larastan/larastan:^2.0 --dev
        elif [ "$PLATFORM" = "silverstripe" ]; then
            composer require --dev vimeo/psalm
            composer require --dev phpstan/phpstan
        fi
    ;;
  [nN])
        echo "Composer packages skipped"
    ;;
esac

echo -e "Install node pacakges? (y/n)"
read ANSWER
case $ANSWER in
  [yY])

        # @sentry/tracing
        # @sentry/vue

        pnpm i -D husky
        pnpm i -D lint-staged

        # pnpm i -D globals # fix `Cannot find package 'globals' imported from eslint.config.js`
        pnpm i -D eslint@8.57.0
        pnpm i -D eslint-plugin-vue@9.24.1
        pnpm i -D eslint-config-prettier
        pnpm i -D eslint-plugin-html
        pnpm i -D eslint-plugin-prettier

        pnpm i -D @rushstack/eslint-patch@^1.8.0
        pnpm i -D @stylistic/eslint-plugin@^1.5.4
        pnpm i -D @typescript-eslint/eslint-plugin@7.6.0
        pnpm i -D @vue/eslint-config-prettier@^9.0.0
        pnpm i -D @vue/eslint-config-typescript@^13.0.0
        pnpm i -D eslint-plugin-vuejs-accessibility@2.2.1
        pnpm i -D eslint-plugin-tailwindcss@3.15.1
        pnpm i -D eslint-plugin-cypress@^2.15.1
        pnpm i -D eslint-plugin-sonarjs@^0.25.1

        pnpm i -D prettier
        pnpm i -D prettier-plugin-css-order
        pnpm i -D prettier-plugin-organize-attributes
        pnpm i -D prettier-plugin-packagejson
        pnpm i -D prettier-plugin-style-order
        pnpm i -D @prettier/plugin-php
        pnpm i -D @prettier/plugin-xml
        pnpm i -D @ianvs/prettier-plugin-sort-imports
        pnpm i -D @trivago/prettier-plugin-sort-imports

        pnpm i -D stylelint
        pnpm i -D stylelint-order
        pnpm i -D stylelint-config-html
        pnpm i -D stylelint-config-clean-order
        pnpm i -D stylelint-config-prettier-scss
        pnpm i -D stylelint-config-recess-order
        pnpm i -D stylelint-config-recommended-vue
        pnpm i -D stylelint-config-standard-scss

        pnpm i -D autoprefixer
        pnpm i -D postcss
        pnpm i -D postcss-import
        pnpm i -D postcss-html
    ;;
  [nN])
        echo "Node packages skipped"
    ;;
esac

# 3) Copy supplies

LINT_DIR=vendor/goldfinch/lint/supplies/;

COMMON_SUPPLIES=( .prettierrc .eslintrc.cjs .stylelintrc.js )

PLATFORM_SUPPLIES=( .prettierignore .eslintignore .stylelintignore postcss.config.js phpstan.neon pint.json psalm.xml )

for i in "${COMMON_SUPPLIES[@]}"
do
	cp "$LINT_DIR/$i" $i
done

for i in "${PLATFORM_SUPPLIES[@]}"
do
	cp "$LINT_DIR/$PLATFORM/$i" $i
done

# 4) Update package.json

# FORMAT="prettier --check '**/*.{js,vue,css,scss,json,yml,md}'"
# cat <<< "$(jq --arg FORMAT "$FORMAT" '.scripts.format = $FORMAT' package.json)" > package.json
cat <<< "$(jq -s '.[0] * .[1]' package.json vendor/goldfinch/lint/supplies/$PLATFORM/json/scripts.json)" > package.json
cat <<< "$(jq -s '.[0] * .[1]' package.json vendor/goldfinch/lint/supplies/$PLATFORM/json/lint-staged.json)" > package.json
cat <<< "$(jq -s '.[0] * .[1]' package.json vendor/goldfinch/lint/supplies/json/pnpm.json)" > package.json

# 5) Update composer.json

# 6) Install husky

echo -e "Install Husky? (y/n)"
read ANSWER
case $ANSWER in
  [yY])
        cp -R vendor/goldfinch/lint/supplies/.husky .husky
        pnpm i
    ;;
  [nN])
        echo "Husky install skipped"
    ;;
esac
