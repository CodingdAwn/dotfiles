= fzf use=

* fzf 可以这么使用
```

cat ** tab 即可触发fzf搜索
kill -9 tab 即可触发 kill的模糊搜索 非常好用!

```


## 默认可以设置成这样，有border会好看很多
fzf --height 50% --layout reverse --border

## 结合bat preview高亮更好看
fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
