galaxy http proxy
=================

# galaxyをapache httpd またはnginxなどの下で動かすためのcookbook


## TODO

* nginxにはまだ対応していないので、対応する
* galaxyのレシピの中で、最初の起動の時にデータベースのセットアップが行われるがこれが結構な時間がかかるので、その部分が終わるまでの処理が必要かもしれない
* apache2::mod_proxyで入れたモジュールがDeny, Allowともに from all なのでここを適切に設定する必要がある
* centosの場合にはselinuxについても検討する必要があるかもしれない

