#!/bin/bash

# Script de build para Vercel
# Cria automaticamente index.html do primeiro .html em ordem alfabética se não existir

if [ ! -f "index.html" ]; then
    # Encontra o primeiro arquivo .html em ordem alfabética (excluindo index.html)
    FIRST_HTML=$(ls *.html 2>/dev/null | grep -v "^index.html$" | sort | head -n 1)

    if [ -n "$FIRST_HTML" ]; then
        echo "index.html não encontrado. Usando $FIRST_HTML como página principal."
        cp "$FIRST_HTML" index.html
    else
        echo "Nenhum arquivo HTML encontrado!"
        exit 1
    fi
else
    echo "index.html já existe. Usando-o como página principal."
fi

echo "Build concluído!"
