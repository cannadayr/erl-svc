%%%-------------------------------------------------------------------
%% @doc svc public API
%% @end
%%%-------------------------------------------------------------------

-module(svc_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    svc_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
