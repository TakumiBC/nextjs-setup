# nextjs-setup

This script will setup a Next.js project with Prettier, and integrates Prettier with ESLint, TailwindCSS and Husky, for a better experience. It streamlines the process of configuring a new Next.js application with Prettier to save more time on starting new projects .

## Dependencies

- **pnpm**: This script uses `pnpm` for package management. If you don't have `pnpm` installed, you can install it by running `npm install -g pnpm`.
- **jq**: The script requires  `jq`, a lightweight and flexible command-line JSON processor. If you do not have `jq` installed, please install it using Homebrew.

## Usage

1. Enter the directory of your Next.js project

2. Run the following command:

   ```zsh
   curl -s https://raw.githubusercontent.com/TakumiBC/nextjs-setup/main/setup.sh | zsh
   ```

## What the Script Does

- Configures Prettier to integrate with ESLint, TailwindCSS and Husky
- Cleans up and prepares the project structure for development.

## License

This project is released to the public under the MIT license.
