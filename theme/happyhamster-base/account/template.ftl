<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>${msg("accountManagementTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/icons/favicon.ico">
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</head>
<body class="admin-console user ${bodyClass}">
    <div class="wrapper">
        <div class="wrapper-inner">
            <header class="navbar navbar-default navbar-pf navbar-main header">
                <nav class="navbar" role="navigation">
                    <div class="navbar-header">
                        <img id="logo" src="${url.resourcesPath}/img/logo/vect/logo.svg">
                    </div>
                    <div class="navbar-collapse navbar-collapse-1">
                        <div class="container">
                            <ul class="nav navbar-nav navbar-utility">
                                <!-- NOT IMPLEMENTED
                                <#if realm.internationalizationEnabled>
                                    <li>
                                        <div class="kc-dropdown" id="kc-locale-dropdown">
                                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                            <ul>
                                                <#list locale.supported as l>
                                                    <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                                </#list>
                                            </ul>
                                        </div>
                                    <li>
                                </#if>
                                -->
                                <#if referrer?has_content && referrer.url?has_content><li><a href="${referrer.url}" id="referrer"><svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M36 15.75H8.6175L21.195 3.1725L18 0L0 18L18 36L21.1725 32.8275L8.6175 20.25H36V15.75Z" fill="#26C485"/>
</svg>
<label>${msg("backTo",referrer.name)}</label></a></li></#if>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>

            <div class="container">
                <div class="bs-sidebar col-sm-3">
                    <ul id="defaultNav">
                        <li class="<#if active=='account'>active</#if>"><a href="${url.accountUrl}">${msg("account")}</a></li>
                        <#if features.passwordUpdateSupported><li class="<#if active=='password'>active</#if>"><a href="${url.passwordUrl}">${msg("password")}</a></li></#if>
                        <li class="<#if active=='totp'>active</#if>"><a href="${url.totpUrl}">${msg("authenticator")}</a></li>
                        <#if features.identityFederation><li class="<#if active=='social'>active</#if>"><a href="${url.socialUrl}">${msg("federatedIdentity")}</a></li></#if>
                        <li class="<#if active=='sessions'>active</#if>"><a href="${url.sessionsUrl}">${msg("sessions")}</a></li>
                        <li class="<#if active=='applications'>active</#if>"><a href="${url.applicationsUrl}">${msg("applications")}</a></li>
                        <#if features.log><li class="<#if active=='log'>active</#if>"><a href="${url.logUrl}">${msg("log")}</a></li></#if>
                        <#if realm.userManagedAccessAllowed && features.authorization><li class="<#if active=='authorization'>active</#if>"><a href="${url.resourceUrl}">${msg("myResources")}</a></li></#if>
                        <li class="logout-link"><a href="${url.logoutUrl}">${msg("doSignOut")}</a></li>
                    </ul>

                    <select id="mobileNav" onchange="window.location.href=this.value">
                        <option <#if active=='account'>selected</#if> value="${url.accountUrl}">${msg("account")}</option>
                        <#if features.passwordUpdateSupported><option <#if active=='password'>actiselectedve</#if> value="${url.passwordUrl}">${msg("password")}</option></#if>
                        <option <#if active=='totp'>selected</#if> value="${url.totpUrl}">${msg("authenticator")}</option>
                        <#if features.identityFederation><option <#if active=='social'>selected</#if> value="${url.socialUrl}">${msg("federatedIdentity")}</option></#if>
                        <option <#if active=='sessions'>selected</#if> value="${url.sessionsUrl}">${msg("sessions")}</option>
                        <option <#if active=='applications'>selected</#if> value="${url.applicationsUrl}">${msg("applications")}</option>
                        <#if features.log><option <#if active=='log'>selected</#if> value="${url.logUrl}">${msg("log")}</option></#if>
                        <#if realm.userManagedAccessAllowed && features.authorization><option <#if active=='authorization'>selected</#if> value="${url.resourceUrl}">${msg("myResources")}</option></#if>
                        <option class="logout-link" value="${url.logoutUrl}">${msg("doSignOut")}</option>
                    </select>
                </div>

                <div class="col-sm-9 content-area">
                    <#if message?has_content>
                        <div class="alert alert-${message.type}">
                            <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>
                            <#if message.type=='error' ><span class="pficon pficon-error-circle-o"></span></#if>
                            <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>

                    <#nested "content">
                </div>
            </div>
        </div>
        <#include "footer.ftl">
    </div>
</body>
</html>
</#macro>