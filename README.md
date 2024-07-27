
# Fish - O melhor e mais customizável dos Shell


[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE) [![Fish Shell Version](https://img.shields.io/badge/fish-≥v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Build](https://github.com/oh-my-fish/oh-my-fish/workflows/Build/badge.svg)](https://github.com/oh-my-fish/oh-my-fish/actions?query=workflow%3ABuild)


- [Fish - O melhor e mais customizável dos Shell](#fish-o-melhor-e-mais-customizável-dos-shell)
  - [Configuração do Fish](#configuração-do-fish)
  - [Linguagem do Fish](#linguagem-do-fish)
  - [Configuração da Aparência](#configuração-da-aparência)
  - [Adicionar um caminho PATH](#adicionar-um-caminho-path)
- [Personalização - Faça o Seu Terminal Linux Parecer Incrível](#personalização-faça-o-seu-terminal-linux-parecer-incrível)
  - [Instalando o Fish Shell](#instalando-o-fish-shell)
  - [Instalando o Homebrew](#instalando-o-homebrew)
  - [Configurando seu terminal com Oh My Posh no Linux](#configurando-seu-terminal-com-oh-my-posh-no-linux)
  - [Baixando e instalando as fontes](#baixando-e-instalando-as-fontes)
  - [Baixando e instalando os temas do OhMyPosh](#baixando-e-instalando-os-temas-do-ohmyposh)
  - [Adicionando o tema do OhMyPosh à configuração do Fish](#adicionando-o-tema-do-ohmyposh-à-configuração-do-fish)
  - [Alterando o esquema de cores do terminal](#alterando-o-esquema-de-cores-do-terminal)
    - [Outros temas Oh My Posh](#outros-temas-oh-my-posh)
- [Outras personalização](#outras-personalização)
  - [Starship](#starship)
    - [Requisitos](#requisitos)
    - [Instalação Rápida](#instalação-rápida)
      - [Instale via Gerenciador de Pacotes](#instale-via-gerenciador-de-pacotes)
  - [Oh-my-fish](#oh-my-fish)
    - [Configuração do OMF (Oh My Fish) para Personalizar o Shell Fish](#configuração-do-omf-oh-my-fish-para-personalizar-o-shell-fish)
    - [Requisitos](#requisitos-2)
    - [Instalação](#instalação)
  - [Listando Pacotes e Temas](#listando-pacotes-e-temas)
  - [Explorando Temas](#explorando-temas)
  - [Buscando Temas e Complementos](#buscando-temas-e-complementos)
  - [Explorando Mais Funcionalidades](#explorando-mais-funcionalidades)
  - [Desinstalando o OMF](#desinstalando-o-omf)
  - [Referências](#referências)

Realmente estou apaixonado pelo Fish (Friendly Interative Shell), achei incrível instalar e customizar.

![Fish](/_resources/Fish1.png)

Muito bonito, rápido e possui muitas funcionalidades que teriamos que instalar muitos plugins para igualar ao que já vem pronto no Fish.

### Configuração do Fish

O Fish não possui um arquivo central de configuração como o `.bashrc` ou `.zshrc`. Em vez disso, ele usa um arquivo chamado `config.fish`, normalmente localizado em `~/.config/fish`.
O trecho de código a seguir mostra como adicionar comandos para serem executados em sessões interativas:

```fish
if status is-interactive
# Comandos para sessões interativas podem ser adicionados aqui
end
```

### Linguagem do Fish

- O Fish é uma linguagem por si só, semelhante ao **vim**. Para criar aliases, não usamos o tradicional shell script. Por exemplo, para criar um alias para listar arquivos com detalhes, fazemos:

```fish
function ls
    ls -la
end
```

- No entanto, alguns aliases podem precisar de argumentos. Para lidar com isso, usamos a variável de argumentos `$argv`.

### Configuração da Aparência

O Fish possui um design diferente dos demais shells, com cores de destaque para os comandos.
Para personalizar a aparência, você pode usar o comando `fish_config`, que abrirá uma página no navegador para configurar o prompt e as cores.

Lembre-se de que o comando `fish_config` funciona apenas nas versões mais recentes do Fish. Se você estiver usando uma distribuição LTS como o Ubuntu, pode ser necessário instalar uma versão mais atual diretamente do site oficial.

### Adicionar um caminho PATH

Adicionar um novo caminho à variável PATH no **Fish** é realmente prático. O comando que você mencionou, `fish_add_path`, é uma maneira simples de fazer isso. Ele permite adicionar componentes ao PATH do **Fish**, seja diretamente ao `PATH` ou ao `$fish_user_paths` (se o sinalizador `--path` for usado).

Aqui estão alguns exemplos de como usar o `fish_add_path`:

1. Para adicionar o caminho `~/.cargo/bin` (onde os pacotes instalados pelo **Cargo** ficam) ao PATH:

```fish
fish_add_path ~/.cargo/bin
```

2. Se você quiser que o diretório `~/.local/bin` seja verificado primeiro, use o sinalizador `-m`:

```fish
fish_add_path -m ~/.local/bin
```

3. Se preferir usar um `fish_user_paths` global, você pode fazer assim:

```fish
fish_add_path -g ~/.local/bin ~/.otherbin /usr/local/sbin
```

4. Para adicionar um diretório inteiro ao final do `$PATH` (porque ele contém fallbacks, por exemplo):

```fish
fish_add_path -aP /opt/fallback/bin
```

5. Se você quiser adicionar o diretório `bin/` do seu diretório atual (`$PWD`), faça assim:

```fish
fish_add_path -v bin/
set fish_user_paths /home/nemo/bin /usr/bin /home/nemo/.local/bin
```

Lembre-se de que o `fish_add_path` normaliza os componentes, ignorando barras finais e tornando caminhos relativos absolutos. Além disso, se um componente já existir, ele não será adicionado novamente, a menos que o sinalizador `--move` seja usado. Componentes são adicionados na ordem em que são fornecidos e são pré-anexados ao PATH, a menos que o sinalizador `--append` seja usado.

# Personalização - Faça o Seu Terminal Linux Parecer Incrível

Enquanto o prompt padrão no terminal Linux pode ser um pouco monótono, existem opções para personalizá-lo facilmente. Felizmente, é possível fazer uma quantidade considerável de customização diretamente no terminal para torná-lo visualmente atraente e mais funcional. Neste guia, vou explicar como deixar o seu terminal Linux fabuloso usando o shell Fish em conjunto com o OhMyPosh.

O Fish shell é um shell amigável para o usuário, com recursos como sugestões automáticas, realce de sintaxe e uma linguagem de script simples. Ele é poderoso, mas também intuitivo, sendo adequado tanto para iniciantes quanto para usuários avançados.

O OhMyPosh é um mecanismo de temas de prompt universal para qualquer shell, com um toque especial para os amantes da pesca (fishing). Ele oferece uma variedade de prompts lindos e personalizáveis que exibem informações úteis, como o status do Git e informações do sistema.

Após seguir este tutorial, você terá um terminal Linux totalmente funcional e com uma aparência personalizada, muito além do tradicional preto ou branco. Prepare-se para turbinar o seu terminal com alguns aliases!

### Instalando o Fish Shell

Para sistemas Ubuntu/Debian/Linux Mint, execute o seguinte comando:

```bash
sudo apt install fish -y
```

### Instalando o Homebrew

Para instalar o Oh My Posh use o Homebrew, se não tem instalado use o comando:

```fish
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Configurando seu terminal com Oh My Posh no Linux

1. **Configuração do terminal:**

   - O Oh My Posh utiliza códigos de cores ANSI por baixo dos panos, que devem funcionar em todos os terminais. No entanto, você pode precisar definir a variável de ambiente `$TERM` como `xterm-256color` para que funcione corretamente.
2. **Informações importantes:**

   - Para exibir todos os ícones, recomendamos o uso de uma fonte Nerd.
3. **Instalação:**

   - Manualmente ou via Homebrew (para Linux):

     - Manualmente:

       - Siga as instruções detalhadas para adicionar o Homebrew ao seu PATH e ao script de perfil do shell (bash).
       - Atenda aos requisitos para compilar o Oh My Posh.
     - Homebrew (Linux):

       - Execute o seguinte comando para instalar o Oh My Posh:

         ```fish
         brew install jandedobbeleer/oh-my-posh/oh-my-posh
         ```
       - Isso instala duas coisas:

         - `oh-my-posh`: O executável, adicionado a `$(brew --prefix)/bin`.
         - `themes`: Os temas mais recentes do Oh My Posh.
       - Se você deseja usar um tema predefinido, encontre-os em `$(brew --prefix oh-my-posh)/themes`. Referenciar os temas dessa forma garantirá compatibilidade ao atualizar o Oh My Posh.
4. **Atualização:**

   - Execute o seguinte comando para atualizar o Oh My Posh:

```fish
brew update && brew upgrade oh-my-posh
```

- Se notar comportamento estranho no seu shell, recarregue-o após atualizar o Oh My Posh. Por exemplo, no zsh:

```fish
brew update && brew upgrade && exec zsh          
```

### Baixando e instalando as fontes

Crie um diretório chamado “fonts” em `$HOME/.local/share/`:

```fish
mkdir -p $HOME/.local/share/fonts
```

Baixe a fonte Nerd Font - FiraCode:

```fish
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip -O $HOME/Downloads/firacode.zip
unzip $HOME/Downloads/firacode.zip -d $HOME/.local/share/fonts
```

Atualize o cache de fontes:

```fish
fc-cache -f -v
```

As podem ser instaladas pelo Homebrew ou pelo Oh My Posh:

Homebrew

```fish
brew search nerd-font
brew install --cask font-fira-code-nerd-font
```

Oh My Posh

```fish
oh-my-posh font install
oh-my-posh font install meslo
```

Altere a fonte do seu sistema para “FiraCode Nerd Font Mono” através das configurações do GNOME Tweak. Se você ainda não tiver o GNOME Tweak instalado, use os comandos abaixo para instalá-lo:

- Ubuntu/Debian/Linux Mint:

```bash
sudo apt install gnome-tweaks -y
```

### Baixando e instalando os temas do OhMyPosh

Crie um diretório chamado “.poshthemes”:

```bash
mkdir ~/.poshthemes
```

Baixe os temas do OhMyPosh:

```bash
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip
```

### Adicionando o tema do OhMyPosh à configuração do Fish

Abra o arquivo `config.fish` com o editor de texto de sua preferência (por exemplo, gedit, nano ou outro):

```bash
gedit $HOME/.config/fish/config.fish
```

> Se você não tem idéia de qual shell você está usando atualmente, Oh My Posh tem um interruptor de utilidade que pode dizer isso para você.
>
> ```fish
> oh-my-posh get shell
> ```

Adicione a seguinte linha ao arquivo:

```fish
oh-my-posh init fish --config $HOME/.poshthemes/montys.omp.json | source
```

Uma vez adicionado, recarregue sua configuração para que as alterações entrem em vigor.

```fish
exec fish
```

### Alterando o esquema de cores do terminal

Execute o seguinte comando:

```fish
bash -c "$(wget -qO- https://git.io/vQgMr)"
```

Digite o número 69 para escolher o tema “Everforest Dark Hard”.

![Gogh](/_resources/Fish2.png)

![Gogh - Rodando](/_resources/Fish3.png)

Por fim, faça logout da sessão atual e faça login novamente para que as alterações tenham efeito. Agora, o terminal GNOME usará o shell Fish como padrão. 🎉

![Fish](/_resources/Fish4.png)

#### Outros temas Oh My Posh

Claro! Vou traduzir e melhorar o texto para você. 😊

---

**Personalize o Oh My Posh: Como configurar temas e personalizações**

O Oh My Posh é uma ferramenta que permite personalizar o prompt do seu shell (como Bash, Zsh ou Fish) com temas e ícones. Aqui estão as etapas para personalizar o Oh My Posh:

1. **Configuração Padrão:**

   - O Oh My Posh vem com um tema padrão embutido, que é atualizado automaticamente.
   - Para definir um novo tema ou configuração, você precisa alterar a opção `--config` no comando `oh-my-posh init` no seu perfil ou script `.rc` do seu shell.
   - Você pode apontar para um arquivo de configuração local ou uma URL remota. Por exemplo:

     ```
     oh-my-posh init fish --config ~/jandedobbeleer.omp.json | source
     ```
   - Depois de fazer essa alteração, recarregue a configuração para que as mudanças tenham efeito.
2. **Inspiração:**

   - O instalador do Oh My Posh para Windows e Homebrew inclui temas predefinidos.
   - Você pode referenciar esses temas diretamente para mantê-los atualizados e compatíveis com futuras atualizações.
   - Por exemplo, para usar o tema “jandedobbeleer”, altere o comando de inicialização para:

     ```
     eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jandedobbeleer.omp.json)"
     ```
3. **Ajustando um Tema:**

   - Se você gosta de um tema, mas não gosta das cores ou deseja fazer outras alterações, exporte o tema atual para um formato (JSON, YAML ou TOML) que você possa ajustar e salvar como seu próprio tema personalizado:

     ```
     oh-my-posh config export --output ~/.mytheme.omp.json
     ```
   - Lembre-se de não modificar os arquivos de tema originais, pois eles são atualizados junto com o Oh My Posh. Sempre faça cópias ou exporte-os para uma nova localização.

# Outras personalização

## Starship

O prompt mínimo, rápido e infinitamente personalizável para qualquer shell!

### Requisitos

- A `<ins>`[Fonte Nerd](https://www.nerdfonts.com/)`</ins>` instalado e ativado no seu terminal.

### Instalação Rápida

1. Instale o **Starship** binário:

```fish
curl -sS https://starship.rs/install.sh | fish
```

Para atualizar a própria nave estelar, execute novamente o script acima. Ele substituirá a versão atual sem tocar na configuração do Starship.

#### Instale via Gerenciador de Pacotes

Com Homebrew:

```fish
brew install starship
```

## Oh-my-fish

Oh My Fish fornece infraestrutura básica para permitir que você instale pacotes que estendem ou modificam a aparência do seu shell. É rápido, extensível e fácil de usar.

### Configuração do OMF (Oh My Fish) para Personalizar o Shell Fish

Recentemente, escrevi um artigo sobre como instalar o Fish (Friendly Interactive Shell), um shell de linha de comando inteligente e amigável. Hoje, vamos explorar como personalizar ainda mais o Fish usando o Oh My Fish (OMF). O OMF é um complemento que permite instalar pacotes para estender as funcionalidades do shell ou modificar sua aparência. Vamos dar uma olhada nas etapas para configurar o OMF e aproveitar ao máximo o Fish shell.

### Requisitos

- Fish Shell, versão 2.2 ou posterior

### Instalação

A instalação do OMF é simples. Basta executar o seguinte comando no seu terminal Fish:

```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

Você pode começar imediatamente com a configuração padrão executando isto em seu terminal.

Após a instalação, você notará algumas mudanças no seu shell. A hora atual será exibida à direita da janela.

## Listando Pacotes e Temas

Para listar todos os pacotes instalados, use o comando:

```shell
omf list
```

Lembre-se de que instalar pacotes significa instalar temas ou complementos. Todos os pacotes compatíveis, oficiais e comunitários, são hospedados no repositório principal do Oh My Fish. Nesse repositório, você encontrará outros repositórios com uma variedade de complementos e temas.

## Explorando Temas

Vamos verificar os temas disponíveis e instalados:

```shell
omf theme
```

Atualmente, temos apenas o tema padrão. No entanto, há muitos outros temas disponíveis. Você pode conferir todos os temas. Essa página contém detalhes sobre cada tema e seus recursos.

Para instalar um novo tema, como o “ocean”, execute:

```shell
omf install ocean
```

O tema será aplicado imediatamente após a instalação. Se você tiver vários temas instalados, poderá alternar entre eles usando o comando:

```shell
omf theme fox
```

Agora você estará usando o tema “fox”, que já foi instalado anteriormente.

## Buscando Temas e Complementos

Para buscar temas e complementos no OMF, utilize o comando:

```shell
omf search "pacote"
```

Se quiser limitar a busca a temas, use a opção “-t”. Para complementos, use a opção “-p”.

## Explorando Mais Funcionalidades

Caso surjam dúvidas ou se você quiser explorar outras funcionalidades do OMF, utilize o comando:

```shell
omf --help
```

## Desinstalando o OMF

Se desejar desinstalar o OMF, execute o seguinte comando:

```shell
omf destroy
```

Agora você está pronto para personalizar seu Fishshell com temas e complementos usando o Oh My Fish. Divirta-se explorando todas as possibilidades! 🐟🔥

## Referências

[Dicas para quem utiliza o Shell Fish](https://www.tabnews.com.br/thiagookan/dicas-para-quem-utiliza-o-shell-fish)

[Linuxscoop](https://www.pling.com/u/lsteam/)

[Documentations and Configurations Fish Shell and Oh My Posh](https://www.pling.com/p/2179556)

[Nerd Fonts](https://www.nerdfonts.com/)

[SempreUpdate - OMF (Oh My Fish), personalize o Shell Fish](https://sempreupdate.com.br/omf-oh-my-fish-personalize-o-shell-fish/)

[Oh My Posh](https://ohmyposh.dev/)

[Oh My Posh - Temas](https://ohmyposh.dev/docs/themes)

[Homebrew](https://brew.sh/)

[Fish](https://fishshell.com/)
