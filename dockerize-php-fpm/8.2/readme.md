测试过程

```
docker cp /usr/local/nginx/html 817ee403e5ff:/usr/share/nginx
```
```
apt update
apt install php-fpm php-json php-curl php-cgi php-mysql php-gd php-pgsql -y
```
nginx配置
```
vi /etc/nginx/conf.d/default.conf
```

```
server {
    listen 80;
    server_name localhost;

    root /usr/share/nginx/html;
    index index.php;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
	}
}
```
否则会出现权限不足的情况
```
usermod -a -G www-data nginx
```
```
# 后台 启动PHP-FPM 
php-fpm8.2
```

```
# 前台启动Nginx
nginx -g 'daemon off;'
```