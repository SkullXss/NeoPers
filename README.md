# NeoPers - Personalização Avançada para Termux

Bem-vindo ao repositório NeoPers, uma ferramenta de personalização avançada para o Termux. Este script automatiza a configuração do Termux, incluindo a definição de nome no prompt, instalação de dependências e a adição de uma senha para acesso ao Termux.

## Instruções de Uso

### Pré-requisitos

- Termux instalado no seu dispositivo Android.
- Git instalado no Termux (você pode instalar com `pkg install git`).

### Instalação

1. Clone este repositório:

    ```bash
    git clone https://github.com/SkullXss/NeoPers.git
    ```

2. Navegue para o diretório do script:

    ```bash
    cd NeoPers
    ```

3. Execute o script de personalização:

    ```bash
    bash neopers.sh
    ```

### Configuração Adicional

- Durante a execução do script, você será solicitado a fornecer seu nome para exibição no prompt (PS1).
- Você também será solicitado a definir uma senha para acessar o Termux.

### Acesso ao Termux

- Sempre que abrir o Termux, será solicitada a senha definida durante a configuração.
- Em caso de esquecimento da senha, você pode usar a senha de acesso armazenada no arquivo `~/.senha_acesso`.

## Notas Importantes

- Certifique-se de escolher senhas fortes para garantir a segurança.
- Este script foi desenvolvido em 2023 e pode precisar de ajustes conforme as versões do Termux são atualizadas.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas ou enviar solicitações de pull.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).