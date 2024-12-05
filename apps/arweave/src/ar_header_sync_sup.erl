-module(ar_header_sync_sup).
-behaviour(supervisor).

-export([start_link/1]).
-export([init/1]).

%%%===================================================================
%%% Public API.
%%%===================================================================

start_link(Args) ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, Args).

%%%===================================================================
%%% Supervisor callbacks.
%%%===================================================================

init(Args) ->
	SupFlags = #{strategy => one_for_one, intensity => 10, period => 1},
	ChildSpec = #{
		id => ar_header_sync,
		start => {ar_header_sync, start_link, [Args]}
	},
	{ok, {SupFlags, [ChildSpec]}}.
