server '54.65.94.96', user: 'toki', roles: %w{server db web} 

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/mysong_key_rsa' 
