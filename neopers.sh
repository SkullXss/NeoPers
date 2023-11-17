#!/bin/bash

# Limpa a tela
clear

# Banner colorido e animado
echo -e "\e[1;34m
 ____                   _              
 |  _ \  __ _ _ __ __ _| |_ ___  _ __ 
 | | | |/ _\` | '__/ _\` | __/ _ \| '__|
 | |_| | (_| | | | (_| | || (_) | |   
 |____/ \__, |_|  \__,_|\__\___/|_|   
         |___/    
\e[0m"

# Atualiza os repositórios e instala dependências (opcional)
read -p "Deseja atualizar os repositórios e instalar dependências? (y/n): " resposta
if [ "$resposta" == "y" ]; then
    apt update && apt upgrade -y
    apt install neofetch -y
    clear
fi
echo -e "\e[1;34m
 ____                   _              
 |  _ \  __ _ _ __ __ _| |_ ___  _ __ 
 | | | |/ _\` | '__/ _\` | __/ _ \| '__|
 | |_| | (_| | | | (_| | || (_) | |   
 |____/ \__, |_|  \__,_|\__\___/|_|   
         |___/    
\e[0m"

# Pergunta pelo nome para o PS1
read -p "Digite seu nome para ser exibido no prompt (PS1): " nome_usuario

# Pergunta pela senha de acesso (opcional)
read -s -p "Digite uma senha de acesso (opcional): " senha_acesso
echo

# Limpa o conteúdo do ~/.bashrc
echo "" > ~/.bashrc

# Adiciona as novas configurações
cat <<EOL >> ~/.bashrc
# Limpa a tela na inicialização
clear

# Executa o neofetch na inicialização
neofetch

# Configuração do PS1 (prompt)
PS1='\[\033[1;31m\]╭──\[\033[1;30m\](\[\033[1;35m\]$nome_usuario\[\033[1;30m\]@\[\033[1;32m\]\h\[\033[1;30m\])-\[\033[1;34m\](\[\033[1;32m\]\w\[\033[1;34m\])\n\[\033[1;31m\]╰──\[\033[1;32m\]❯❯\[\033[0m\] '

# Verifica a senha de acesso (opcional)
if [ -n "$senha_acesso" ]; then
    read -s -p "Digite a senha para acessar o Termux: " senha_digitada
    echo

    if [ "$senha_digitada" != "$senha_acesso" ]; then
        echo "Senha incorreta. Saindo..."
        exit 1
    fi
fi

# Configuração das cores para o ls
export LS_COLORS="di=38;5;196:fi=38;5;46"

# Alias para o comando ls com formatação amigável
alias ls="ls --color=auto --classify"

# Alias para o comando ls com emojis indicando pastas e arquivos
alias lse="ls | sed \"s/^\(.*\/\)/\1📁/;s/^\(.*\)/\1📄/\""

# Cores para diretórios e arquivos
LS_COLORS=$LS_COLORS:'di=1;34:'
LS_COLORS=$LS_COLORS:'*.txt=1;31:'
LS_COLORS=$LS_COLORS:'*.sh=1;32:'
export LS_COLORS

# Função para destacar comandos inexistentes
command_not_found_handle() {
    echo -e "\[\033[1;31m\]Comando não encontrado: $1\[\033[0m\]"
}

# Funções adicionais
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
EOL

# Adiciona a senha de acesso ao arquivo de configuração (opcional)
if [ -n "$senha_acesso" ]; then
    echo "$senha_acesso" > ~/.senha_acesso
fi

echo "Script executado com sucesso! Seu nome foi configurado para o prompt."
