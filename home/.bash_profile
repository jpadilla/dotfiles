# Load ~/.extras, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions, and ~/.secret
for file in ~/.{extras,bash_prompt,exports,aliases,functions,secret}; do
    [ -r "$file" ] && source "$file"
done
unset file
