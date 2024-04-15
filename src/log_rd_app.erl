%%%-------------------------------------------------------------------
%% @doc control public API
%% @end
%%%-------------------------------------------------------------------

-module(log_rd_app).
-include("log_rd.hrl").

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    {ok,Pid}=log_rd_sup:start_link(),
    
    file:del_dir_r(?MainLogDir),
    ok=file:make_dir(?MainLogDir),
    [NodeName,_HostName]=string:tokens(atom_to_list(node()),"@"),
    NodeNodeLogDir=filename:join(?MainLogDir,NodeName),
    ok=log:create_logger(NodeNodeLogDir,?LocalLogDir,?LogFile,?MaxNumFiles,?MaxNumBytes),
    {ok,Pid}.

stop(_State) ->
    ok.

%% internal functions
