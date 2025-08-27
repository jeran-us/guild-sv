# create-guild-sv

Starter template for SvelteKit with Clerk authentication and PicoCSS styling. Designed for use with `npm create`.

## Usage

```sh
npm create guild-sv@latest my-app
```

## Features

- SvelteKit (TypeScript)
- PicoCSS for styling
- REST API backend (Node adapter)
- Clerk authentication with passkey support
- Modular architecture
- Vite dev server
- pnpm package manager
- ESLint & Prettier for code quality
- Ready for deployment on Vercel

## Getting Started

1. Install dependencies:

   ```sh
   pnpm install
   ```
2. Start the development server:

   ```sh
   pnpm dev
   ```
3. Configure Clerk environment variables in `.env`:

   ```env
   CLERK_PUBLISHABLE_KEY=your_publishable_key
   CLERK_SECRET_KEY=your_secret_key
   ```

## License

MIT
