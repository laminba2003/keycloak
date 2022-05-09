<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

     <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>
        <title>${msg("registerTitle",(realm.displayName!''))}</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
        <#if properties.stylesCommon?has_content>
            <#list properties.stylesCommon?split(' ') as style>
                <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>

  </head>
  <body>



  <div class="d-md-flex half">
    <div class="bg"></div>
    <div class="contents">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12">
            <div class="form-block mx-auto">
              <div class="text-center mb-5">
                <h3 class="text-uppercase">${msg("registerTitle")}</h3>
              </div>
            <#if message?has_content>
                <div class="alert alert-danger" role="alert">
                  ${message.summary?no_esc}
                </div>
            </#if>
              <form class="register-form" action="${url.registrationAction}" method="post">
                <div class="form-group first">
                 <label for="firstName">${msg("firstName")}</label>
                 <input type="text" id="firstName" class="form-control" name="firstName" value="${(register.formData.firstName!'')}" />
                </div>
                <div class="form-group">
                 <label for="lastName">${msg("lastName")}</label>
                 <input type="text" id="lastName" class="form-control" name="lastName" value="${(register.formData.lastName!'')}" />
                </div>
                <div class="form-group">
                 <label for="email">${msg("email")}</label>
                 <input type="text" id="email" class="form-control" name="email" value="${(register.formData.email!'')}" />
                </div>
                 <#if !realm.registrationEmailAsUsername>
                    <div class="form-group">
                     <label for="username">${msg("username")}</label>
                     <input type="text" id="username" class="form-control" name="username" value="${(register.formData.username!'')}" />
                    </div>
                  </#if>
                <#if passwordRequired??>
                    <div class="form-group">
                       <label for="password">${msg("password")}</label>
                       <input id="password" class="form-control" type="password" name="password" />
                    </div>
                    <div class="form-group">
                       <label for="password-confirm">${msg("passwordConfirm")}</label>
                       <input id="password-confirm" class="form-control" type="password" name="password-confirm" />
                    </div>
                </#if>

                <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
                </#if>


                <input class="btn btn-block py-2 btn-primary" name="login" id="kc-login" type="submit" value="${msg("doRegister")}"/>

                 <div class="d-sm-flex mb-5 align-items-center">
                   <span class="ml-auto"><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                </div>


              </form>
            </div>
          </div>
        </div>
      </div>
    </div>


  </div>


<#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>

  </body>
</html>

