export default ({ env }) => {
  const publicUrl = env('PUBLIC_URL') ||
    (env('RAILWAY_PUBLIC_DOMAIN') ? `https://${env('RAILWAY_PUBLIC_DOMAIN')}` : 'http://localhost:1337');

  return {
    auth: {
      secret: env('ADMIN_JWT_SECRET'),
    },
    apiToken: {
      salt: env('API_TOKEN_SALT'),
    },
    transfer: {
      token: {
        salt: env('TRANSFER_TOKEN_SALT'),
      },
    },
    secrets: {
      encryptionKey: env('ENCRYPTION_KEY'),
    },
    flags: {
      nps: env.bool('FLAG_NPS', true),
      promoteEE: env.bool('FLAG_PROMOTE_EE', true),
    },
    url: publicUrl,
    serveAdminPanel: env.bool('SERVE_ADMIN', true),
  };
};
