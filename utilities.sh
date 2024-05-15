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

# echo -e "Install composer pacakges? (y/n)"
# read ANSWER
# case $ANSWER in
#   [yY])
#         composer require --dev laravel/pint

#         if [ "$PLATFORM" = "laravel" ]; then
#             composer require larastan/larastan:^2.0 --dev
#         elif [ "$PLATFORM" = "silverstripe" ]; then
#             composer require --dev vimeo/psalm
#             composer require --dev phpstan/phpstan
#         fi
#     ;;
#   [nN])
#         echo "Composer packages skipped"
#     ;;
# esac

echo -e "Install node pacakges? (y/n)"
read ANSWER
case $ANSWER in
  [yY])

        pnpm i -D typescript@~5.4.0
        pnpm i -D @tsconfig/node20@^20.1.4
        pnpm i -D @types/jsdom@^21.1.6
        pnpm i -D @types/node@^20.12.5
        pnpm i -D @vue/test-utils@^2.4.5
        pnpm i -D @vue/tsconfig@^0.5.1
        pnpm i -D cypress@^13.7.2
        pnpm i -D npm-run-all2@^6.1.2
        pnpm i -D jsdom@^24.0.0

        pnpm i -D vite@^5.2.8
        pnpm i -D vite-plugin-vue-devtools@^7.0.25
        pnpm i -D vitest@^1.4.0
        pnpm i -D vue-tsc@^2.0.11
        pnpm i -D start-server-and-test@^2.0.3

    ;;
  [nN])
        echo "Node packages skipped"
    ;;
esac

# 3) Copy supplies

# LINT_DIR=vendor/goldfinch/lint/supplies/;

# COMMON_SUPPLIES=( .prettierrc eslint.config.js .stylelintrc.js )

# PLATFORM_SUPPLIES=( .prettierignore postcss.config.js phpstan.neon pint.json psalm.xml )

# for i in "${COMMON_SUPPLIES[@]}"
# do
# 	cp "$LINT_DIR/$i" $i
# done

# for i in "${PLATFORM_SUPPLIES[@]}"
# do
# 	cp "$LINT_DIR/$PLATFORM/$i" $i
# done

# # 4) Update package.json

# # FORMAT="prettier --check '**/*.{js,vue,css,scss,json,yml,md}'"
# # cat <<< "$(jq --arg FORMAT "$FORMAT" '.scripts.format = $FORMAT' package.json)" > package.json
# cat <<< "$(jq -s '.[0] * .[1]' package.json vendor/goldfinch/lint/supplies/$PLATFORM/json/scripts.json)" > package.json
# cat <<< "$(jq -s '.[0] * .[1]' package.json vendor/goldfinch/lint/supplies/$PLATFORM/json/lint-staged.json)" > package.json
# cat <<< "$(jq -s '.[0] * .[1]' package.json vendor/goldfinch/lint/supplies/json/pnpm.json)" > package.json

# # 5) Update composer.json

# # 6) Install husky

# echo -e "Install Husky? (y/n)"
# read ANSWER
# case $ANSWER in
#   [yY])
#         cp -R vendor/goldfinch/lint/supplies/.husky .husky
#         pnpm i
#     ;;
#   [nN])
#         echo "Husky install skipped"
#     ;;
# esac
