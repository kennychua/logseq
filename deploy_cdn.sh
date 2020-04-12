#!/bin/sh
cd web
yarn clean && yarn release
cd ../
aws s3 sync ./resources/static/ s3://logseq-site/static/
aws cloudfront create-invalidation \
    --distribution-id $AWS_LOGSEQ_CLOUDFRONT_ID \
    --paths "/static/js/main.js" "/static/style.css"