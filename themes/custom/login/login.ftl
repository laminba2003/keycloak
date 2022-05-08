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
        <title>${msg("loginTitle",(realm.displayName!''))}</title>
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
                <h3 class="text-uppercase">${msg("loginTitle",(realm.displayName!''))}</h3>
              </div>
            <#if message?has_content>
                <div class="alert alert-danger" role="alert">
                  ${message.summary}
                </div>
            </#if>
              <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="form-group first">
                  <label for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                <#if usernameEditDisabled??>
                    <input tabindex="1" required id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" disabled />
                <#else>
                    <input tabindex="1" required id="username" class="form-control" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                </#if>

                </div>
                <div class="form-group last mb-3">
                   <label for="password">${msg("password")}</label>
                   <input tabindex="2" required id="password" class="form-control" name="password" type="password" autocomplete="off" />
                </div>

                <div class="d-sm-flex mb-5 align-items-center">
                  <#if realm.rememberMe>
                  <label class="control control--checkbox mb-3 mb-sm-0"><span class="caption">${msg("rememberMe")}</span>
                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                    <div class="control__indicator"></div>
                  </label>
                  </#if>
                  <#if realm.resetPasswordAllowed>
                  <span class="ml-auto"><a tabindex="5" class="forgot-pass" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                  </#if>
                </div>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                <input tabindex="4" class="btn btn-block py-2 btn-primary" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>

                <#if realm.password && social.providers??>
                    <span class="text-center my-3 d-block">or</span>

                         <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                                    <#list social.providers as p>
                                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                                    </#list>
                                </ul>
                            </div>
                            <br style="float:clear">
                 </#if>

                 <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                 <div class="d-sm-flex mb-5 align-items-center">
                   <span class="ml-auto">${msg("noAccount")} <a tabindex="6" class="register" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                  </div>
                </#if>

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

