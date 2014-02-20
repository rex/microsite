<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en">
  <head>
    <title>Sexy Microsite</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="/css/style.css{{cachebust}}" />
    {{#reload}}
      <script src="/socket.io/socket.io.js"></script>
      <script src="/js/reload-client.js"></script>
    {{/reload}}

    {{#optimize}}
      <script src="/js/main-built.js"></script>
    {{/optimize}}

    {{^optimize}}
      <script src="/js/vendor/requirejs/require.js" data-main="/js/main.js"></script>
    {{/optimize}}

  </head>
  <body>

    <div class="row">
      <div class="small-8 small-centered columns" id="canvas"></div>
    </div>
  </body>
</html>