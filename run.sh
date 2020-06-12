#!/bin/bash
rebar3 compile && erl -pa _build/default/lib/svc/ebin/ -eval 'application:start(svc)'

