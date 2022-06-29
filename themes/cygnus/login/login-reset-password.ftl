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
        <title>${msg("emailForgotTitle")}</title>
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
                <h3 class="text-uppercase">${msg("emailForgotTitle")}</h3>
              </div>
              <div class="alert alert-info" role="alert">
                ${msg("emailInstruction")}
              </div>
            <#if message?has_content>
                <div class="alert alert-danger" role="alert">
                  ${message.summary}
                </div>
            </#if>
              <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="form-group first">
                  <label for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                  <#if auth?has_content && auth.showUsername()>
                      <input type="text" id="username" name="username" class="form-control" autofocus value="${auth.attemptedUsername}"/>
                  <#else>
                      <input type="text" id="username" name="username" class="form-control" autofocus/>
                  </#if>
                </div>

                 <input class="btn btn-block py-2 btn-primary" name="reset" id="reset" type="submit" value="${msg("doSubmit")}"/>


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

