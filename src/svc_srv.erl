-module(svc_srv).
-behavior(gen_server).
-export([start_link/0,init/1,handle_call/3,handle_cast/2,incr/0,get/0,clear/0]).
-define(SERVER,?MODULE).

-record(state,{count}).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

init([]) ->
    {ok, #state{count=0}}.

handle_call(incr, _From, #state{count=Count} = _State) ->
    NewState = #state{count=Count+1},
    {reply, {ok, NewState}, NewState};

handle_call(get, _From, State) ->
    {reply, {ok, State}, State};

handle_call(clear, _From, _State) ->
    NewState = #state{count=0},
    {reply, {ok, NewState}, NewState}.

handle_cast(_Msg, State) ->
    {noreply, State}.

incr() ->
    gen_server:call(?SERVER,incr).

get() ->
    gen_server:call(?SERVER,get).

clear() ->
    gen_server:call(?SERVER,clear).
