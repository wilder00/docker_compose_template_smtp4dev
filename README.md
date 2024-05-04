construir el contenedor
```sh
docker-compose build
```

correr el contenedor
```sh
docker-compose up
```

run with rebuild the container
```sh
docker-compose build docker-compose up
```


## smtp4dev
https://github.com/rnwood/smtp4dev/wiki/Installation
https://github.com/rnwood/smtp4dev/blob/master/docker-compose.yml
https://hub.docker.com/r/rnwood/smtp4dev/tags/


just docker 

```
docker run --rm -it -p 5000:80 -p 2525:25 rnwood/smtp4dev
```

## how to use

corres
```
docker up
```
en tu codigo envias un mail por ejemplo:

```js
const { createTransport } = require('nodemailer');

const transporter = createTransport({
    host: "host.docker.internal",
    port: 25,
    /* auth: {
        user: "<your-login>",
        pass: "<your-key>",
    }, */
});

const mailOptions = {
    from: 'test@test.com',
    to: 'test@host.docker.internal',
    subject: `Your subject`,
    text: `Your text content`
};

transporter.sendMail(mailOptions, function(error, info){
    if (error) {
        console.log(error);
    } else {
        console.log('Email sent: ' + info.response);
    }
});

```
- los mails se escuchan en el puerto 25
- La interface gráfica para ver los correos son en el puerto 5005
- el host que utiliza y setea docker es: host.docker.internal
