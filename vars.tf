variable "email_html_90" {
  type    = string
  default = <<HTML
  <!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Access Keys Expired</title>
  </head>
  <body
    style="
      font-family: Arial, sans-serif;
      color: #555;
      background-color: #f9f9f9;
      padding: 20px;
    "
  >
    <table
      cellpadding="0"
      cellspacing="0"
      border="0"
      width="100%"
      style="
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
      "
    >
      <tr>
        <td style="padding: 40px; text-align: center">
          <h1
            style="
              margin-top: 0;
              color: #ee3f4c;
              font-size: 48px;
              letter-spacing: -2px;
              text-shadow: 2px 2px #fff;
            "
          >
            Access Keys Expired
          </h1>
          <p style="font-size: 24px; margin-bottom: 40px">
            Your access keys have expired. Please log in to your account and
            generate new keys to continue accessing our services.
          </p>
          <img
            src="https://cdn-icons-png.flaticon.com/512/4201/4201973.png"
            alt="Access Keys Expired"
            style="
              display: block;
              max-width: 100%;
              height: auto;
              margin: 0 auto;
              border-radius: 5px;
            "
          />
        </td>
      </tr>
      <tr>
        <td
          style="
            background-color: #ee3f4c;
            padding: 20px;
            color: #fff;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
          "
        >
          <p style="margin: 0">
            If you have any questions or concerns, please contact AWS Admins
          </p>
        </td>
      </tr>
    </table>
  </body>
</html>
  HTML
}

variable "email_html_80" {
  type    = string
  default = <<HTML
  <!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Access Keys Expired</title>
  </head>
  <body
    style="
      font-family: Arial, sans-serif;
      color: #555;
      background-color: #f9f9f9;
      padding: 20px;
    "
  >
    <table
      cellpadding="0"
      cellspacing="0"
      border="0"
      width="100%"
      style="
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
      "
    >
      <tr>
        <td style="padding: 40px; text-align: center">
          <h1
            style="
              margin-top: 0;
              color: #fdd017;
              font-size: 48px;
              letter-spacing: -2px;
              text-shadow: 2px 2px #fff;
            "
          >
            Access Keys Expired
          </h1>
          <p style="font-size: 24px; margin-bottom: 40px">
            Your access keys have expired. Please log in to your account and
            generate new keys to continue accessing our services.
          </p>
          <img
            src="https://cdn-icons-png.flaticon.com/512/4201/4201973.png"
            alt="Access Keys Expired"
            style="
              display: block;
              max-width: 100%;
              height: auto;
              margin: 0 auto;
              border-radius: 5px;
            "
          />
        </td>
      </tr>
      <tr>
        <td
          style="
            background-color: #fdd017;
            padding: 20px;
            color: #fff;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
          "
        >
          <p style="margin: 0">
            If you have any questions or concerns, please contact AWS Admins
          </p>
        </td>
      </tr>
    </table>
  </body>
</html>
  HTML
}

variable "email_html_70" {
  type    = string
  default = <<HTML
  <!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Access Keys Expired</title>
  </head>
  <body
    style="
      font-family: Arial, sans-serif;
      color: #555;
      background-color: #f9f9f9;
      padding: 20px;
    "
  >
    <table
      cellpadding="0"
      cellspacing="0"
      border="0"
      width="100%"
      style="
        max-width: 600px;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
      "
    >
      <tr>
        <td style="padding: 40px; text-align: center">
          <h1
            style="
              margin-top: 0;
              color: #00FF00;
              font-size: 48px;
              letter-spacing: -2px;
              text-shadow: 2px 2px #fff;
            "
          >
            Access Keys Expired
          </h1>
          <p style="font-size: 24px; margin-bottom: 40px">
            Your access keys have expired. Please log in to your account and
            generate new keys to continue accessing our services.
          </p>
          <img
            src="https://cdn-icons-png.flaticon.com/512/4201/4201973.png"
            alt="Access Keys Expired"
            style="
              display: block;
              max-width: 100%;
              height: auto;
              margin: 0 auto;
              border-radius: 5px;
            "
          />
        </td>
      </tr>
      <tr>
        <td
          style="
            background-color: #00FF00;
            padding: 20px;
            color: #fff;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
          "
        >
          <p style="margin: 0">
            If you have any questions or concerns, please contact AWS Admins
          </p>
        </td>
      </tr>
    </table>
  </body>
</html>
  HTML
}

variable "ses_region" {
  description = "The ses region where the resources will be used"
  type        = string

  validation {
    condition     = can(regex("^([a-z]+-){1,2}[1-9][0-9]{0,1}$", var.ses_region))
    error_message = "Invalid AWS region format. Example: us-west-2, eu-west-1, ap-southeast-2"
  }
}

variable "ses_email" {
  description = "The email address for the ses"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.email_address))
    error_message = "Invalid email address format. Example: user@example.com"
  }
}
