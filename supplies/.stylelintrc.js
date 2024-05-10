import configRecessOrder from 'stylelint-config-recess-order';

export default {
  plugins: ['stylelint-order', 'stylelint-scss'].concat(configRecessOrder.plugins),
  extends: [
    'stylelint-config-recess-order',
    'stylelint-config-prettier-scss',
    'stylelint-config-html/vue',
    'stylelint-config-standard-scss',
    'stylelint-config-recommended-vue/scss',
    'stylelint-config-clean-order',
  ],
  rules: {
    'block-no-empty': null,
    'selector-class-pattern': [
      // support BEM
    	'^[a-z]([a-z0-9-]+)?(__([a-z0-9]+-?)+)?(--([a-z0-9]+-?)+){0,2}$|^Mui.*$',
    	{
    		'message': 'Expected class selector "%s" to be pascal case or kebab case',
    	},
    ],
    'order/properties-order': configRecessOrder.rules['order/properties-order'].map((group) => ({
      ...group,
      emptyLineBefore: 'never',
      noEmptyLineBetween: true,
    })),
  },
};
