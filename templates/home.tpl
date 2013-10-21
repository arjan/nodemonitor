<html>
    <head>
        <title>Node monitor</title>

        {% lib "css/reset.css" "css/nodemonitor.css" %}
        <script src="/lib/jquery.min.js" type="text/javascript"></script>
        <script src="/lib/jquery-ui.min.js" type="text/javascript"></script>
        <script src="/lib/eee.js" type="text/javascript"></script>
        <link rel="stylesheet" href="/lib/reset.css"></link>
        <link rel="stylesheet" href="/lib/eee.css"></link>
    </head>
    <body>

        <div id="header">
            <h1>Node monitor</h1>
        </div>
        <div id="content">
            <h2>Nodes</h2>

            <div id="nodes">
                {% include "_nodes.tpl" %}
            </div>
        </div>
    </body>
</html>

