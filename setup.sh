#!/bin/zsh
echo "By: TakumiBC (Thomas Wu)"
echo "Project Repo: https://github.com/TakumiBC/nextjs-setup"
echo ""

if ! jq --version &> /dev/null; then
  echo "jq is not installed. Please install it using Homebrew."
  exit 1
fi

sed -i '' '4,$d' app/globals.css
echo "export default function Home() {
  return (
    <>
      <h1>Hello World!</h1>
    </>
  );
}" > app/page.tsx
rm -rf package-lock.json
pnpm i
rm -rf app/favicon.ico
pnpm add --save-dev --save-exact prettier
node --eval "fs.writeFileSync('.prettierrc','{}\n')"
echo "IyBkZXBlbmRlbmNpZXMKL25vZGVfbW9kdWxlcwovLnBucAoucG5wLmpzCgojIHRlc3RpbmcKL2NvdmVyYWdlCgojIG5leHQuanMKLy5uZXh0Lwovb3V0LwoKIyBwcm9kdWN0aW9uCi9idWlsZAoKIyBtaXNjCi5EU19TdG9yZQoqLnBlbQoKIyBkZWJ1ZwpucG0tZGVidWcubG9nKgp5YXJuLWRlYnVnLmxvZyoKeWFybi1lcnJvci5sb2cqCi5wbnBtLWRlYnVnLmxvZyoKCiMgbG9jYWwgZW52IGZpbGVzCi5lbnYqLmxvY2FsCgojIHZlcmNlbAoudmVyY2VsCgojIHR5cGVzY3JpcHQKKi50c2J1aWxkaW5mbwpuZXh0LWVudi5kLnRzCg==" | base64 -d > .prettierignore
pnpm exec prettier . --write
pnpm install --save-dev eslint-config-prettier
rm -rf .eslintrc.json
echo "ewogICJleHRlbmRzIjogWwogICAgIm5leHQvY29yZS13ZWItdml0YWxzIiwKICAgICJwcmV0dGllciIKICBdCn0=" | base64 -d > .eslintrc.json
pnpm install -D prettier prettier-plugin-tailwindcss
echo '{\n  "plugins": ["prettier-plugin-tailwindcss"]\n}' > .prettierrc
pnpm add --save-dev husky lint-staged
pnpm exec husky init
node --eval "fs.writeFileSync('.husky/pre-commit','pnpm exec lint-staged\n')"
jq '. += {"lint-staged": {"**/*": "prettier --write --ignore-unknown"}}' package.json > tmp.$$.json && mv tmp.$$.json package.json
pnpm dlx shadcn-ui@latest init
echo "Setup finished. See https://prettier.io/docs/en/editors to setup prettier in your editor."
