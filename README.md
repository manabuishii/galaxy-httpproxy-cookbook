galaxy http proxy
=================

# galaxyをapache httpd またはnginxなどの下で動かすためのcookbook

### sample

run_listに以下を記述

>    "recipe[galaxy@0.5.1]",
>    "recipe[apache2]",
>    "recipe[apache2::mod_proxy]",
>    "recipe[apache2::mod_proxy_http]",
>    "recipe[galaxy-httpproxy]"



## TODO

* nginxにはまだ対応していないので、対応する
* galaxyのレシピの中で、最初の起動の時にデータベースのセットアップが行われるがこれが結構な時間がかかるので、その部分が終わるまでの処理が必要かもしれない
* apache2::mod_proxyで入れたモジュールがDeny, Allowともに from all なのでここを適切に設定する必要がある
* centosの場合にはselinuxについても検討する必要があるかもしれない

