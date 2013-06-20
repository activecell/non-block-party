sand
======

How to get this running:

```
$ git clone git@github.com:switz/sand.git

$ cd sand

$ npm install

# In a new terminal start mongodb
$ mongod

$ grunt compile

$ node server.js

# visit http://localhost:3000
```

## Testing

```
# install casperjs from source (1.0.2)

# clear local database
$ grunt drop

$ casperjs test test/casper/standup.casper.coffee
```

