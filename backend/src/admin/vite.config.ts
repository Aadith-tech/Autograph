import { mergeConfig, type UserConfig } from 'vite';

export default (config: UserConfig) => {
  // Important: always return the modified config
  return mergeConfig(config, {
    server: {
      host: '0.0.0.0',
      allowedHosts: [
        '.railway.app',
        '.up.railway.app',
        'localhost',
      ],
      hmr: {
        clientPort: 443,
        protocol: 'wss',
      },
    },
    resolve: {
      alias: {
        '@': '/src',
      },
    },
  });
};
