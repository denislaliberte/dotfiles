function open_github_shopify_compare(){ open "https://github.com/Shopify/shopify/compare/master...$( git rev-parse --abbrev-ref HEAD)" }
alias osc=open_github_shopify_compare
