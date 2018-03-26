#### Installation:
```
git clone https://github.com/yojo3000/fish_shell_prompt.git ~/fish_shell_prompt; sh ~/fish_shell_prompt/install.sh; source ~/.config/fish/config.fish
```

![](images/demo.png)

#### System Info:
```
infosys
```

#### Git Alias:
git logs:
```
git config --global alias.logs "log --graph --abbrev-commit --decorate --date=relative --all"
```

#### Docker Alias:
```
alias drm="docker rm -f (docker ps -a -q)"
alias di="docker images"
alias dp="docker ps"
alias dpa="docker ps -a"
alias drmnone="docker rmi (docker images --filter "dangling=true" -q --no-trunc)"
```
