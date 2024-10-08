
# Condição para definir key_name com base em uma variável..
#  count      = var.create_key ? 1 : 0gti
# key_name = var.create_key ? aws_key_pair.meu_keypair_jhonata[0].key_name : null
#  key_name = aws_key_pair.meu_keypair_jhonata.key_name

    #   copy:
    #     src: ${file("~/.ssh/id_rsa.pub")}
    #     dest: /home/ubuntu/.ssh/id_rsa
    #     owner: ubuntu
    #     group: ubuntu
    #     mode: '0600'


#ansible -i inventory.ini my_pendrive_vm -m ping -u ubuntu --private-key=./id_rsa

#ansible -i inventory.ini my_pendrive_vm -m shell -a "ls -la" -u ubuntu --private-key=./id_rsa 
#ansible -i inventory.ini my_pendrive_vm -m command -a "uptime" -u ubuntu --private-key=./id_rsa 

#ansible-playbook -i inventory.ini ansible-playbook-install-docker.yml -u ubuntu --private-key=./id_rsa

# Executar terraform apply e capturar o output
terraform_output=$(terraform apply -auto-approve)

# Extrair o IP da instância do output
instance_ip=$(echo "$terraform_output" | grep "instance_ip" | awk -F' = ' '{print $2}')

# Executar o playbook do Ansible, passando o IP da instância como uma variável
ansible-playbook -i $instance_ip, meu_playbook.yml


ansible-playbook -i inventory.ini ansible-route53.yml -u ubuntu --private-key=./id_rsa

