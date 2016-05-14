# Load ~/.extras, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions, and ~/.secret
for file in ~/.{exports,extras,bash_prompt,aliases,functions,secret}; do
    [ -r "$file" ] && source "$file"
done
unset file

source /usr/local/lib/dnx/bin/dnvm.sh
