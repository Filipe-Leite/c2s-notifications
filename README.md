#### This project is a microsservice and it's part of a system. This project was a senior test for a company, the test consisted in make some microservices of authentications, web-scraping, tasks and notifications, the project should have a frontend and works on the following manner: The user create a task containing a link of a market web page and this task should have a button to make a web scraping for extract data from a product(the market place chosen for me was the HAVAN <https://www.havan.com.br/>. You can choose any product), when the task status change all the users should receive a notification. The project stack is listed below:

### Ruby - Ruby on rails:
#### The microservices was wrote in ruby and each microservice has one responsibility

Authentication [back-end]
Web-scraping [back-end]
Tasks [back-end]
Notifications [back-end]

### Typescript – React.js:
#### The frontend consumes all the microservices.

Front-end

### Databases:
#### Each microservice has one different database, the redis dabase is for store the notifications.

MySql
Redis

### Typescript – Node.js:
#### The websocket is listening the Redis channel for tasks updates notifications and seding a message to all logged users.

Websocket

## 1 - To run the project clone the following back-end repositories:

#### `https://github.com/Filipe-Leite/c2s-authetication`

`git clone git@github.com:Filipe-Leite/c2s-authetication.git`

#### `https://github.com/Filipe-Leite/c2s-notifications`

`git clone git@github.com:Filipe-Leite/c2s-notifications.git`

#### `https://github.com/Filipe-Leite/c2s-tasks`

`git clone git@github.com:Filipe-Leite/c2s-tasks.git`

#### `https://github.com/Filipe-Leite/c2s-web-scrapping`

`git@github.com:Filipe-Leite/c2s-web-scrapping.git`

## 2 - After clone the microservices go to each cloned repository (make sure you are using the correct Ruby language and Ruby On Rails versions) and run:

Rails server #on each terminal session for each repository above

## 3 - Clone the front-end repository

#### https://github.com/Filipe-Leite/c2s-frontend

git@github.com:Filipe-Leite/c2s-frontend.git

## 4 - Open 3 terminal sessions:

### 4.1 - Go to c2s-frontend directory and run:

npm start

### 4.2 - Make sure you have redis installed and run:

redis-server

### 4.3 - Go to c2s-frontend/server directory and run:

npm run dev
