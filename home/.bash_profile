# Load ~/.extras, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions, and ~/.secret
for file in ~/.{exports,bash_prompt,aliases,functions,extras,secret}; do
    [ -r "$file" ] && source "$file"
done
unset file
