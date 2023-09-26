
### Terraform

1. **`cd modulo07/terraform/proj001/`**: Navega para o diretório onde o projeto Terraform está localizado. 
2. **`terraform init`**: Inicializa o diretório com arquivos de configuração do Terraform.
3. **`terraform plan`**: Mostra o que o Terraform fará antes de realmente fazer. É como um "preview".
4. **`terraform apply`**: Aplica as mudanças. É o "Vai, Corinthians!" do Terraform.
5. **`terraform output`**: Mostra as saídas definidas no Terraform, como IPs de instâncias criadas.

### SSH

1. **`ssh -vvv -i id_rsa ubuntu@23.20.246.118`**: Tenta se conectar via SSH ao servidor com o IP `23.20.246.118` usando a chave `id_rsa` e o modo verboso `-vvv` para depuração.
2. **`ssh -i id_rsa ubuntu@35.174.1.61`**: Similar ao anterior, mas com um IP diferente e sem o modo verboso.

### Miscelânea

1. **`free`**: Mostra a quantidade de memória livre e usada no sistema.
2. **`ping 35.174.1.61`**: Verifica a conectividade com o IP `35.174.1.61`.

### Ansible

1. **`touch ansiblecmd.sh`**: Cria um arquivo shell chamado `ansiblecmd.sh`.
2. **`chmod +x ansiblecmd.sh`**: Torna o arquivo `ansiblecmd.sh` executável.
3. **`./ansiblecmd.sh`**: Executa o script `ansiblecmd.sh`.

### Observações

- **`terraform play`**: Este comando não é padrão no Terraform. Talvez você quisesse digitar `terraform apply` novamente?
- **`1997*`**: O asterisco geralmente indica que o comando ainda está em execução ou foi interrompido.

### Pontos de Vista

1. **DevOps**: Esses comandos são essenciais para qualquer pessoa trabalhando com infraestrutura como código. Eles ajudam a automatizar tarefas que seriam tediosas e propensas a erros se feitas manualmente.
2. **Segurança**: Usar chaves SSH é uma boa prática, mas certifique-se de que elas estejam seguras e não sejam compartilhadas.
3. **Debugging**: O uso de `-vvv` em comandos SSH é uma prática inteligente quando as coisas não estão funcionando como esperado.

