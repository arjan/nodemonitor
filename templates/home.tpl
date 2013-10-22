<html>
    <head>
        <title>Node monitor</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        {% lib "css/reset.css" "css/nodemonitor.css" %}
    </head>
    <body>
        <div id="container">
        <div id="header">
            <h1>Node monitor</h1>
        </div>
        <div id="content">
            <h2>Nodes</h2>

            <div id="nodes">
                {% include "_nodes.tpl" %}
            </div>

            {% wire action={connect signal={node_update} action={update target="nodes" template="_nodes.tpl"}} %}
        </div>
    </div>

    {% include "_js_include.tpl" %}
    {% stream %}
    {% script %}
</body>
</html>

