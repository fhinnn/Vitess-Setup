# docker exec -w /vt/src/vitess.io/vitess/examples/local vitess sh -c "bash 201_customer_tablets.sh"

docker exec -w /vt/vtdataroot/vt_0000000200 vitess sh -c "sed -i 's/max_connections = 500/max_connections = 100000/' my.cnf"

docker exec vitess sh -c "mysqlctl --tablet_uid 200 --alsologtostderr shutdown && mysqlctl --tablet_uid 200 --alsologtostderr start" && sleep 10

docker exec vitess sh -c "vtctldclient --server localhost:15999 MoveTables --workflow commerce2customer --target-keyspace customer create --source-keyspace commerce --tables "posts,tags"" && sleep 5
docker exec vitess sh -c "vtctldclient --server localhost:15999 MoveTables --workflow commerce2customer --target-keyspace customer switchtraffic --tablet-types "rdonly,replica"" && sleep 5
docker exec vitess sh -c "vtctldclient --server localhost:15999 MoveTables --workflow commerce2customer --target-keyspace customer switchtraffic --tablet-types primary" && sleep 5
docker exec vitess sh -c "vtctldclient --server localhost:15999 MoveTables --workflow commerce2customer --target-keyspace customer complete"

docker exec -w /vt/src/vitess.io/vitess/examples/common/scripts vitess sh -c "bash vtadmin-down.sh && bash vtadmin-up.sh"