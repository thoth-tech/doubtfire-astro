---
title: Insecure Token Exposure
---

_Lachlan Robinson (220325142)_

## Summary of Finding

The OnTrack application issues a persistent authentication token after user login, which is included in HTTP headers for all subsequent API requests. In the development environment, these requests are made over unencrypted HTTP, allowing authentication tokens to be intercepted by attackers on the same network. This exposes users to session hijacking and unauthorized access.

## Assessment and Remediation Status

Development: Not Remediated – HTTP is still in use, leaving authentication tokens exposed during development and testing.

```conf
http {
    include /etc/nginx/mime.types;

    sendfile on;

    server {
        root /usr/share/nginx/html/;
        index index.html;
        listen 80;

        add_header Content-Security-Policy "default-src https: 'unsafe-inline' 'unsafe-eval' blob: data: ws:" always;
        # Feature-Policy is deprecated, Permissions-Policy is used
        add_header Permissions-Policy "microphone=(self),speaker=(self),fullscreen=(self),payment=(none)" always;
    }

    gzip on;
    gzip_types text/css application/javascript;
    gzip_proxied any;
    gzip_buffers 32 8k;
}
}
```

Production: Remediated – HTTPS is enforced and HTTP is redirected securely.

```conf
http {
    underscores_in_headers on;

    # Redirect HTTP to HTTPS and remove 'www'
    server {
        listen 80;
        server_name www.example.com example.com; # Replace with actual domain
        return 301 https://example.com$request_uri;
    }

    # Redirect HTTPS 'www' to bare domain
    server {
        listen 443 ssl;
        server_name www.example.com; # Replace with actual domain
        ssl_certificate     /etc/nginx/ssl/fullchain.pem; # Replace with real certificate path
        ssl_certificate_key /etc/nginx/ssl/private.key;   # Replace with real key path

        underscores_in_headers on;
        return 301 https://example.com$request_uri;
    }

    # Main HTTPS server block
    server {
        listen 443 ssl;
        server_name example.com; # Replace with actual domain
        ssl_certificate     /etc/nginx/ssl/fullchain.pem; # Replace with real certificate path
        ssl_certificate_key /etc/nginx/ssl/private.key;   # Replace with real key path

        # API requests proxy
        location /api {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;

            proxy_pass http://backend-api:3000; # Replace with actual service name or IP
            proxy_read_timeout 90;
        }

        # Static files or frontend app
        location / {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;

            proxy_pass http://frontend-web:80; # Replace with actual service name or IP
            proxy_read_timeout 90;
        }
    }
}
```

While token transmission over HTTP is generally a security concern, this finding applies only to the development environment, which is not publicly accessible and is typically used with fake data on local networks. The production environment, which users interact with, enforces HTTPS, preventing token interception in real-world use. This issue is considered a false positive. No remediation is required in the development environment, as it does not expose end users or sensitive data in production.

## Recommendation for Retesting

No retesting required unless production configuration changes. Future security testing should:

- Focus on verifying that HTTPS is enforced in production builds.
- Exclude local development environments from vulnerability assessments unless explicitly required.
