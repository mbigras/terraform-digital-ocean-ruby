# Terraform DigitalOcean Ruby err...Docker

## Hack session notes

```
ssh-keygen -q -b 2048 -t rsa -N '' -f id_rsa
export TF_VAR_do_token="$(lpass show --notes do_token)"
terraform init
terraform plan
terraform apply -auto-approve
terraform state show digitalocean_droplet.web
ip=$(terraform state show digitalocean_droplet.web | awk '/ipv4_address/ { print $NF }')
echo $ip > hosts
ssh-keyscan $ip >> ~/.ssh/known_hosts
ansible all -m ping
ansible-playbook playbook.yml
ssh -i id_rsa root@$ip
terraform destroy -force

curl -Ls https://api.github.com/repos/mbigras/someapp/tarball > app.tar.gz
tar xvf app.tar.gz
mv mbigras* app

docker build --tag someapp .
docker run -itd --name someapp -p 4567:4567 -e APP_ENV=prod someapp
docker exec someapp bundle exec ruby app.rb
```

