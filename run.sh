#!/bin/bash
rebar3 compile && erl -pa _build/default/lib/svc/ebin/ -pa _build/default/lib/rebar/ebin/ -eval 'application:start(svc)'

