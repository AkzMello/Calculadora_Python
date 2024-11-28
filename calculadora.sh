#!/bin/bash

while true; do
    echo "Para iniciar uma operação, digite 'Entrar'. Para sair, digite 's':"
    read escolha

    if [[ "$escolha" == "s" ]]; then
        echo "Saindo da calculadora."
        break
    fi

    if [[ "$escolha" == "Entrar" ]]; then
        echo "Digite o primeiro número:"
        read num1

        echo "Digite o segundo número:"
        read num2

        echo "Escolha a operação (+, -, *, /):"
        read operacao

        case $operacao in
            "+")
                resultado=$(echo "$num1 + $num2" | bc)
                ;;
            "-")
                resultado=$(echo "$num1 - $num2" | bc)
                ;;
            "*")
                resultado=$(echo "$num1 * $num2" | bc)
                ;;
            "/")
                if [ "$num2" -ne 0 ]; then
                    resultado=$(echo "scale=2; $num1 / $num2" | bc)
                else
                    echo "Erro: Divisão por zero não é permitida."
                    continue
                fi
                ;;
            *)
                echo "Operador inválido, por favor escolha entre +, -, *, /."
                continue
                ;;
        esac
        echo "Resultado: $resultado"
    else
        echo "Opção inválida."
    fi
done

