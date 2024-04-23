## Install

```bash
composer require --dev goldfinch/lint
```


### package.json

```json
{
    // ..

    "scripts": {
        "format": "prettier --check '**/*.{js,vue,css,scss,json,yml,md}' --config vendor/goldfinch/lint/.prettierrc",
        "format-app": "prettier --check 'app/**/*.{php,yml,json}' --config vendor/goldfinch/lint/.prettierrc",
        "format-app-fix": "prettier --write 'app/**/*.{php,yml,json}' --config vendor/goldfinch/lint/.prettierrc",
        "format-fix": "prettier --write '**/*.{js,vue,css,scss,json,yml,md}' --config vendor/goldfinch/lint/.prettierrc",
        "format-themes": "prettier --check 'themes/**/*.ss' --config vendor/goldfinch/lint/.prettierrc",
        "format-themes-fix": "prettier --write 'themes/**/*.ss' --config vendor/goldfinch/lint/.prettierrc",
        "postinstall": "husky install",
        "lint": "eslint *.js themes --config vendor/goldfinch/lint/eslint.config.js",
        "lint-fix": "eslint *.js themes --fix --config vendor/goldfinch/lint/eslint.config.js",
        "lint-style": "stylelint themes/**/*.{scss,css} --config vendor/goldfinch/lint/.stylelintrc.js",
        "lint-style-fix": "stylelint themes/**/*.{scss,css} --config vendor/goldfinch/lint/.stylelintrc.js --fix",
    },
    "devDependencies": {
        "@ianvs/prettier-plugin-sort-imports": "^4.2.1",
        "@prettier/plugin-php": "^0.22.2",
        "@trivago/prettier-plugin-sort-imports": "^4.3.0",
        "eslint": "^9.0.0",
        "eslint-config-prettier": "^9.1.0",
        "eslint-plugin-html": "^8.0.0",
        "eslint-plugin-prettier": "^5.1.3",
        "eslint-plugin-vue": "^9.24.1",
        "husky": "^9.0.11",
        "lint-staged": "^15.2.2",
        "postcss-html": "^1.6.0",
        "prettier": "^3.2.5",
        "prettier-plugin-css-order": "^2.1.2",
        "prettier-plugin-organize-attributes": "^1.0.0",
        "prettier-plugin-packagejson": "^2.5.0",
        "prettier-plugin-style-order": "^0.2.2",
        "stylelint": "^16.3.1",
        "stylelint-config-clean-order": "^5.4.2",
        "stylelint-config-html": "^1.1.0",
        "stylelint-config-prettier-scss": "^1.0.0",
        "stylelint-config-recess-order": "^5.0.1",
        "stylelint-config-recommended-vue": "^1.5.0",
        "stylelint-config-standard-scss": "^13.1.0",
        "stylelint-order": "^6.0.4",
    },
    "lint-staged": {
        "*.js|themes/**/*.{vue,js}": [
            "eslint --fix --config vendor/goldfinch/lint/eslint.config.js",
            "prettier --write --ignore-unknown --config vendor/goldfinch/lint/.prettierrc"
        ],
        "**/*.{css,scss,json,yml,md}": [
            "prettier --write --ignore-unknown --config vendor/goldfinch/lint/.prettierrc"
        ],
        "**/*.{css,scss}": [
            "stylelint --allow-empty-input --quiet --config vendor/goldfinch/lint/.stylelintrc.js --fix"
        ],
        "**/*.php": [
            "vendor/bin/pint"
        ]
    },

    // ...
}

```

### composer.json

```json
{
  // ..

  "require-dev": {
    "laravel/pint": "^1.15"
  },
  
  // ..
}
```

### copy

```bash
cp vendor/goldfinch/lint/.prettierignore .prettierignore
cp -r vendor/goldfinch/lint/.husky .husky
npm i
```