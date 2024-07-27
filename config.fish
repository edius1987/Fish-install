oh-my-posh init fish --config $HOME/.poshthemes/montys.omp.json | source

# starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# PATH
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if status --is-login
    set -gx PATH $PATH ~/edius/bin
end

function fish_greeting
    # Fish
    echo '                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')    '(set_color red)(whoami)'@'(hostname)'
[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')'(set_color yellow)'    Tempo ativo: '(set_color white)(uptime | sed 's/.*up \([^,]*\), .*/\1/')(set_color red)'
 \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')    IP: '(set_color white)(hostname -I)(set_color red)'
  \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)     '(set_color yellow)'Versão Fish: '(set_color white)(echo $FISH_VERSION)(set_color red)'
   \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\    '(set_color 613583; lsb_release -d)'
   '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
  (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
  '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
   '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
          '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                      '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                      (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                       (UU)'(set_color normal)
                       
# Mensagem
# Mensagem em vermelho
# echo 💫 (set_color a51d2d)'Lembre-se, cada dia é uma nova oportunidade de brilhar!'

echo (set_color 63452c; fortune)
    switch (random 1 5)
        case 1
            echo "🐟"
        case 2
            echo "🐠"
        case 3
            echo "🐡"
        case 4
            echo "🐳"
        case 5
            echo "🦈"
    end
# Mensagem em vermelho
echo (set_color F90)'Digite help para instruções ou fish_config para configurações.'

# Exibição da hora e nome da máquina
echo (set_color 1a5fb4)'A hora é' (set_color a51d2d; date "+%d/%m/%Y %H:%M:%S"; set_color normal) (set_color 1a5fb4)'e esta máquina se chama' $hostname.

# Obtendo o endereço IP da máquina
echo IP:(set_color 01FF00; hostname -I)
echo (set_color 613583; lsb_release -d) (set_color 613583; lsb_release -c) 
end
