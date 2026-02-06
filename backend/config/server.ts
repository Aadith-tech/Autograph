export default ({ env }) => {
  const publicUrl = env('PUBLIC_URL') ||
    (env('RAILWAY_PUBLIC_DOMAIN') ? `https://${env('RAILWAY_PUBLIC_DOMAIN')}` : 'http://localhost:1337');

  return {
    host: env('HOST', '0.0.0.0'),
    port: env.int('PORT', 1337),
    app: {
      keys: env.array('APP_KEYS'),
    },
    url: publicUrl,
    proxy: env.bool('IS_PROXIED', true),
    allowedHosts: [
      'localhost',
      '.railway.app',
      '.up.railway.app',
    ],
  };
};
