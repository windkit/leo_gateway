%%
%% src/leo_nfs_mount3_svc was generated by erpcgen (do not edit)
%% date: Aug 9 22:05:26 2014
%%
-module(leo_nfs_mount3_svc).
-include("leo_nfs_mount3.hrl").
-export([mountprog_3/5]).
-export([init/1, handle_call/3, handle_cast/2, 
         handle_info/2, terminate/2]).

init(Args) ->
    leo_nfs_mount3_server:init(Args).

handle_call(Req, From, S) ->
    leo_nfs_mount3_server:handle_call(Req, From, S).

handle_cast(Req, S) ->
    leo_nfs_mount3_server:handle_cast(Req, S).

handle_info(Req, S) ->
    leo_nfs_mount3_server:handle_info(Req, S).

terminate(Reason, S) ->
    leo_nfs_mount3_server:terminate(Reason, S).

mountprog_3(Proc, Bin, Offset, Clnt, State) ->
    case Proc of
        0 ->
            case
                catch
                    leo_nfs_mount3_server:mountproc_null_3(Clnt, State)
            of
                {reply,_Res,NState} ->
                    {success,[],NState};
                Else ->
                    Else
            end;
        1 ->
            {_1,_2} = leo_nfs_mount3_xdr:dec_dirpath(Bin, Offset),
            case
                catch
                    leo_nfs_mount3_server:mountproc_mnt_3(_1,
                                                          Clnt,
                                                          State)
            of
                {reply,_Res,NState} ->
                    {success,
                     leo_nfs_mount3_xdr:enc_mountres3(_Res),
                     NState};
                Else ->
                    Else
            end;
        2 ->
            case
                catch
                    leo_nfs_mount3_server:mountproc_dump_3(Clnt, State)
            of
                {reply,_Res,NState} ->
                    {success,
                     leo_nfs_mount3_xdr:enc_mountbody(_Res),
                     NState};
                Else ->
                    Else
            end;
        3 ->
            {_1,_2} = leo_nfs_mount3_xdr:dec_dirpath(Bin, Offset),
            case
                catch
                    leo_nfs_mount3_server:mountproc_umnt_3(_1,
                                                           Clnt,
                                                           State)
            of
                {reply,_Res,NState} ->
                    {success,[],NState};
                Else ->
                    Else
            end;
        4 ->
            case
                catch
                    leo_nfs_mount3_server:mountproc_umntall_3(Clnt,
                                                              State)
            of
                {reply,_Res,NState} ->
                    {success,[],NState};
                Else ->
                    Else
            end;
        5 ->
            case
                catch
                    leo_nfs_mount3_server:mountproc_export_3(Clnt,
                                                             State)
            of
                {reply,_Res,NState} ->
                    {success,
                     leo_nfs_mount3_xdr:enc_exportnode(_Res),
                     NState};
                Else ->
                    Else
            end
    end.
