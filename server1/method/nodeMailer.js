const nodeMailer = require('nodemailer');
var crypto = require('crypto');

const sendMail = async (email, username,otp) => {

  var message = {
    from: 'kharchaOfficial@gmail.com',
    to: `Bikraj Shrestha ${email}`,
    subject:
      'Forgot Password? Dont worry we GOT you covered because the north remembers',
    text: 'For clients with plaintext support only',
    html: `<html>
  <body>
    <div>
      <h1>Your One Time Password for ${username}</h1>
      <p>If you didnot request this email , please contact our support.</p>
      <div style="height: 40px; width:150px;  background-color: rgb(78, 72, 72); color: white; margin:auto; font-size:24px">
      <p style="text-align:center; justify-content: center;">${otp}</p>
      </div>
    </div>
  </body>
</html>`,
  };
  var mailer = nodeMailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'kharchaofficial@gmail.com',
      pass: 'bmclwcxndrxygkqr',
    },
  });
  try {
    var info = await mailer.sendMail(message)
  } catch (e) {
    throw e;
  }
};

module.exports = sendMail