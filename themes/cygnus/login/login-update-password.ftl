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
        <title>${msg("updatePasswordTitle")}</title>
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
                <h3 class="text-uppercase">${msg("updatePasswordTitle")}</h3>
              </div>
            <#if message?has_content>
                <div class="alert alert-danger" role="alert">
                  ${message.summary?no_esc}
                </div>
            </#if>
              <form id="passwd-update-form" action="${url.loginAction}" method="post">
                    <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                    <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>
                    <div class="form-group">
                       <label for="password-new">${msg("passwordNew")}</label>
                       <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!}" autofocus autocomplete="new-password" />
                    </div>
                    <div class="form-group">
                       <label for="password-confirl">${msg("passwordConfirm")}</label>
                       <input type="password" id="password-confirm" name="password-confirm" class="${properties.kcInputClass!}" autofocus autocomplete="confirm-password" />
                    </div>


                <input class="btn btn-block py-2 btn-primary" type="submit" value="${msg("doSubmit")}"/>

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

