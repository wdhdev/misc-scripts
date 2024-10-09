#!/bin/bash
# Script created by @groundcat

resolvers=("1.1.1.1" "8.8.8.8")
domains=(
    ""
)

query_txt_record() {
    local domain=$1
    for resolver in "${resolvers[@]}"; do
        result=$(dig @$resolver TXT _psl."$domain" +short)
        if [[ -n $result ]]; then
            echo "Resolver: $resolver | Domain: $domain"
            echo "TXT Record: $result"
            echo "----------------------------------------"
        else
            echo "Resolver: $resolver | Domain: $domain"
            echo "No TXT record found for _psl.$domain"
            echo "----------------------------------------"
        fi
    done
}

for domain in "${domains[@]}"; do
    query_txt_record "$domain"
done
