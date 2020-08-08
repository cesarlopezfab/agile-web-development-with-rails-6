
Web console (to show errors) is only enabled in the same machine the server is 
running. It can be whitelisted by ip in `config/environments/development.rb`
```
config.​web_console​.​whitelisted_ips​ = ​%w( 0.0.0.0/0 ::/0 )​
```

