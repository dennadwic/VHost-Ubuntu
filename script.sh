server {
   listen 80;
   #server_name www.stylemu.store stylemu.store;
   server_name 34.101.229.41;
   root /var/www/stylemu.store;
   index index.php index.html index.htm;

   location / {
     try_files $uri $uri/ /index.php$query_string;
   }

   location ~ \.php$ {
     try_files $fastcgi_script_name =404;
     include fastcgi_params;
     fastcgi_pass		unix:/run/php/php7.4-fpm.sock;
     fastcgi_index	index.php;
     fastcgi_param	DOCUMENT_ROOT	$realpath_root;
     fastcgi_param	SCRIPT_FILENAME	$realpath_root$fastcgi_script_name;
   }
   
   access_log /var/log/nginx/stylemu.store_access.log;
   error_log /var/log/nginx/stylemu.store_error.log;
}
EOF
