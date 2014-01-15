# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extras,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file
