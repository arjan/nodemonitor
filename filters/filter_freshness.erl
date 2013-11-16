-module(filter_freshness).

-export([freshness/2]).

freshness(L, _) ->
    Diff = (calendar:datetime_to_gregorian_seconds(calendar:local_time())
        - calendar:datetime_to_gregorian_seconds(L)) div 3600,
    lager:warning("last_seen: ~p", [Diff]),
    case Diff of
        0 ->
            "fresh";
        _ when Diff =< 4 ->
            "medium";
        _ ->
            "old"
    end.
