import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  root: "./frontend",
  publicDir: "public",
  base: "./",
  build: {
    outDir: "../dist/",
    emptyOutDir: true,
  },
  server: {
    port: 7712,
    host: true,
    proxy: {
      "/ws": { target: "ws://localhost:7812", ws: true },
    },
  },plugins: [vue()],
})
