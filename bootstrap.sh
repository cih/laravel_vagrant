#!/usr/bin/env bash

echo 'Creating a default nginx configuration /etc/nginx/sites-enabled/default'
cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    server_name localhost;

    root /vagrant/public/;
    index index.php index.html;

    # Important for VirtualBox
    sendfile off;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~* \\.php {
        include fastcgi_params;

        fastcgi_pass unix:/var/run/php5-fpm.sock;

        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_cache off;
        fastcgi_index index.php;
    }
}
EOF

echo 'Symlinking default nginx configuration to /etc/nginx/sites-enabled/default'
if [ ! -f /etc/nginx/sites-enabled/default ]; then
  `ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default`
fi

echo 'custom: Restarting nginx'
`/etc/init.d/nginx restart`
