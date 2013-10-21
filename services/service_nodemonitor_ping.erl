
-module(service_nodemonitor_ping).
-author("Arjan Scherpenisse <arjan@scherpenisse.net>").

-svc_title("Node monitor ping.").
-svc_needauth(false).

-export([process_get/2]).

-include_lib("zotonic.hrl").

process_get(_ReqData, Context0) ->
    Context = z_acl:sudo(Context0),
    case z_context:get_q("host", Context) of
        undefined ->
            {error, access_denied, "Missing node"};
        Host ->
            Ip = z_context:get_q("ip", Context, []),
            App = z_context:get_q("app", Context, []),
            Name = iolist_to_binary(["node_", Host]),
            Id = case m_rsc:name_to_id(Name, Context) of
                     {ok, I} -> I;
                     {error, _} ->
                         {ok, I} = m_rsc:insert([{category, node},
                                                 {title, Host},
                                                 {name, Name},
                                                 {is_published, true}], Context),
                         I
                 end,
            m_rsc:update(Id,
                         [{summary, [App, " ", Ip]},
                          {ip, Ip},
                          {app, App},
                          {last_seen, calendar:local_time()}], Context),
            mod_signal:emit({node_update, []}, Context),
            {struct, [{ok, "Thanks."}]}
    end.

