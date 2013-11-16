<table class="data">
    <thead>
        <tr>
            <th width="17%">Seen</th>
            <th width="20%">Host</th>
            <th width="25%">App</th>
            <th width="20%">IP</th>
            <th width="1%">&nbsp;</th>
        </tr>
    </thead>
    <tbody>
        {% for id in m.search[{query cat=`node` sort=`-modified`}] %}
            <tr class="{{ id.last_seen|freshness }}" >
                <td>
                    <span class="icon"></span>
                    {{ id.last_seen|date:"Y-m-d" }}
                    <b>{{ id.last_seen|date:"H:i" }}</b>
                </td>
                <td>
                    {{ id.title }}
                </td>
                <td>
                    {{ id.app }}
                </td>
                <td>
                    {{ id.ip }}
                </td>
                <td>
                    &nbsp
                </td>
            </tr>
        {% endfor %}

    </tbody>
</table>
<p class="meta">Last updated {{ now|date:"H:i:s" }}</p>
