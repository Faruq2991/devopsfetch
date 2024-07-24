# Install necessary dependencies
install_dependencies() {
    sudo apt-get update
    sudo apt-get install -y net-tools docker.io nginx
}

create_systemd_service() {
    SERVICE_FILE=/etc/systemd/system/devopsfetch.service
    echo "[Unit]
Description=DevOpsFetch Monitoring Service

[Service]
ExecStart=$(pwd)/devopsfetch.sh -t 5m
Restart=always

[Install]
WantedBy=multi-user.target" | sudo tee $SERVICE_FILE

    sudo systemctl daemon-reload
    sudo systemctl enable devopsfetch.service
    sudo systemctl start devopsfetch.service
}

# Log rotation setup
setup_log_rotation() {
    LOGROTATE_FILE=/etc/logrotate.d/devopsfetch
    echo "/var/log/devopsfetch.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
    create 0640 root root
}" | sudo tee $LOGROTATE_FILE
}
