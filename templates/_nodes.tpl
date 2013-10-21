<table class="data">
    <thead>
        <tr>
            <th width="10%">Seen</th>
            <th width="22%">Hostname</th>
            <th width="30%">App</th>
            <th width="20%">IP</th>
            <th width="1%">&nbsp;</th>
        </tr>
    </thead>
    <tbody>
        {% for id in m.search[{query cat=`node` sort=`-modified`}] %}
            <tr>
                <td>
                    {{ id.last_seen|date:"H:i" }}
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
