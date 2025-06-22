import { defineConfig } from 'vite';
import solidPlugin from 'vite-plugin-solid';

export default defineConfig({
  build: {
    target: 'esnext',
    outDir: '../public',
  },
  server: {
    port: 3001,
    strictPort: true,
    hmr: {
      port: 3001,
    },
  },
  plugins: [solidPlugin()],
});
