#!/bin/bash

# Script to generate Strapi secrets for Railway deployment
# Run this and copy the output to Railway environment variables

echo "==================================="
echo "Strapi Secret Generator for Railway"
echo "==================================="
echo ""

echo "Copy these values to Railway's environment variables:"
echo ""

echo "APP_KEYS=$(openssl rand -base64 32),$(openssl rand -base64 32),$(openssl rand -base64 32),$(openssl rand -base64 32)"
echo ""

echo "ADMIN_JWT_SECRET=$(openssl rand -base64 32)"
echo ""

echo "API_TOKEN_SALT=$(openssl rand -base64 32)"
echo ""

echo "TRANSFER_TOKEN_SALT=$(openssl rand -base64 32)"
echo ""

echo "JWT_SECRET=$(openssl rand -base64 32)"
echo ""

echo "==================================="
echo "Next Steps:"
echo "==================================="
echo "1. Go to Railway Dashboard"
echo "2. Add these variables to your service"
echo "3. Add persistent volume at /app/backend/.tmp (important!)"
echo "4. Railway will auto-provide:"
echo "   - RAILWAY_PUBLIC_DOMAIN"
echo "5. Deploy!"
echo ""
