# Ajout de l'utilisateur jenkins au groupe Docker
```sh
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

