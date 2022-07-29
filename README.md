# README

## 環境構築

### elasticsearchの構築手順   

    $ brew tap elastic/tap  
    $ brew install elastic/tap/elasticsearch-full 
    $ elasticsearch-plugin install analysis-kuromoji  
    $ bin/rails r Event.reindex 
    $ elasticsearch 

### Githubでログイン    

手動でOAuthを作成してないと下記のエラーが発生する   

    ActionController::RoutingError (No route matches [POST] "/auth/github"):  

下記のgithub画面からOAuthを作成   
https://github.com/settings/developers    
    [New OAuth App]を押下  
    入力項目 
    ・Application name: awesome events    
    ・Homepage URL: http://localhost:3000/    
    ・Application description: web application for awesome events   
    ・Authorization callback URL: http://localhost:3000/auth/github/callback    

### アプリ起動    
ターミナルを２つ用意

    $ bundle exec rails c  
    $ elasticsearch  
