
-module(service_nodemonitor_check).
-author("Arjan Scherpenisse <arjan@scherpenisse.net>").

-svc_title("Node monitor check.").
-svc_needauth(false).

-export([process_get/2]).

-include_lib("zotonic.hrl").

process_get(_ReqData, Context0) ->
    Context = z_acl:sudo(Context0),
    case z_context:get_q("hosts", Context) of
        undefined ->
            {error, access_denied, "Missing node"};
        HostsStr ->
            Hosts = string:tokens(HostsStr, ","),
            {UpHosts, DownHosts} = lists:splitwith(fun({_, ok}) -> true; (_) -> false end,
                                  [{H, check(H, Context)} || H <- Hosts]),
            Result = case DownHosts of
                         [] -> ok;
                         _ -> fail
                     end,
            {struct, [{result, Result}, {up, {array, [H||{H,_} <- UpHosts]}}, {down, {array, [H||{H,_} <- DownHosts]}}]}
    end.

check(Host, Context) ->
    Name = iolist_to_binary(["node_", Host]),
    case m_rsc:name_to_id(Name, Context) of
        {ok, Id} ->
            case filter_freshness:freshness(m_rsc:p(Id, last_seen, Context), Context) of
                "fresh" -> ok;
                _ -> fail
            end;
        _ ->
            fail
    end.

             
