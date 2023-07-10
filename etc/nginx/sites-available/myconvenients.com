server {
    listen 80;
    server_name myconvenient.com;

    location / {
        proxy_pass http://127.0.0.1:5000;  # Thay đổi cổng nếu Flask server của bạn chạy trên cổng khác
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}