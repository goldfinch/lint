### package.json

```json
{
    // ..

    "scripts": {
        "lint": "eslint *.js themes",
        "lint-fix": "eslint *.js themes --fix",
        "format": "prettier --check '**/*.{js,vue,css,scss,json,yml,md}' --config vendor/goldfinch/lint/.prettierrc",
        "format-fix": "prettier --write '**/*.{js,vue,css,scss,json,yml,md}' --config vendor/goldfinch/lint/.prettierrc",
        "format-app": "prettier --check 'app/**/*.{php,yml,json}' --config vendor/goldfinch/lint/.prettierrc",
        "format-app-fix": "prettier --write 'app/**/*.{php,yml,json}' --config vendor/goldfinch/lint/.prettierrc",
        "format-themes": "prettier --check 'themes/**/*.ss' --config vendor/goldfinch/lint/.prettierrc",
        "format-themes-fix": "prettier --write 'themes/**/*.ss' --config vendor/goldfinch/lint/.prettierrc"
    },
    "devDependencies": {
        "@ianvs/prettier-plugin-sort-imports": "^4.2.1",
        "@prettier/plugin-php": "^0.22.2",
        "@vitejs/plugin-vue": "^5.0.4",
        "eslint": "^9.0.0",
        "eslint-config-prettier": "^9.1.0",
        "eslint-plugin-html": "^8.0.0",
        "eslint-plugin-prettier": "^5.1.3",
        "eslint-plugin-vue": "^9.24.1",
        "husky": "^9.0.11",
        "lint-staged": "^15.2.2",
        "postcss": "^8.4.38",
        "prettier": "^3.2.5",
        "prettier-plugin-css-order": "^2.1.2",
        "prettier-plugin-organize-attributes": "^1.0.0",
    },
    "lint-staged": {
        "*.js|themes/**/*.{vue,js}": [
            "eslint --fix",
            "prettier --write --ignore-unknown --config vendor/goldfinch/lint/.prettierrc"
        ],
        "**/*.{css,scss,json,yml,md}": [
            "prettier --write --ignore-unknown --config vendor/goldfinch/lint/.prettierrc"
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
cp vendor/goldfinch/lint/.husky .husky
```