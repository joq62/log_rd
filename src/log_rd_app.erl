%%%-------------------------------------------------------------------
%% @doc control public API
%% @end
%%%-------------------------------------------------------------------

-module(log_rd_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    log_rd_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
