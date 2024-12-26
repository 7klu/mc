DURL=$(curl -s https://piston-meta.mojang.com/v1/packages/a3bcba436caa849622fd7e1e5b89489ed6c9ac63/1.21.4.json | jq -r '.downloads.server.url')
wget $DURL -O minecraft_server_1.21.4.jar
