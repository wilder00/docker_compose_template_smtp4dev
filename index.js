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