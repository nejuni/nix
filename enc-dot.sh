#!/usr/bin/env bash

rm -f enc-dot.tar enc-dot.tar.age

tar -cpf enc-dot.tar enc-dot/

mkdir -p "bac/$(date +%d-%m-%Y_%H-%M-%S)"
cp enc-dot.tar "bac/$(date +%d-%m-%Y_%H-%M-%S)/"

age -p -o enc-dot.tar.age enc-dot.tar

rm enc-dot.tar

gum style --foreground 81 "Encryption Successful"