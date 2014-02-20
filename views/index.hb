<!DOCTYPE html>
<html>
  <head>
    <title>Mimosa</title>

    <link rel="stylesheet" href="/css/style.css{{cachebust}}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

    <p>Welcome to Mimosa</p>

    {{#optimize}}
    <p>Optimized mode.  You are getting a single RequireJS optimized JavaScript file which includes all the page dependencies.</p>
    {{/optimize}}

  </body>
</html>