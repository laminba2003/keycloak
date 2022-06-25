# Keycloak custom

### Local Keycloak server
A local Keycloak server based on [Bitnami Docker Image for Keycloak](https://github.com/bitnami/bitnami-docker-keycloak) is available as a Docker container for developing and testing the themes.

To bring up the server, make sure you’ve installed and started [Docker Community Edition](https://docs.docker.com/engine/installation/), then use the following commands:
```bash
$ docker-compose up --build
```
The Keycloak server will now be available on <http://localhost:8080/admin>. You can log into the Administration Console using “**admin**” as both username and "**password**" as password.

To enable a theme in the local Keycloak server, connect to the administration console.

You will now see the  theme when logging into the local Keycloak server. Changes made to the theme files will be visible on the local Keycloak server when you refresh the page in your browser.

### Testing Keycloak e-mails
The local Keycloak server includes MailDev, a mock SMTP server that you can use to receive and view Keycloak e-mails. It is available on <http://localhost:9999>.

To set up the local Keycloak server to send e-mails to MailDev:

1. Log in to [the local Keycloak server](http://localhost:8080).

2. Go to the “Email” tab in “Realm Settings”

3. Enter the following details:

    - Host: **maildev**

    - From: **keycloak@keycloak**

4. Click on “Save”

5. Click on “Admin” in the top-right-hand corner of the page, and click on “Manage Account”

6. Add an e-mail address to the admin account.

    It doesn’t matter what e-mail address you add, as all e-mails will be caught by MailDev. But you do need to add one, otherwise Keycloak will not send e-mails for this account.

The local Keycloak server should now be set up to send e-mails to MailDev. To check that it’s working:

1. Click on the “Back to Security Admin Console” link

2. Click on the “Login” tab in “Realm Settings”

3. Enable “Forgot password”, and click on “Save”

4. Sign out.

5. On the Keycloak log in screen, click on the “Forgot your password?” link

6. Enter your username (**admin**) in the text field, and submit the form.

7. Visit [MailDev](http://localhost:9999). You should see a reset password e-mail from Keycloak.

### Installation on Kubernetes with Helm

You can install this image on your kubernetes cluster using the [bitnami keycloak chart](https://github.com/bitnami/charts/tree/master/bitnami/keycloak) like this : 

```bash
$ helm install keycloak --set image.repository=laminba2003/keycloak,image.tag=1.0.0 bitnami/keycloak 
```
